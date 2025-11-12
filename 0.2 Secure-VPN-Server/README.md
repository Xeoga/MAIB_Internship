
# WireGuard VPN Server on Ubuntu

This guide shows how to install and configure a **WireGuard VPN server** on Ubuntu to create a secure, high-performance VPN tunnel between your server and clients.

---

##  Install WireGuard

```bash
sudo apt update
sudo apt install wireguard -y
```
---

## Generate Server Keys

```bash
sudo mkdir -p /etc/wireguard
wg genkey | tee /etc/wireguard/server_private.key | wg pubkey > /etc/wireguard/server_public.key
chmod 600 /etc/wireguard/server_private.key
```

---

##  Configure the Server

Create the main WireGuard config file:
```bash
sudo nano /etc/wireguard/wg0.conf
```

Paste the following:

```ini
[Interface]
Address = 10.10.10.1/24
ListenPort = 51820
PrivateKey = <server_private_key>

# NAT Rules (replace eth0 with your external network interface)
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
```

Replace `<server_private_key>` with:
```bash
sudo cat /etc/wireguard/server_private.key
```

---

##  Enable IP Forwarding

```bash
sudo nano /etc/sysctl.conf
```
Uncomment or add this line:
```
net.ipv4.ip_forward=1
```
Then apply:
```bash
sudo sysctl -p
```

---

##  Start and Enable WireGuard

```bash
sudo systemctl start wg-quick@wg0
sudo systemctl enable wg-quick@wg0
sudo systemctl status wg-quick@wg0
```

---

## Add a Client

Generate client keys:
```bash
wg genkey | tee client_private.key | wg pubkey > client_public.key
```
Or we can automate the user add with this [script](../src/confs/wireguard_generate_client_conf.sh):

### Client configuration (`client.conf`)

```ini
[Interface]
PrivateKey = <client_private_key>
Address = 10.10.10.2/24
DNS = 1.1.1.1

[Peer]
PublicKey = <server_public_key>
Endpoint = <server_public_ip>:51820
AllowedIPs = 0.0.0.0/0
```

### Add client to server config `/etc/wireguard/wg0.conf`:

```ini
[Peer]
PublicKey = <client_public_key>
AllowedIPs = 10.10.10.2/32
```

Restart WireGuard:
```bash
sudo systemctl restart wg-quick@wg0
```

---

## Verify VPN Connection

```bash
sudo wg
```
You should see your client listed under **peer** with latest handshake timestamps.

---

##  Enable Autostart

```bash
sudo systemctl enable wg-quick@wg0
```

---

## Optional: Allow WireGuard Port in UFW

```bash
sudo ufw allow 51820/udp
sudo ufw allow OpenSSH
sudo ufw enable
```

---

##  Summary

| Component | Description |
|------------|--------------|
| **VPN Software** | WireGuard |
| **Server Interface** | `wg0` |
| **Default Port** | 51820/UDP |
| **Server IP (VPN)** | 10.10.10.1/32 |
| **Client IP (VPN)** | 10.10.10.2/24 |

---

##  Diagram

```text
          +-----------------------------+
          |        WireGuard VPN        |
          +-----------------------------+
          |     10.10.10.1 (Server)     |
                 ↕ Encrypted Tunnel
          |     10.10.10.2 (Client)     |
          +-----------------------------+
```

---
##  Commands Summary

```bash
sudo apt install wireguard -y
wg genkey | tee server_private.key | wg pubkey > server_public.key
sudo nano /etc/wireguard/wg0.conf
sudo systemctl enable --now wg-quick@wg0
sudo wg
```

## Example of conf file
```bash
[Interface]
Address = 10.10.10.2/24
#DNS = 10.10.10.1
PrivateKey = <Client_private_key>

[Peer]
PublicKey = <Server_public_key>
AllowedIPs = 0.0.0.0/0
Endpoint = 207.154.213.49:51820
PersistentKeepalive = 25
```