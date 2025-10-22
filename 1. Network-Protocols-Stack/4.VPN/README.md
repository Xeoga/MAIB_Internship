# VPN (Virtual Private Network)

Un **VPN (Virtual Private Network)** este o tehnologie care permite crearea unei conexiuni securizate și criptate între două sau mai multe rețele printr-o rețea publică (de obicei Internetul).  
Scopul principal este să asigure confidențialitatea, integritatea și autentificarea traficului între puncte aflate la distanță.

---

## Obiectivele principale ale unui VPN

1. Confidențialitate – datele transmise sunt criptate și nu pot fi interceptate.  
2. Integritate – pachetele nu pot fi modificate în timpul transmisiei.  
3. Autentificare – ambele părți verifică identitatea celuilalt capăt al conexiunii.  
4. Acces securizat – permite conectarea sigură la o rețea privată prin Internet.

---

## Tipuri de VPN

| Tip VPN | Descriere | Scop principal |
|----------|------------|----------------|
| Site-to-Site VPN | Conectează două rețele LAN distincte prin Internet. | Integrarea rețelelor între sedii diferite. |
| Remote Access VPN | Permite utilizatorilor să se conecteze la rețeaua organizației de la distanță. | Acces individual securizat. |
| Client-to-Site VPN | Similar cu Remote Access, dar necesită un client software dedicat (ex: OpenVPN, WireGuard). | Acces securizat pentru utilizatori mobili. |

---

## Protocoluri folosite în VPN

| Protocol | Nivel OSI | Caracteristici |
|-----------|------------|----------------|
| IPSec (Internet Protocol Security) | Layer 3 | Standard IETF. Oferă criptare, autentificare și integritate. Poate funcționa în mod Transport sau Tunnel. |
| SSL/TLS (Secure Socket Layer / Transport Layer Security) | Layer 5–7 | Folosit în VPN-uri de tip Remote Access. Traversează firewall-urile ușor. |
| PPTP (Point-to-Point Tunneling Protocol) | Layer 2 | Protocol vechi, ușor de configurat, dar nesigur. |
| L2TP (Layer 2 Tunneling Protocol) | Layer 2 | Folosit împreună cu IPSec pentru criptare. |
| WireGuard | Layer 3 | Protocol modern, rapid, open-source. Ușor de configurat și performant. |
| OpenVPN | Layer 4 | Bazat pe SSL/TLS. Foarte popular în mediile enterprise și open-source. |

---

## Arhitectura unui VPN

Un VPN se bazează pe două componente principale:
- Gateway VPN – dispozitivul care creează tunelul securizat (router/firewall/server).  
- Client VPN – utilizatorul sau rețeaua care se conectează prin acel tunel.  

```
[Client] ⇄ (Internet) ⇄ [VPN Server] ⇄ [Private Network]
```

---

## Mecanisme de securitate

1. Criptare: AES, ChaCha20, 3DES  
2. Autentificare: PSK (Pre-Shared Key), Certificate X.509  
3. Integritate: HMAC, SHA-256  
4. Tunelare: encapsularea traficului IP în pachete securizate

---

## Exemple de configurații comune

### IPSec Site-to-Site (Cisco)
```cisco
crypto isakmp policy 10
 encryption aes
 hash sha256
 authentication pre-share
 group 14
crypto isakmp key cisco123 address 203.0.113.2

crypto ipsec transform-set TS esp-aes esp-sha-hmac
crypto map VPN-MAP 10 ipsec-isakmp
 set peer 203.0.113.2
 set transform-set TS
 match address 101

interface GigabitEthernet0/0
 crypto map VPN-MAP
```

### OpenVPN Server (Linux)
```bash
sudo apt install openvpn -y
sudo cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf /etc/openvpn/
sudo systemctl enable --now openvpn-server@server
```

---

## Avantaje

- Conexiune securizată între sedii și utilizatori.  
- Protejează traficul împotriva interceptării.  
- Permite accesul la resurse interne din exterior.  
- Suport pentru autentificare multiplă (PSK, certificate, LDAP etc.).

---

## Limitări

- Necesită configurare suplimentară și mentenanță.  
- Poate introduce latență din cauza criptării.  
- Unele protocoale sunt incompatibile cu NAT sau firewall-uri stricte.  

---

## Comenzi utile de verificare (Linux)

```bash
ip a show tun0
sudo systemctl status openvpn
sudo wg show
```

---