#TODO deploy pe un host de la DigitalOceon la fel conectarea la VPN intro retea ca si celelante dispozitive

1) Arhitectură (pe scurt)
- **Wazuh Manager** — colectează/analizează evenimentele de la agenți, API pe 55000/tcp.
- **Wazuh Indexer** (OpenSearch) — stochează datele.
- **Wazuh Dashboard** — UI web pentru vizualizare.
- **Wazuh Agent** — rulează pe endpoint-uri și trimite date la Manager.

Acesta o sa fie instalat din `docker-compose` cu urmatoarele configurari:

[👉 Docker Compose](../src/docker-compose/wazuh_docker-compose.yml)

2) Porturi implicite
- **Manager:** 1514/tcp (event), 1515/tcp (enrollment), 55000/tcp (API), 514/udp (syslog, opțional)
- **Indexer:** 9200/tcp
- **Dashboard:** 443/tcp
> În producție, expun public doar 443 și limitează 1514/1515/55000 la LAN/VPN.

In cazul acesta toate 3 (`manager/index/dashboard`)componente o sa fie instalate pe un host in cazul meu pe local host
Acum tot ce trebuie este sa rulam `docker-compose`:
```bash
sudo docker-compose up 
```
## Install agent pe host:
Descarcă și instalează agentul
(Pentru Wazuh v4.12)
```bash
curl -sO https://packages.wazuh.com/4.12/wazuh-agent-4.12.0.deb
sudo dpkg -i ./wazuh-agent-4.12.0.deb
```
Configurează managerul (IP-ul unde rulează Wazuh Manager)
Editează fișierul:
```bash
sudo nano /var/ossec/etc/ossec.conf
```
Caută secțiunea `<client>` și schimbă linia:
`<address>127.0.0.1</address>`
pune acolo IP-ul mașinii unde rulează Wazuh Manager (dacă VM și managerul sunt pe același host → lasă 127.0.0.1).
Activează și pornește agentul
```bash
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```
Verifică status
```bash
sudo systemctl status wazuh-agent
```

```bash
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list
sudo apt update
```
Instalează agentul:
```bash
sudo apt install wazuh-agent -y
```
Configurează agentul să trimită logurile la manager (IP-ul unde rulează Wazuh Manager în Docker):
```bash
sudo nano /var/ossec/etc/ossec.conf
```
Schimbă secțiunea:
```yml
<client>
  <server>
    <address>IP_MANAGER</address>
    <port>1514</port>
    <protocol>tcp</protocol>
  </server>
</client>
```

```bash
sudo systemctl daemon-reexec
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```
Verificăm statusul:
```bash
sudo systemctl status wazuh-agent
```

Dacă vrei totuși să instalezi manual cu .deb, link-ul corect pentru Ubuntu 20.04 (amd64):
```bash
curl -O https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.12.0-1_amd64.deb
sudo dpkg -i wazuh-agent_4.12.0-1_amd64.deb
```

Pentru a afla din care `docker-compose` se ruleaza 
```bash
sudo docker inspect -f '{{ index .Config.Labels "com.docker.compose.project" }} {{ index .Config.Labels "com.docker.compose.project.config_files" }}' zabbix-traefik-1
```

Pentrul ca sal stopam:
```bash
sudo docker-compose down
```

https://computingforgeeks.com/run-wazuh-server-in-docker-containers-using-docker-compose/