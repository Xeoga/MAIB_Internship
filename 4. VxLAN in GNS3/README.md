# VxLAN:
**VXLAN** (Virtual eXtensible LAN) -  VxLan supports 16,000,000 Layer 2 sergments

## Terminologie:
VXLAN tunnel – Tunel care transportă un cadru Ethernet (Layer 2) peste o rețea IP (Layer 3), permițând extinderea unui VLAN între switch-uri aflate în rețele diferite.

VTEP (VXLAN Tunnel Endpoint) – Dispozitivul (de obicei un switch Leaf) care împachetează traficul în VXLAN și îl despachetează la destinație.

GRE (Generic Routing Encapsulation) – Un tip simplu de tunel care transportă pachete IP peste alte rețele IP, dar fără segmentare VLAN și fără control-plane (spre deosebire de VXLAN).

EVPN (Ethernet VPN) – Un mecanism de control-plane care spune switch-urilor unde se află MAC-urile și IP-urile, evitând broadcast-ul și învățarea prin flood.

MP-BGP (Multiprotocol BGP) – Protocolul folosit pentru a transporta informațiile EVPN între Leaf-uri, adică „poștașul” care distribuie actualizările MAC/IP în fabric.

## Schema:
![alt text](../src/img/vxlan_fabric_vxlan_schema.png)

![alt text](../src/img/vxlan_header_vxlan.png)

https://www.youtube.com/watch?v=80RFILipeng

**Leaf** - Rulează VXLAN Tunnel Endpoints (VTEP) încapsulează și decapsulează traficul VXLAN. Conectează servere, hypervisoare, echipamente de securitate etc.Rulează VXLAN Tunnel Endpoints (VTEP) → încapsulează și decapsulează traficul VXLAN.Pot rula EVPN (Ethernet VPN) pentru control plane, care anunță ce MAC/IP apar în fiecare Leaf.Se ocupă de gateway L3 (routing între segmente VXLAN).

🔹 Exemplu:
Dacă ai un server în VLAN 10 conectat la Leaf1 și altul în VLAN 10 pe Leaf2, traficul dintre ele merge peste VXLAN tunnel.

**Spine** - Sunt switch-urile din stratul central al fabric-ului.

🔹 Exemplu:

Leaf1 ↔ Spine1/Spine2 ↔ Leaf2
Spine-le nu trebuie să știe VLAN-uri → doar rutează IP-urile care transportă encapsularea VXLAN.


### Rezumat vizual:
```bash
          +------------+
          |   Spine1   |
          +------------+
           /    |     \
          /     |      \
+---------+  +---------+  +---------+
|  Leaf1  |  |  Leaf2  |  |  Leaf3  |
+---------+  +---------+  +---------+
    |             |             |
   VM/Server     VM/Server     VM/Server

Leaf: termină VXLAN (VTEP) + gateway + EVPN.
Spine: doar rutare L3 + ECMP (nu termină VXLAN).
```
### Implementarea in GNS3:
Deploying VXLAN with MP-BGP EVPN

    Configure L3 links
    Configure Link-state routing protocol on underlay network (OSPF or IS-IS)
    Configure BGP and set up route reflectors on non-VTEP switches
    Configure Multicast routing (PIM Sparse-mode)
    Enable VXLAN on the switches
    Map VLANs to VXLAN VNIs
    Create Network Virtualization Endpoint (NVE) interfaces for the VNIs
    Configure EVPN on BGP
    Attach devices and set them to the correct VLANs/VNIs




### VXLAN:
 ```Cisco
 feature tunnel
 interface tunnel 0
 tunnel source loopback0
 tunnel destination 10.111.111.91
 ip address 172.16.12.1/24
 ```

Verificam ce functional putem activa:
```
show feature | inc <bgp sau ospf>
```

Enable **bgp** on router:
```
router bgp 65005
```