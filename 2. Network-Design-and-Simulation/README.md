# Introducere
Acest proiect reprezintă o simulare completă a unei infrastructuri de rețea enterprise, construită și testată în **GNS3**, cu integrarea unor servicii precum **OSPF, VLAN, Firewall ASA, SNMP Monitoring și Zabbix**.  
Scopul este de a reproduce o rețea de tip **production-like environment** pentru analiză, testare și demonstrarea competențelor de administrare și securizare.
## Arhitectura rețelei
![alt text](../src/img/network_design_network_schema.png)

### Segmente de rețea
| Legătură     | Rețea           | Dispozitive            | IP-uri                      |
| ------------ | --------------- | ---------------------- | --------------------------- |
| R1 ↔ L3-1    | 192.168.10.0/30 | R1–L3-1                | 192.168.10.1 / 192.168.10.2 |
| R1 ↔ L3-2    | 192.168.1.0/30  | R1–L3-2                | 192.168.1.1 / 192.168.1.2   |
| R1 ↔ R3      | 192.168.1.4/30  | R1–R3                  | 192.168.1.5 / 192.168.1.6   |
| R3 ↔ R2      | 192.168.1.8/30  | R3–R2                  | 192.168.1.9 / 192.168.1.10  |
| VLAN 10      | 10.1.1.0/24     | PC1, PC2               | GW: 10.1.1.1                |
| VLAN 20      | 20.1.1.0/24     | PC3, PC4               | GW: 20.1.1.1                |
| VLAN 30      | 30.1.1.0/24     | PC5, PC6               | GW: 30.1.1.1                |
| VLAN 40      | 40.1.1.0/24     | PC7, PC8               | GW: 40.1.1.1                |
| VLAN Servere | 172.20.0.0/16   | Linux, Windows, Zabbix | GW: 172.20.0.1              |

## Configurație principală
Routere (R1, R2, R3)
- **Routing protocol:** OSPF (area 0)
- **Addressing:** punct-la-punct /30 între routere
- **Funcții suplimentare:** default route + redistribuire statică pentru segmentele interne


## Tabel de configurare IP:
🔹 Toate adresele sunt configurate manual (static) în cadrul unei scheme ierarhice — routerele interconectează segmentele /30 pentru uplink, iar switch-urile Layer 3 gestionează VLAN-urile și gateway-urile locale.
| Dispozitiv                  | Interfață     | Adresă IP / Masca   | Rețea           | Conectat la           | Descriere                           |
| --------------------------- | ------------- | ------------------- | --------------- | --------------------- | ----------------------------------- |
| **R1 (Router Left sections)**        | e0/0          | 192.168.10.1 /30    | 192.168.10.0/30 | CiscoNX-OSvL3-1       | Legătură uplink VLAN-uri stânga     |
|                             | e0/2          | 192.168.1.1 /30     | 192.168.1.0/30  | R3 g1/0               | Legătură OSPF spre R3               |
|                             | —             | —                   | —               | —                     | Alte porturi neutilizate            |
| **R3 (Router Core)**        | g1/0          | 192.168.1.2 /30     | 192.168.1.0/30  | R1 e0/2               | Link spre R1                        |
|                             | g2/0          | 192.168.1.5 /30     | 192.168.1.4/30  | R2 e0/0               | Link spre R2                        |
|                             | g0/0          | 172.20.0.100 /16    | 172.20.0.0/16   | Cloud/Zabbix          | Conectare management                |
| **R2 (Router Right sections)**     | e0/0          | 192.168.1.6 /30     | 192.168.1.4/30  | R3 g2/0               | Legătură spre R3                    |
|                             | e0/1          | —                   | —               | NX-OS L3-4            | Legătură VLAN 10 servere            |
|                             | e0/2, e0/3    | —                   | —               | NX-OS L3-5            | Legături redundante                 |
| **CiscoNX-OSvL3-1**         | e2/3          | 192.168.10.2 /30    | 192.168.10.0/30 | R1 e0/0               | Uplink spre R1                      |
|                             | VLAN 10 (SVI) | 10.1.1.1 /24        | 10.1.1.0/24     | L2-1, PC1–PC2         | Gateway VLAN 10                     |
|                             | VLAN 20 (SVI) | 20.1.1.1 /24        | 20.1.1.0/24     | L2-2, PC3–PC4         | Gateway VLAN 20                     |
| **CiscoNX-OSvL3-2**         | e2/3          | 192.168.10.6 /30    | 192.168.10.4/30 | R1 (backup uplink)    | Link secundar / redundanță          |
|                             | VLAN 30 (SVI) | 30.1.1.1 /24        | 30.1.1.0/24     | L2-3, PC5–PC6         | Gateway VLAN 30                     |
|                             | VLAN 40 (SVI) | 40.1.1.1 /24        | 40.1.1.0/24     | L2-4, PC7–PC8         | Gateway VLAN 40                     |
| **CiscoNX-OSvL3-4**         | e2/1          | 192.168.1.10 /30    | 192.168.1.8/30  | R2 e0/1               | Uplink spre router R2               |
|                             | VLAN 10 (SVI) | 172.20.0.1 /16      | 172.20.0.0/16   | L2-5, LinuxSer        | Gateway servere                     |
| **CiscoNX-OSvL3-5**         | e2/1          | 192.168.1.14 /30    | 192.168.1.12/30 | R2 e0/2               | Redundanță către R2                 |
|                             | VLAN 10 (SVI) | 172.20.0.2 /16      | 172.20.0.0/16   | L2-6, WindowsSrv, PC9 | Gateway servere secundar            |
| **Linux Server**            | e0            | 172.20.0.10 /16     | 172.20.0.0/16   | L2-5                  | Server management                   |
| **Windows Server**          | e0            | 172.20.0.20 /16     | 172.20.0.0/16   | L2-6                  | Server aplicații                    |
| **PC1**                     | e0            | 10.1.1.10 /24       | 10.1.1.0/24     | VLAN 10               | Client VLAN 10                      |
| **PC2**                     | e0            | 10.1.1.11 /24       | 10.1.1.0/24     | VLAN 10               | Client VLAN 10                      |
| **PC3**                     | e0            | 20.1.1.10 /24       | 20.1.1.0/24     | VLAN 20               | Client VLAN 20                      |
| **PC4**                     | e0            | 20.1.1.11 /24       | 20.1.1.0/24     | VLAN 20               | Client VLAN 20                      |
| **PC5**                     | e0            | 30.1.1.10 /24       | 30.1.1.0/24     | VLAN 30               | Client VLAN 30                      |
| **PC6**                     | e0            | 30.1.1.11 /24       | 30.1.1.0/24     | VLAN 30               | Client VLAN 30                      |
| **PC7**                     | e0            | 40.1.1.10 /24       | 40.1.1.0/24     | VLAN 40               | Client VLAN 40                      |
| **PC8**                     | e0            | 40.1.1.11 /24       | 40.1.1.0/24     | VLAN 40               | Client VLAN 40                      |
| **PC9**                     | e0            | 172.20.0.30 /16     | 172.20.0.0/16   | VLAN 10 (dreapta)     | Client servere                      |
| **Cloud1 (Zabbix)**         | br-8b1bacf1cbf    | 172.20.0.6 | 172.20.0.0/16   | VLAN 10 (dreapta)     | Conectare cloud/Zabbix monitorizare |


![alt text](../src/img/network_design_ether_channel.png)
## L3 EtherChannel între Switch-uri Layer 3
Descriere generală

EtherChannel (numit și Port-Channel) este un mecanism de agregare a legăturilor fizice între dispozitive de rețea.
Prin combinarea mai multor interfețe într-una logică unică, obținem:

lățime de bandă sporită (traficul se distribuie pe toate legăturile),

redundanță (dacă un cablu cade, legătura rămâne activă),

gestionare simplificată (o singură interfață logică în loc de 4 separate).

În această topologie, CiscoSwitchL3-1 și CiscoSwitchL3-2 sunt conectate printr-un EtherChannel de nivel 3, care transportă pachete IP fără VLAN-uri.

```bash
CiscoSwitchL3-1               CiscoSwitchL3-2
     e2/13  ======================  e2/13
     e2/14  ======================  e2/14
     e2/15  ======================  e2/15

            Port-Channel1 (L3)
     192.168.10.1/30  <-->  192.168.10.2/30
```
### Configuratia: 
#TODO


## Activam SNMP pe routere:
Pentru a adauga un dispozitiv de retea in **zabbix** avem nevoie sa activam serviciul de SNMP pe acesta.
```bash
snmp-server community public RO
snmp-server location "R1 edge"
snmp-server contact "stas@i9t24.online"
```
![README-2025-11-07-17-36-19.png](../src/img/README-2025-11-07-17-36-19.png)

| Variantă         | Protecție                | Recomandat? |
| ---------------- | ------------------------ | ----------- |
| v1/v2c           | Community string în clar | ❌ slab      |
| v3 auth-no-priv  | autentificare            | ok          |
| **v3 auth-priv** | autentificare + criptare | ✅ ideal     |

Pentru a adauga rutele statice folosim pentru a avea conexiune cu dispozitivele din **GNS3**.
```bash
sudo ip route add 192.168.1.0/30 via 172.20.0.100
sudo ip route add 192.168.1.4/30 via 172.20.0.100   # dacă ai link R3–R2
```
Pentru a salva configurile pe Switch de L3 folosim urmatoare comanda nu si `wr mem`
```bash
#Instand for wr mem:
copy running-config startup-config
```

#TODO add all config file from GNS3
```bash
enable
configure terminal
hostname CiscoSwitchL3-1

# Activăm interfața către R1 (trunk / routed port)
interface e2/3
 no switchport
 ip address 192.168.10.2 255.255.255.252
 no shutdown

# Verificare conectivitate
exit
ping 192.168.10.1
```