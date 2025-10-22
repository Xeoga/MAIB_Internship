# EVPN Multihoming (Ethernet VPN Multihoming)

**EVPN Multihoming** este o tehnologie modernă folosită în rețelele de tip Data Center și ISP, care permite conectarea unei rețele locale (LAN, server sau switch de acces) la mai multe routere de margine (PE – Provider Edge) pentru **reziliență** și **echilibrare a traficului (load balancing)**.

---

## Concept de bază

- **EVPN (Ethernet VPN)** este o extensie a **BGP (Border Gateway Protocol)**, care poate transporta trafic Layer 2 (MAC) și Layer 3 (IP) peste rețele MPLS sau VXLAN.  
- **Multihoming** înseamnă că un dispozitiv (server sau switch) este conectat simultan la două sau mai multe PE-uri, care împart aceeași instanță EVPN.  
- Scopul este eliminarea buclelor Layer 2 fără utilizarea STP (Spanning Tree Protocol).

---

## Arhitectura EVPN Multihoming

```
           +------------------+
           |     Core MPLS     |
           +------------------+
              |            |
           +-----+      +-----+
           | PE1 |======| PE2 |
           +-----+      +-----+
              \            /
               \          /
              +------------+
              | Customer CE |
              +------------+
```

- **CE (Customer Edge)** – echipament al clientului (server, switch sau router).  
- **PE (Provider Edge)** – routere de margine ale furnizorului care oferă conectivitate EVPN.  
- Legăturile dintre CE și PE1/PE2 fac parte din același **Ethernet Segment (ES)**.

---

## Componente cheie EVPN

| Componentă | Descriere |
|-------------|------------|
| **ESI (Ethernet Segment Identifier)** | Identifică segmentul comun conectat la mai multe PE-uri. |
| **ES (Ethernet Segment)** | Grupul de linkuri care conectează CE la mai multe PE-uri. |
| **DF (Designated Forwarder)** | PE-ul responsabil de transmiterea traficului broadcast/unicast pentru segmentul respectiv. |
| **BGP EVPN Route Types** | Folosite pentru distribuirea informațiilor Layer 2 și Layer 3 prin BGP. |

---

## Tipuri principale de rute EVPN (BGP)

| Tip | Denumire | Descriere |
|------|-----------|------------|
| **Type 1** | Ethernet Auto-Discovery (EAD) | Identifică segmentele și PE-urile asociate unui ESI. |
| **Type 2** | MAC/IP Advertisement | Distribuie adrese MAC și IP ale clienților. |
| **Type 3** | Inclusive Multicast Ethernet Tag (IMET) | Controlează traficul de tip broadcast/multicast. |
| **Type 4** | Ethernet Segment Route | Anunță informații despre multihoming și DF election. |
| **Type 5** | IP Prefix Route | Distribuie prefixe Layer 3 (rutare IP peste EVPN). |

---

## Mecanisme de redundanță și balansare

1. **Active-Active** – ambele PE-uri (PE1, PE2) transmit simultan traficul; EVPN gestionează buclele și sincronizarea MAC.  
2. **Active-Standby** – doar un PE transmite (DF), celălalt rămâne în așteptare.  
3. **DF Election** – proces automat care decide care PE este Designated Forwarder pentru fiecare VLAN.

---

## Avantaje

- Redundanță nativă între PE-uri fără STP.  
- Load balancing activ pentru trafic Layer 2 și Layer 3.  
- Convergență rapidă la căderea unei legături.  
- Compatibilitate cu MPLS și VXLAN (overlay networks).  
- Simplificare operațională în rețele mari de tip Data Center Fabric.

---

## Protocoale folosite

| Protocol | Rol |
|-----------|------|
| **BGP (Border Gateway Protocol)** | Distribuie informațiile EVPN (MAC/IP, ESI, DF election). |
| **MPLS / VXLAN** | Asigură transportul datelor peste backbone. |
| **ARP Suppression / Proxy ARP** | Reduce broadcast-ul în overlay. |
| **DF Election** | Determină care PE gestionează traficul activ pentru fiecare VLAN. |

---

## Exemplu de flux EVPN Multihoming (Active-Active)

1. CE trimite un pachet către rețea printr-unul dintre linkurile sale.  
2. PE1 și PE2 primesc traficul și sincronizează informațiile MAC prin BGP-EVPN.  
3. Dacă un link sau un PE cade, traficul este automat redirecționat prin celălalt.  

---

## Exemple de implementare (Cisco / Juniper)

### Cisco IOS-XR
```cisco
evpn
 replication-type ingress
!
interface TenGigE0/0/0/1
 evpn ethernet-segment
  identifier type 0 00.11.22.33.44.55.66.77.88.99
!
router bgp 65000
 address-family l2vpn evpn
  neighbor 10.0.0.2 activate
```

### Juniper
```bash
set interfaces ae0 esi 00:11:22:33:44:55:66:77:88:99
set protocols evpn encapsulation mpls
set protocols bgp group EVPN type internal
set protocols bgp group EVPN family evpn signaling
set protocols bgp group EVPN neighbor 10.0.0.2
```

---

## Cazuri de utilizare

- Data Center fabric (leaf-spine cu VXLAN EVPN).  
- ISP/MPLS core cu servicii EVPN Layer 2 și Layer 3.  
- Rețele enterprise mari care necesită redundanță și segmentare logică.  

---

## Avantaje față de soluțiile clasice

| Soluție | Limitare | EVPN îmbunătățește |
|----------|-----------|-------------------|
| **STP (Spanning Tree Protocol)** | Blochează porturi, convergență lentă | Fără bucle, Active-Active |
| **LACP (Port Channel)** | Limitat la un singur dispozitiv | Multi-chassis (PE1 + PE2) |
| **VPLS (Virtual Private LAN Service)** | Control plane complex, scalabilitate limitată | Control plane bazat pe BGP (EVPN) |

---