# **STP (Spanning Tree Protocol)**
este un protocol de nivel 2 (Layer 2) care previne **buclele de rețea** atunci când mai multe switch-uri sunt interconectate redundant.  
Scopul lui este să asigure că **există întotdeauna o singură cale activă între două dispozitive**, menținând în același timp redundanța fizică.

STP creează o **topologie logică fără bucle**, numită *spanning tree*.  
El selectează automat un **Root Bridge (Switch principal)** și dezactivează porturile care ar genera bucle.
- Toate switch-urile trimit **BPDU (Bridge Protocol Data Units)** pentru a identifica Root Bridge-ul.
- Fiecare legătură are un **cost STP** asociat (în funcție de viteză).
- Porturile sunt clasificate și activate/dezactivate în funcție de aceste costuri.

## Stările Porturilor în STP
| Stare | Ascultă BPDU? | Învață MAC? | Transmite date? | Timp (secunde) |
|-------|----------------|-------------|-----------------|----------------|
| **Blocking** | Da | Nu | Nu | 20 (Max Age) |
| **Listening** | Da | Nu | Nu | 15 (Forward Delay) |
| **Learning** | Da | Da | Nu | 15 (Forward Delay) |
| **Forwarding** | Da | Da | Da | 0 |
| **Disabled** | Nu | Nu | Nu | 0 (dezactivat manual) |

 ## Tipuri de STP 
| Tip de STP | Standard IEEE | Caracteristici cheie |
|-------------|----------------|----------------------|
| **STP (Original)** | 802.1D | Convergență lentă, o singură instanță pentru toate VLAN-urile (CST). |
| **RSTP** | 802.1w | Convergență rapidă (2–5 secunde). Optimizări în stări și port roles. |
| **PVST+ (Cisco)** | Proprietar | Instanță separată STP per VLAN. Optimizare traficului. |
| **Rapid PVST+ (Cisco)** | Proprietar | Instanță separată RSTP per VLAN – combină viteză + flexibilitate. |
| **MSTP** | 802.1s | Multiple Spanning Tree – grupează VLAN-urile în instanțe (MSTI). |

 ## Exemplu de topologie

```
       [SW1]
       /   \
   1Gb/     \1Gb
    /         \
 [SW2]------[SW3]
       1Gb
```
![alt text](../../src/img/STP_example.png)

## Concepte Cheie

###  Root Bridge Election
- Se alege switch-ul cu **cel mai mic Bridge ID (Prioritate + MAC)**.
- Poți forța un Root Bridge:
```cisco
spanning-tree vlan 1 priority 4096
```

###  Costul căii (Path Cost)
Valoarea este invers proporțională cu viteza legăturii.

| Viteză | Cost STP (802.1D) |
|---------|------------------|
| 10 Mbps | 100 |
| 100 Mbps | 19 |
| 1 Gbps | 4 |
| 10 Gbps | 2 |

> Switch-ul alege întotdeauna calea cu costul total cel mai mic către Root Bridge.

---

##  RSTP (802.1w)

**Rapid Spanning Tree Protocol** este evoluția STP:
- Convergență mult mai rapidă (1–5 secunde).  
- Elimină stările „Listening” și „Blocking”.  
- Introduce roluri noi de porturi:
  - **Alternate Port** – backup pentru Root Port.  
  - **Backup Port** – backup pentru Designated Port.  
- Detectează instant legături point-to-point și poate trece rapid în „Forwarding”.

![alt text](../../src/img/STP_and_RSTP.png)
---

##  Configurație de bază Cisco

```cisco
Switch(config)# spanning-tree mode rapid-pvst
Switch(config)# spanning-tree vlan 1 priority 4096
Switch(config)# spanning-tree portfast
Switch(config)# show spanning-tree
```