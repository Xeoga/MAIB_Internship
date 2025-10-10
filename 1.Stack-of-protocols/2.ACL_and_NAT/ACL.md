# ACL(Access Control List)
Este un set cu regulili pe dispoziti(switch router)  ce trafic este permis si din ce loc(un filtru de retea).

## Tipuri de ACL
#TODO

#### Exemplu (Simplu ACL):
```Cisco
R1(config)# access-list 10 permit 192.168.1.0 0.0.0.255
R1(config)# access-list 10 deny any
R1(config)# interface g0/0
R1(config-if)# ip access-group 10 in
```
Stergerea:
```Cisco
R1(config)# no access-list 10
```
#### Exemplu (Extended ACL):
```Cisco
R1(config)# access-list 101 permit tcp 192.168.10.0 0.0.0.255 any eq 80
R1(config)# access-list 101 deny ip any any
R1(config)# interface g0/0
R1(config-if)# ip access-group 101 out
```
Stergerea:
```Cisco
R1(config)# no access-list 101
```
#### Exemplu (Named ACL):
```Cisco
R1(config)# ip access-list extended WEB_FILTER
R1(config-ext-nacl)# permit tcp any any eq 80
R1(config-ext-nacl)# deny ip any any
R1(config-ext-nacl)# exit

R1(config)# interface g0/0
R1(config-if)# ip access-group WEB_FILTER in
```
Editarea:
```
R1(config)# ip access-list extended WEB_FILTER
R1(config-ext-nacl)# no permit tcp any any eq 80
R1(config-ext-nacl)# permit tcp any any eq 443
```
Stergerea:
```
R1(config)# no ip access-list extended WEB_FILTER
```

## Aplicarea:
- in -> Filtrul se aplică pachetelor care intră în interfață
- out -> Filtrul se aplică pachetelor care ies din interfață