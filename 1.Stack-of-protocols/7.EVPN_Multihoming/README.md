# EVPN Multihoming (Ethernet VPN Multihoming)
EVPN Multihoming este o tehnologie modernă folosită în rețelele Data Center și ISP, care permite conectarea unei rețele locale (LAN / server / switch de acces) la mai multe routere de margine (PE), oferind redundanță și echilibrare a traficului (load balancing).

- EVPN (Ethernet VPN) este o extensie a BGP (Border Gateway Protocol) care transportă trafic Layer 2 (MAC) și Layer 3 (IP) peste o rețea MPLS sau VXLAN.
- Multihoming înseamnă că același dispozitiv (ex: un switch sau un server) este conectat simultan la două sau mai multe PE-uri, care împart aceeași instanță EVPN.
- Scopul: reziliență + load-balancing fără bucle Layer 2 (fără Spanning Tree).

