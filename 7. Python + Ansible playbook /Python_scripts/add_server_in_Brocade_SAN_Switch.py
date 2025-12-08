import paramiko
import getpass
import time
import argparse

CFG_NAME = "fcsw1_bc"

#--------------- CLI args ---------------#
def parse_args():
    parser = argparse.ArgumentParser(
        description="Brocade SAN zoning automation (Python + SSH)."
    )
    parser.add_argument("--host", "-H", help="Brocade switch IP/FQDN")
    parser.add_argument("--username", "-u", help="SSH username")
    parser.add_argument("--password", "-p", help="SSH password (insecure on CLI)")
    parser.add_argument("--port", "-P", type=int, help="SSH port, default 22")
    return parser.parse_args()
#----------------------------------------#


#--------------- SSH Connecting Module ---------------#
def run_commands_on_brocade(
    commands: list[str],
    host: str,
    username: str,
    password: str,
    port: int = 22,
) -> None:

    print(f"[INFO] Connecting to Brocade {host}:{port} via SSH...")

    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    # Try SSH connection
    try:
        ssh.connect(
            hostname=host,
            port=port,
            username=username,
            password=password,
            look_for_keys=False,
            allow_agent=False,
            timeout=10,
        )
    except Exception as e:
        print(f"[ERROR] SSH connection failed: {e}")
        return

    try:
        chan = ssh.invoke_shell()
        chan.settimeout(5)

        # Read initial banner (MOTD / prompt)
        try:
            time.sleep(0.3)
            if chan.recv_ready():
                initial_output = chan.recv(4096).decode(errors="ignore")
                if initial_output.strip():
                    print("[DEBUG] Initial switch output:")
                    print(initial_output)
        except Exception:
            pass

        # Execute commands one by one
        for cmd in commands:
            print(f"\n[CMD] {cmd}")
            try:
                chan.send(cmd + "\n")
            except Exception as e:
                print(f"[ERROR] Failed to send command '{cmd}': {e}")
                choice = input(
                    "An error occurred while sending the command. "
                    "Do you want to continue with the next commands? (y/n): "
                ).strip().lower()
                if choice != "y":
                    print("[INFO] Stopping execution due to send error.")
                    break
                else:
                    continue

            # Wait a bit so the device can respond
            time.sleep(0.5)

            buffer = ""
            try:
                # Read everything that is currently available
                while chan.recv_ready():
                    data = chan.recv(4096).decode(errors="ignore")
                    buffer += data
                    time.sleep(0.1)
            except Exception as e:
                print(f"[WARNING] Failed to read output for '{cmd}': {e}")
                choice = input(
                    "Do you want to continue with the next commands? (y/n): "
                ).strip().lower()
                if choice != "y":
                    print("[INFO] Stopping execution due to read error.")
                    break
                else:
                    continue

            if buffer:
                print("[OUT]")
                print(buffer.strip())

                # detect possible error strings in output
                lower_out = buffer.lower()
                if any(
                    kw in lower_out
                    for kw in [
                        "error",
                        "failed",
                        "invalid",
                        "not found",
                        "command not found",
                    ]
                ):
                    print("\n[WARNING] Possible error detected in switch output.")
                    choice = input(
                        "Continue with remaining commands? (y/n): "
                    ).strip().lower()
                    if choice != "y":
                        print("[INFO] Stopping execution as requested by user.")
                        break

    except Exception as e:
        print(f"[ERROR] Error while executing commands on Brocade: {e}")
    finally:
        ssh.close()
        print("\n[INFO] SSH connection closed.")
#-----------------------------------------------------#


#---------- Construct Brocade Commands ----------#
def build_brocade_commands(name: str, pwwn: str) -> list[str]:
    """
    Build zoning commands for a single server.
    NOTE: cfgenable/cfgsave are NOT included here on purpose.
    """

    commands = [
        f'alicreate "{name}", "{pwwn}"',
        f'zonecreate "{name}_HSD01_A_P2", "HSD01_A_P2;{name}"',
        f'zonecreate "{name}_HSD01_B_P2", "HSD01_B_P2;{name}"',
        f'zonecreate "{name}_HSD02_A_P2", "HSD02_A_P2;{name}"',
        f'zonecreate "{name}_HSD02_B_P2", "HSD02_B_P2;{name}"',
        f'zonecreate "{name}_TV5K_N1_N2_P1", "TV5K_N1_P1;TV5K_N2_P1;{name}"',
        (
            f'cfgadd "{CFG_NAME}", '
            f'"{name}_HSD01_A_P2;{name}_HSD01_B_P2;'
            f'{name}_HSD02_A_P2;{name}_HSD02_B_P2;'
            f'{name}_TV5K_N1_N2_P1"'
        ),
    ]

    return commands
#---------------------------------------------------#


#------------ Main Input Logic -------------#
def main():
    print("===== Brocade Zoning Automation =====\n")

    args = parse_args()

    # --- SSH connection details (CLI args OR interactive) ---
    print("=== Brocade SSH connection details ===")

    host = args.host or input("Switch IP/FQDN: ").strip()
    username = args.username or input("Username: ").strip()

    if args.password:
        # ATENȚIE: parola în CLI nu este sigură, dar o folosim dacă a fost dată
        password = args.password
    else:
        password = getpass.getpass("Password: ")

    if args.port:
        port = args.port
    else:
        port_input = input("Port (default 22): ").strip()
        port = int(port_input) if port_input else 22

    print("\n[INFO] SSH credentials saved.\n")

    servers = []

    # --------- Collect server entries (NAME + PWWN) --------- #
    print("=== Enter server zoning data ===")
    print("Type 'done' / 'exit' / 'quit' as NAME to finish.\n")

    while True:
        name = input("NAME: ").strip()

        # finish input loop
        if name.lower() in ("done", "exit", "quit"):
            print("[INFO] Stopping input. Proceeding with collected servers.\n")
            break

        if not name:
            print("[WARNING] NAME is empty. Try again.\n")
            continue

        pwwn = input("PWWN: ").strip()

        if not pwwn:
            print("[WARNING] PWWN is empty. Try again.\n")
            continue

        servers.append({"name": name, "pwwn": pwwn})
        print(f"[INFO] Added entry: {name} -> {pwwn}\n")

    # --- Summary of collected data ---
    print("\n=== Summary of Collected Servers ===")
    if not servers:
        print("No server entries were added. Exiting.")
        return
    else:
        for s in servers:
            print(f"- {s['name']} : {s['pwwn']}")

    # --------- Build all commands for all servers --------- #
    all_commands: list[str] = []
    for s in servers:
        cmds = build_brocade_commands(s["name"], s["pwwn"])
        all_commands.extend(cmds)

    # Add a single cfgenable/cfgsave at the end
    all_commands.append(f'cfgenable "{CFG_NAME}"')
    all_commands.append("cfgsave")

    print("\n[INFO] The following commands will be sent to the switch:")
    for c in all_commands:
        print("  " + c)

    # Single confirmation for all
    confirm = input("\nExecute ALL commands on Brocade? (y/n): ").strip().lower()
    if confirm == "y":
        run_commands_on_brocade(all_commands, host, username, password, port)
    else:
        print("[INFO] Commands NOT executed. Exiting.\n")
#---------------------------------------------------#


if __name__ == "__main__":
    main()
