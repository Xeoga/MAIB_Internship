# Multicast
Este o metodă de transmitere a traficului de la o singură sursă către mai mulți destinatari simultan, fără a trimite o copie separată pentru fiecare.
Scopul este să economisească lățimea de bandă și să optimizeze traficul de rețea.

### Multicast folosește intervalul:
`224.0.0.0 – 239.255.255.255`

### Exemple de utilizare:
- Streaming video / IPTV
- Videoconferințe
- Transmisie de date în timp real
- Protocoale de rutare (OSPF, EIGRP, RIP v2)

| Tip trafic | Descriere | Exemplu |
|------------|------------|------------|
| Unicast  | 1 -> 1  | SSH, HTTP normal  |
| Broadcast  | 1 -> Toti din retea  | ARP, DHCP Discover  |
| Multicast | 1 -> Grup selectat | IPTV, OSPF, Conferinta video |

oioo