# Resurse necesare:

    CPU: 4 core
    RAM: 8 GB
    Disk: 250 GB SSD
    Network: 1 Gbps (ideal), merge și 100 Mbps
    OS: Ubuntu 22.04 LTS (fără GUI)

## Resurse aplicabile 

    CPU: 4 core
    RAM: 5 GB
    Disk: 100 GB
    Network: 1 Gbps
    OS: Ubuntu 22.04 LTS (fără GUI)
https://www.bokehsolutions.com/component/content/article/t-pot-honeynet-how-to-set-up-and-monitor-your-own-network-of-decoys.html?catid=12&Itemid=101

## Install T-Pot:
Pregatim serverul cu updaturile si instalam packetele necesare:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget unzip ca-certificates apt-transport-https software-properties-common
sudo apt install -y util-linux
```
Clonam si pregatim scriptul pentru instalarea mai departa:
```bash
cd /opt
sudo git clone https://github.com/telekom-security/tpotce.git
cd tpotce/iso/installer
sudo ./install.sh --type user
```
Instalarea se executa in felul dat:
```bash
./install.sh -t h -u <user> -p <pass> #pentru interfata grafica
```

...


...

Acesul se face la adresa data `https://<IP>:64297/` si logarea se face la fel aici #TODOOOOOOOOOOOO

[Documentatia este aici](https://github.security.telekom.com/2024/04/honeypot-tpot-24.04-released.html)

T-Pot offers docker images for the following honeypots:

    adbhoney,
    ciscoasa,
    citrixhoneypot,
    conpot,
    cowrie,
    ddospot,
    dicompot,
    dionaea,
    elasticpot,
    endlessh,
    glutton,
    hellpot,
    heralding,
    honeypots,
    honeytrap,
    ipphoney,
    log4pot,
    mailoney,
    medpot,
    redishoneypot,
    sentrypeer,
    snare,
    tanner,
    wordpot

#TODO Instalarea de la 0 pana la 100 ce tip de honeypot sunt. Deploy pe Chuwi cela vechi dar trebuie de rezolvat problema cu power adapter la moment acesta este defect nu incarca :(