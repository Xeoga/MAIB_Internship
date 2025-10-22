# Rutarea Dinamică

Rutarea dinamică permite routerelor să învețe automat căi către rețele folosind protocoale care schimbă informații între ele.  
Aceste protocoale se adaptează automat la schimbările din topologie, oferind reziliență și administrare minimă manuală.

---

## [OSPF](OSPF.md) ([Open Shortest Path First](https://en.wikipedia.org/wiki/Open_Shortest_Path_First))
Protocol interior de tip *link-state*, care folosește algoritmul **Dijkstra** pentru a calcula cea mai scurtă cale.  
Ideal pentru rețele mari, segmentate în *arii* (areas) și cu convergență rapidă.

---

## [RIP](RIP.md) ([Routing Information Protocol](https://en.wikipedia.org/wiki/Routing_Information_Protocol))
Protocol simplu de tip *distance-vector*, bazat pe numărul de hop-uri.  
Ușor de configurat, dar potrivit doar pentru rețele mici.  
# TODO: 

---

## [EIGRP](EIGRP.md) ([Enhanced Interior Gateway Routing Protocol](https://en.wikipedia.org/wiki/Enhanced_Interior_Gateway_Routing_Protocol))
Protocol hibrid dezvoltat de Cisco, care combină viteza de convergență a *link-state* cu simplitatea *distance-vector*.  
# TODO:
---

## [BGP](BGP.md) ([Border Gateway Protocol](https://en.wikipedia.org/wiki/Border_Gateway_Protocol))
Protocol de rutare exterior, folosit între organizații și ISP-uri.  
Controlează traficul pe Internet în funcție de politici (policy-based routing).  
# TODO:

---

## [IS-IS](IS-IS.md) ([Intermediate System to Intermediate System](https://en.wikipedia.org/wiki/IS-IS))
Protocol *link-state* foarte scalabil, folosit în rețelele backbone ale operatorilor mari.  
# TODO: