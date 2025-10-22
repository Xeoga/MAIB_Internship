# Multicast

**Multicast** este o metodă de transmitere a traficului de la o singură sursă către mai mulți destinatari simultan, 
fără a trimite o copie separată pentru fiecare. Scopul principal este optimizarea lățimii de bandă și reducerea încărcării rețelei.

---

## Adrese multicast

Multicast folosește intervalul de adrese IP:
```
224.0.0.0 – 239.255.255.255
```

| Interval | Descriere |
|-----------|------------|
| 224.0.0.0 – 224.0.0.255 | Rezervat pentru protocoale locale (OSPF, RIP v2, EIGRP). |
| 224.0.1.0 – 238.255.255.255 | Folosit pentru aplicații multicast globale (ex: IPTV, streaming). |
| 239.0.0.0 – 239.255.255.255 | Interval privat (administrativ-scoped multicast). |

---

## Tipuri de trafic

| Tip trafic | Descriere | Exemplu |
|-------------|------------|----------|
| Unicast | 1 → 1 – un singur destinatar | SSH, HTTP |
| Broadcast | 1 → Toți din rețea | ARP, DHCP Discover |
| Multicast | 1 → Grup selectat de destinații | IPTV, OSPF, videoconferință |

---

## Mecanismul de funcționare

1. Sursa trimite pachete către o adresă multicast (ex: 239.1.1.1).  
2. Routerele din rețea creează o arbore de distribuție pentru grupul multicast.  
3. Doar dispozitivele care s-au abonat la acel grup (prin IGMP) primesc pachetele.  
4. Routerele mențin o tabelă cu abonamentele active și forwardează doar unde este nevoie.

---

## Protocoale implicate

| Protocol | Nivel | Rol |
|-----------|--------|-----|
| IGMP (Internet Group Management Protocol) | Host ↔ Router | Gestionează apartenența la grupurile multicast. |
| PIM (Protocol Independent Multicast) | Router ↔ Router | Creează căile de distribuție a traficului multicast. |
| MOSPF | Layer 3 | Extensie multicast a OSPF. |
| MLD (Multicast Listener Discovery) | IPv6 | Echivalentul IGMP pentru IPv6. |

---

## Moduri de operare PIM

| Mod PIM | Descriere | Când se folosește |
|----------|------------|------------------|
| PIM-DM (Dense Mode) | Presupune că toată rețeaua vrea multicast, trimite peste tot și apoi prunează legăturile inutile. | Rețele mici, dense. |
| PIM-SM (Sparse Mode) | Folosește un Rendezvous Point (RP) – traficul ajunge doar unde există cerere. | Rețele mari, cu multe segmente. |
| PIM-SSM (Source-Specific Multicast) | Destinat streamingului – clienții știu exact sursa (S,G). | IPTV, transmisii media. |

---

## IGMP (Internet Group Management Protocol)

IGMP este folosit de hosturi pentru a anunța routerului multicast că doresc să se aboneze sau să se dezaboneze de la un grup.

| Versiune | Caracteristici |
|-----------|----------------|
| IGMPv1 | Simplu, fără mecanisme de raportare avansate. |
| IGMPv2 | Suportă mesaje de leave și timere de interogare. |
| IGMPv3 | Permite abonarea doar la surse specifice (folosit cu PIM-SSM). |

---

## Exemple de utilizare

- Streaming video / IPTV  
- Videoconferințe  
- Transmisie de date în timp real (telemetrie, senzori)  
- Protocoale de rutare (OSPF, EIGRP, RIP v2)  

---

## Comenzi utile (Cisco)

```cisco
show ip igmp groups
show ip mroute
show ip pim interface
debug ip igmp
```

---

## Avantaje

- Economisește lățimea de bandă.  
- Scalabilitate mare pentru transmisii multiple.  
- Trafic optimizat – routerele trimit doar unde există membri activi.  

---

## Limitări

- Complexitate de configurare.  
- Necesită suport hardware/software pentru multicast.  
- Poate fi blocat de unele firewall-uri.  

---
