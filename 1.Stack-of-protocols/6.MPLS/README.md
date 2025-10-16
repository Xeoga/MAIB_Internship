# MPLS (Multiprotocol Label Switching)

**MPLS (Multiprotocol Label Switching)** este o tehnologie de rutare care transmite pachetele pe baza **etichetelor (labels)**, nu pe baza adreselor IP.  
Este mai rapidă, mai scalabilă și mai flexibilă decât rutarea IP clasică și permite servicii avansate precum VPN-uri, QoS și Traffic Engineering.

---

## Principiul de funcționare

În loc să verifice tabela de rutare IP pentru fiecare pachet, MPLS folosește **etichetarea** pachetelor.  
Fiecare pachet primește un **label numeric**, iar routerele (numite *Label Switch Routers – LSR*) decid ruta doar pe baza acestui label.

**Etapele principale:**
1. Pachetul intră în rețeaua MPLS la un router de tip **LER (Label Edge Router)**.  
2. LER atașează o etichetă (label) pe baza destinației IP.  
3. Routerele intermediare **LSR** transmit pachetele pe baza etichetei, fără analiză IP.  
4. La ieșirea din rețea, LER elimină eticheta (proces numit *label popping*).

---

## Structura unui label MPLS

Un label MPLS are 32 biți și este inserat între antetul Layer 2 (de exemplu, Ethernet) și antetul Layer 3 (IP).

| Câmp | Dimensiune | Descriere |
|------|-------------|------------|
| **Label** | 20 biți | Identificator unic al fluxului de pachete |
| **EXP (Experimental)** | 3 biți | Folosit pentru QoS (Class of Service) |
| **S (Bottom of Stack)** | 1 bit | Marchează ultimul label din stivă |
| **TTL (Time to Live)** | 8 biți | Similar cu câmpul TTL din IP |

---

## Componentele rețelei MPLS

| Componentă | Rol |
|-------------|-----|
| **LER (Label Edge Router)** | Adaugă (push) și elimină (pop) etichete la marginea rețelei MPLS. |
| **LSR (Label Switch Router)** | Transmite pachetele MPLS în interiorul rețelei pe baza etichetelor. |
| **FEC (Forwarding Equivalence Class)** | Grup de pachete care urmează aceeași cale prin rețea. |
| **LSP (Label Switched Path)** | Calea stabilită prin rețea pe baza etichetelor. |

---

## Protocoale asociate MPLS

| Protocol | Rol |
|-----------|------|
| **LDP (Label Distribution Protocol)** | Distribuie etichete între routere. |
| **RSVP-TE (Resource Reservation Protocol - Traffic Engineering)** | Permite rezervarea de resurse și controlul căii (QoS, prioritate). |
| **BGP/MPLS VPNs** | Permite crearea de VPN-uri Layer 3 între sedii multiple. |

---

## Beneficii principale

- Rutare bazată pe etichete → procesare mai rapidă.  
- Suportă QoS (prioritizarea traficului).  
- Permite crearea de VPN-uri Layer 2 și Layer 3.  
- Scalabilitate mare și convergență rapidă.  
- Suport pentru inginerie de trafic (Traffic Engineering).

---

## Tipuri de VPN-uri MPLS

| Tip VPN | Nivel OSI | Descriere |
|----------|------------|-----------|
| **MPLS Layer 2 VPN (VPLS / VPWS)** | Layer 2 | Emulează un LAN între locații distante. |
| **MPLS Layer 3 VPN (BGP/MPLS VPN)** | Layer 3 | Creează rutare IP separată între clienți (folosește VRF și BGP). |

---

## Exemplu simplificat de topologie

```
 [Site A] -- LER1 == LSR1 == LSR2 == LER2 -- [Site B]
```

- **LER1/LER2:** Routere de margine – adaugă/elimină etichete.  
- **LSR1/LSR2:** Routere din miez – comută pachetele pe baza etichetelor.  
- **LSP:** Calea logică a traficului prin rețeaua MPLS.

---

## Exemplu Cisco de configurare de bază

```cisco
mpls ip
mpls label protocol ldp

interface GigabitEthernet0/0
 ip address 10.0.0.1 255.255.255.0
 mpls ip

interface GigabitEthernet0/1
 ip address 10.0.1.1 255.255.255.0
 mpls ip
```

Verificare:
```cisco
show mpls ldp neighbor
show mpls forwarding-table
```

---

## Avantaje

- Rutare rapidă și scalabilă.  
- Suport pentru VPN-uri multiple și izolate.  
- Inginerie de trafic avansată.  
- QoS integrat pentru prioritizarea pachetelor.  

---

## Limitări

- Configurație complexă.  
- Necesită echipamente compatibile MPLS.  
- Nu este ideal pentru rețele mici.  

---
