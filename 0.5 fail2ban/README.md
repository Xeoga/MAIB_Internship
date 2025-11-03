# Instalare și Configurare Fail2Ban pentru protecția SSH
Fail2Ban este un serviciu de securitate care protejează serverul împotriva atacurilor de tip brute-force (autentificări repetate eșuate).
Monitorizează logurile sistemului și, dacă detectează prea multe încercări greșite, blochează automat IP-ul atacatorului în firewall (iptables, nftables etc.).
## Install:
```bash
sudo apt install fail2ban -y  
```
## Configuratia:
Fail2Ban are două directoare principale:

/etc/fail2ban/jail.conf — fișierul principal (nu se modifică direct)

/etc/fail2ban/jail.local — fișierul tău personalizat (copie modificabilă)

Configurația de bază (protecție SSH)
Creează fișierul personalizat:
```bash
sudo nano /etc/fail2ban/jail.local
```
Și adaugă următorul conținut:
```bash
[DEFAULT]
bantime  = 1h          # cât timp IP-ul rămâne blocat
findtime = 10m         # perioada de timp în care se numără încercările
maxretry = 3           # număr maxim de încercări greșite
ignoreip = 127.0.0.1/8 10.10.10.0/24  # IP-urile tale de încredere (VPN, LAN)

[sshd]
enabled = true
port    = ssh
filter  = sshd
logpath = /var/log/auth.log
backend = systemd
maxretry = 3
```
## Activare și verificare serviciu
Activează și pornește Fail2Ban:
```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```
## Verificarea jail-urilor active
Listă completă a jail-urilor (serviciilor protejate):
```bash
sudo fail2ban-client status
```
Verifică detaliat doar jail-ul SSH:
```bash
sudo fail2ban-client status sshd
```
