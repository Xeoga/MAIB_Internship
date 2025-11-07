#!/bin/bash
# ==============================================
# WireGuard client generator for Ubuntu
# ==============================================

WG_INTERFACE="wg0"
WG_DIR="/etc/wireguard"
SERVER_PUBLIC_IP="<public_server_IP>"
SERVER_PORT="51820"
VPN_SUBNET="10.10.10"
CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "Usage: sudo bash $0 <client-name>"
  exit 1
fi

CLIENT_IP=$(grep AllowedIPs ${WG_DIR}/${WG_INTERFACE}.conf | tail -n1 | awk '{print $3}' | cut -d'.' -f4 | cut -d'/' -f1)
if [ -z "$CLIENT_IP" ]; then
  CLIENT_IP=2
else
  CLIENT_IP=$((CLIENT_IP + 1))
fi

echo "🧩 Generating WireGuard client: $CLIENT_NAME (IP: ${VPN_SUBNET}.${CLIENT_IP})"

# Generate client keys
CLIENT_PRIV=$(wg genkey)
CLIENT_PUB=$(echo $CLIENT_PRIV | wg pubkey)
SERVER_PUB=$(cat ${WG_DIR}/server_public.key)

# Create client config
cat > ${WG_DIR}/${CLIENT_NAME}.conf <<EOF
[Interface]
PrivateKey = ${CLIENT_PRIV}
Address = ${VPN_SUBNET}.${CLIENT_IP}/24
DNS = 1.1.1.1

[Peer]
PublicKey = ${SERVER_PUB}
Endpoint = ${SERVER_PUBLIC_IP}:${SERVER_PORT}
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
EOF

# Add client to server config
echo -e "\n[Peer]\nPublicKey = ${CLIENT_PUB}\nAllowedIPs = ${VPN_SUBNET}.${CLIENT_IP}/32" | sudo tee -a ${WG_DIR}/${WG_INTERFACE}.conf >/dev/null

# Restart WireGuard
sudo systemctl restart wg-quick@${WG_INTERFACE}

echo "✅ Client $CLIENT_NAME added successfully."
echo "📁 Config saved to: ${WG_DIR}/${CLIENT_NAME}.conf"
echo "You can send this file to the user for import in WireGuard client."
root@VPN-server-PROD:/etc/wireguard# 
root@VPN-server-PROD:/etc/wireguard# ./generate_client_cong.sh 
Usage: sudo bash ./generate_client_cong.sh <client-name>
root@VPN-server-PROD:/etc/wireguard# ./generate_client_cong.sh misa
🧩 Generating WireGuard client: misa (IP: 10.10.10.4)
✅ Client misa added successfully.
📁 Config saved to: /etc/wireguard/misa.conf
You can send this file to the user for import in WireGuard client.
root@VPN-server-PROD:/etc/wireguard# cat /etc/wireguard/misa.conf
[Interface]
PrivateKey = aGQy/SOtwHkPb+BlmIwJP1aGG1LnW/i4EF+S6p9t6nI=
Address = 10.10.10.4/24
DNS = 1.1.1.1

[Peer]
PublicKey = rOR30MkYodynCLdTDC/TZPmj/29IS22AVc3aRntc1h0=
Endpoint = 207.154.213.49:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
root@VPN-server-PROD:/etc/wireguard# cat generate_client_cong.sh 
#!/bin/bash
# ==============================================
# WireGuard client generator for Ubuntu
# Author: Stas Chirita
# ==============================================

WG_INTERFACE="wg0"
WG_DIR="/etc/wireguard"
SERVER_PUBLIC_IP="207.154.213.49"
SERVER_PORT="51820"
VPN_SUBNET="10.10.10"
CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "Usage: sudo bash $0 <client-name>"
  exit 1
fi

CLIENT_IP=$(grep AllowedIPs ${WG_DIR}/${WG_INTERFACE}.conf | tail -n1 | awk '{print $3}' | cut -d'.' -f4 | cut -d'/' -f1)
if [ -z "$CLIENT_IP" ]; then
  CLIENT_IP=2
else
  CLIENT_IP=$((CLIENT_IP + 1))
fi

echo "🧩 Generating WireGuard client: $CLIENT_NAME (IP: ${VPN_SUBNET}.${CLIENT_IP})"

# Generate client keys
CLIENT_PRIV=$(wg genkey)
CLIENT_PUB=$(echo $CLIENT_PRIV | wg pubkey)
SERVER_PUB=$(cat ${WG_DIR}/server_public.key)

# Create client config
cat > ${WG_DIR}/${CLIENT_NAME}.conf <<EOF
[Interface]
PrivateKey = ${CLIENT_PRIV}
Address = ${VPN_SUBNET}.${CLIENT_IP}/24
DNS = 1.1.1.1

[Peer]
PublicKey = ${SERVER_PUB}
Endpoint = ${SERVER_PUBLIC_IP}:${SERVER_PORT}
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
EOF

# Add client to server config
echo -e "\n[Peer]\nPublicKey = ${CLIENT_PUB}\nAllowedIPs = ${VPN_SUBNET}.${CLIENT_IP}/32" | sudo tee -a ${WG_DIR}/${WG_INTERFACE}.conf >/dev/null

# Restart WireGuard
sudo systemctl restart wg-quick@${WG_INTERFACE}

echo "✅ Client $CLIENT_NAME added successfully."
echo "📁 Config saved to: ${WG_DIR}/${CLIENT_NAME}.conf"
echo "You can send this file to the user for import in WireGuard client."
root@VPN-server-PROD:/etc/wireguard# 
root@VPN-server-PROD:/etc/wireguard# 
root@VPN-server-PROD:/etc/wireguard# cat generate_client_cong.sh 
#!/bin/bash
# ==============================================
# WireGuard client generator for Ubuntu
# Author: Stas Chirita
# ==============================================

WG_INTERFACE="wg0"
WG_DIR="/etc/wireguard"
SERVER_PUBLIC_IP="207.154.213.49"
SERVER_PORT="51820"
VPN_SUBNET="10.10.10"
CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "Usage: sudo bash $0 <client-name>"
  exit 1
fi

CLIENT_IP=$(grep AllowedIPs ${WG_DIR}/${WG_INTERFACE}.conf | tail -n1 | awk '{print $3}' | cut -d'.' -f4 | cut -d'/' -f1)
if [ -z "$CLIENT_IP" ]; then
  CLIENT_IP=2
else
  CLIENT_IP=$((CLIENT_IP + 1))
fi

echo "🧩 Generating WireGuard client: $CLIENT_NAME (IP: ${VPN_SUBNET}.${CLIENT_IP})"

# Generate client keys
CLIENT_PRIV=$(wg genkey)
CLIENT_PUB=$(echo $CLIENT_PRIV | wg pubkey)
SERVER_PUB=$(cat ${WG_DIR}/server_public.key)

# Create client config
cat > ${WG_DIR}/${CLIENT_NAME}.conf <<EOF
[Interface]
PrivateKey = ${CLIENT_PRIV}
Address = ${VPN_SUBNET}.${CLIENT_IP}/24
DNS = 1.1.1.1

[Peer]
PublicKey = ${SERVER_PUB}
Endpoint = ${SERVER_PUBLIC_IP}:${SERVER_PORT}
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
EOF

# Add client to server config
echo -e "\n[Peer]\nPublicKey = ${CLIENT_PUB}\nAllowedIPs = ${VPN_SUBNET}.${CLIENT_IP}/32" | sudo tee -a ${WG_DIR}/${WG_INTERFACE}.conf >/dev/null

# Restart WireGuard
sudo systemctl restart wg-quick@${WG_INTERFACE}

echo "✅ Client $CLIENT_NAME added successfully."
echo "📁 Config saved to: ${WG_DIR}/${CLIENT_NAME}.conf"
echo "You can send this file to the user for import in WireGuard client."