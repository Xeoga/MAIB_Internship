# OSPF (Open Shortest Path First)

**OSPF** este un protocol de rutare dinamică de tip *link-state*, standardizat ca **RFC 2328** (versiunea 2 pentru IPv4).  
Folosește algoritmul **Dijkstra (SPF – Shortest Path First)** pentru a calcula cele mai scurte rute într-o rețea autonomă.

---

## Principii fundamentale

- Rulează direct peste IP (Protocol number 89).  
- Rețeaua este împărțită în **arii (areas)** pentru a reduce traficul de actualizare.  
- Fiecare router menține o **bază de date LSDB (Link-State Database)**.  
- Actualizările sunt trimise doar când apar schimbări (nu periodic, ca în RIP).  
- Convergență rapidă și suport pentru **autentificare, VLSM,** și **Load Balancing.**

---

## Structura OSPF

| Tip Router | Descriere |
|-------------|------------|
| Internal Router | Toate interfețele în aceeași arie. |
| Area Border Router (ABR) | Leagă două sau mai multe arii. |
| Backbone Router | Face parte din aria 0 (Backbone). |
| ASBR (Autonomous System Boundary Router) | Conectează OSPF la alte protocoale (RIP, BGP etc.). |

---

## Tipuri de pachete OSPF

| Tip Pachet | Rol |
|-------------|------|
| Hello | Detectează și menține vecinii activi. |
| DBD (Database Description) | Conține rezumatul LSDB. |
| LSR (Link-State Request) | Solicită informații lipsă. |
| LSU (Link-State Update) | Trimite actualizări complete. |
| LSAck (Acknowledgment) | Confirmă primirea unui LSU. |

---

## Metrică (Cost)

Costul OSPF este bazat pe lățimea de bandă a interfeței:
```
Cost = 100 / Bandwidth (în Mbps)
```

| Lățime de bandă | Cost |
|-----------------|------|
| 10 Mbps | 10 |
| 100 Mbps | 1 |
| 1 Gbps | 1 (rotunjit la minim) |

---

## Configurație de bază Cisco

```cisco
Router(config)# router ospf 1
Router(config-router)# network 192.168.1.0 0.0.0.255 area 0
Router(config-router)# passive-interface default
Router(config-router)# no passive-interface GigabitEthernet0/1
```

---

## Verificare

```cisco
show ip ospf neighbor
show ip ospf database
show ip protocols
show ip route ospf
```

---

## Exemple de topologie

```
    [R1]----[R2]----[R3]
      |        \      |
     LAN1     Area 0  LAN2
```

- R1 și R3 sunt routere interne.
- R2 acționează ca ABR între două arii (0 și 1).

---

## Avantaje

- Convergență rapidă.  
- Scalabilitate mare prin arii ierarhice.  
- Suportă autentificare și VLSM.  
- Trimis doar când apar modificări (eficient din punct de vedere al traficului).

---

## Limitări

- Mai complex de configurat decât RIP.  
- Necesită mai multă memorie și CPU (LSDB).  
- Toate routerele dintr-o arie trebuie să aibă aceeași bază LSDB.

---

## Comenzi utile

| Comandă | Scop |
|----------|------|
| show ip ospf neighbor | Afișează vecinii activi |
| show ip ospf interface | Detaliază setările pe interfețe |
| clear ip ospf process | Repornește procesul OSPF |
| debug ip ospf adj | Verifică formarea adiacențelor |
