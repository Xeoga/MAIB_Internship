# ACL (Access Control Lists)

**ACL-urile (Access Control Lists)** sunt seturi de reguli aplicate pe interfețele routerelor sau switch-urilor de Layer 3.  
Ele controlează fluxul de trafic, decid ce pachete pot trece și îmbunătățesc securitatea rețelei.

---

## Cum funcționează

Routerul compară fiecare pachet care trece printr-o interfață cu o listă ordonată de reguli (`permit` / `deny`).  
Odată ce o regulă se potrivește, acțiunea este aplicată, iar procesul de verificare se oprește.  
Dacă nu se potrivește nicio regulă, se aplică regula **implicită `deny all`**.

---

## Tipuri de ACL

| Tip ACL | Descriere | Nivel | Exemple |
|----------|------------|--------|----------|
| Standard ACL | Filtrează traficul doar după adresa IP sursă | Layer 3 | `access-list 1 permit 192.168.1.0 0.0.0.255` |
| Extended ACL | Filtrează după IP sursă/destinație, protocol și porturi | Layer 3/4 | `access-list 101 permit tcp 192.168.1.0 0.0.0.255 any eq 80` |
| Named ACL | ACL cu nume în loc de număr, mai ușor de întreținut | — | `ip access-list extended WEB-TRAFFIC` |

---

## Exemple Cisco

### ACL Standard
```cisco
Router(config)# access-list 1 permit 192.168.1.0 0.0.0.255
Router(config)# interface GigabitEthernet0/0
Router(config-if)# ip access-group 1 in
```

### ACL Extins
```cisco
Router(config)# access-list 100 deny tcp any any eq 23
Router(config)# access-list 100 permit ip any any
Router(config)# interface GigabitEthernet0/0
Router(config-if)# ip access-group 100 in
```

### Named ACL
```cisco
Router(config)# ip access-list extended BLOCK-FTP
Router(config-ext-nacl)# deny tcp any any eq 21
Router(config-ext-nacl)# permit ip any any
Router(config)# interface g0/0
Router(config-if)# ip access-group BLOCK-FTP in
```

---

## Principii fundamentale
- Ordinea regulilor este esențială — verificarea se face secvențial.  
- Ultima regulă este implicită: `deny all`.  
- Poți aplica ACL pe intrare (in) sau ieșire (out).  
- ACL-urile se folosesc și pentru QoS, NAT, filtrare SNMP etc.

---

## Verificare
```cisco
show access-lists
show ip interface GigabitEthernet0/0
```

---

## Scopul
- Controlul accesului la resurse.  
- Limitarea traficului nedorit.  
- Îmbunătățirea securității perimetrale.

---
