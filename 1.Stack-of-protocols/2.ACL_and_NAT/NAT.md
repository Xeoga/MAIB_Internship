# NAT (Network Address Translation)

**NAT** permite traducerea adreselor IP private dintr-o rețea internă în adrese IP publice, permițând dispozitivelor interne să acceseze Internetul.

---

## Principiul de bază

Routerul NAT acționează ca un intermediar:
- Modifică antetul IP al pachetelor (adrese sursă/destinație);
- Ține o tabelă de translație pentru a urmări sesiunile;
- Asigură securitatea prin ascunderea adreselor interne.

---

## Tipuri de NAT

| Tip | Descriere | Exemplu |
|------|------------|----------|
| Static NAT | O adresă privată ↔ o adresă publică fixă | Server intern cu IP fix |
| Dynamic NAT | Adresele private sunt mapate dintr-un pool public disponibil | Acces simultan limitat de numărul IP-urilor publice |
| PAT (NAT Overload) | Toate adresele interne folosesc o singură adresă publică, diferențiate prin porturi | Cel mai des folosit pentru acces la Internet |

---

## Exemple Cisco

### Static NAT
```cisco
ip nat inside source static 192.168.1.10 203.0.113.10
interface g0/0
 ip nat inside
interface g0/1
 ip nat outside
```

### Dynamic NAT
```cisco
ip nat pool PUBLIC 203.0.113.100 203.0.113.110 netmask 255.255.255.0
access-list 1 permit 192.168.1.0 0.0.0.255
ip nat inside source list 1 pool PUBLIC
```

### PAT (NAT Overload)
```cisco
access-list 1 permit 192.168.1.0 0.0.0.255
ip nat inside source list 1 interface g0/1 overload
```

---

## Cum funcționează NAT Overload
1. Routerul primește un pachet de la un IP intern (ex: 192.168.1.10).  
2. Schimbă adresa sursă cu adresa publică a interfeței WAN.  
3. Creează o intrare în tabela NAT:  
   ```
   Inside local: 192.168.1.10:12345
   Inside global: 203.0.113.5:45678
   ```
4. Când răspunsul vine, routerul inversează procesul.

---

## Verificare
```cisco
show ip nat translations
show ip nat statistics
```

---

## Avantaje
- Conservă adresele IPv4 publice  
- Oferă securitate prin ascunderea structurii interne  
- Permite conectivitate între rețele private și publice

---

## Limitări
- Poate cauza probleme cu aplicațiile P2P, VoIP  
- Nu funcționează bine cu IPsec (mod transport)  
- Crește ușor latența prin procesul de translație

