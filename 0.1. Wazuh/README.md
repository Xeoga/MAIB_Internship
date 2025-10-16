Acesta o sa fie instalat din `docker-compose` cu urmatoarele configurari:
```yml
# Wazuh App Copyright (C) 2017, Wazuh Inc. (License GPLv2)  
version: '3.7'  
  
services:  
 wazuh.manager:  
   build:  
     context: wazuh-manager/  
     args:  
       WAZUH_VERSION: ${WAZUH_VERSION}  
       WAZUH_TAG_REVISION: ${WAZUH_TAG_REVISION}  
       FILEBEAT_TEMPLATE_BRANCH: ${FILEBEAT_TEMPLATE_BRANCH}  
       WAZUH_FILEBEAT_MODULE: ${WAZUH_FILEBEAT_MODULE}  
   image: wazuh/wazuh-manager:${WAZUH_IMAGE_VERSION}  
   hostname: wazuh.manager  
   restart: always  
   ports:  
     - "1514:1514"  
     - "1515:1515"  
     - "514:514/udp"  
     - "55000:55000"  
   environment:  
     - INDEXER_URL=https://wazuh.indexer:9200  
     - INDEXER_USERNAME=admin  
     - INDEXER_PASSWORD=admin  
     - FILEBEAT_SSL_VERIFICATION_MODE=none  
   volumes:  
     - wazuh_api_configuration:/var/ossec/api/configuration  
     - wazuh_etc:/var/ossec/etc  
     - wazuh_logs:/var/ossec/logs  
     - wazuh_queue:/var/ossec/queue  
     - wazuh_var_multigroups:/var/ossec/var/multigroups  
     - wazuh_integrations:/var/ossec/integrations  
     - wazuh_active_response:/var/ossec/active-response/bin  
     - wazuh_agentless:/var/ossec/agentless  
     - wazuh_wodles:/var/ossec/wodles  
     - filebeat_etc:/etc/filebeat  
     - filebeat_var:/var/lib/filebeat  
  
 wazuh.indexer:  
   build:  
     context: wazuh-indexer/  
     args:  
       WAZUH_VERSION: ${WAZUH_VERSION}  
       WAZUH_TAG_REVISION: ${WAZUH_TAG_REVISION}  
   image: wazuh/wazuh-indexer:${WAZUH_IMAGE_VERSION}  
   hostname: wazuh.indexer  
   restart: always  
   ports:  
     - "9200:9200"  
   environment:  
     - "OPENSEARCH_JAVA_OPTS=-Xms512m -Xmx512m"  
   ulimits:  
     memlock:  
       soft: -1  
       hard: -1  
     nofile:  
       soft: 65536  
       hard: 65536  
  
 wazuh.dashboard:  
   build:  
     context: wazuh-dashboard/  
     args:  
       WAZUH_VERSION: ${WAZUH_VERSION}  
       WAZUH_TAG_REVISION: ${WAZUH_TAG_REVISION}  
       WAZUH_UI_REVISION: ${WAZUH_UI_REVISION}  
   image: wazuh/wazuh-dashboard:${WAZUH_IMAGE_VERSION}  
   hostname: wazuh.dashboard  
   restart: always  
   ports:  
     - 443:443  
   environment:  
     - INDEXER_USERNAME=admin  
     - INDEXER_PASSWORD=admin  
     - SERVER_SSL_ENABLED=false  
     - WAZUH_API_URL=https://wazuh.manager  
   depends_on:  
     - wazuh.indexer  
   links:  
     - wazuh.indexer:wazuh.indexer  
     - wazuh.manager:wazuh.manager  
  
volumes:  
 wazuh_api_configuration:  
 wazuh_etc:  
 wazuh_logs:  
 wazuh_queue:  
 wazuh_var_multigroups:  
 wazuh_integrations:  
 wazuh_active_response:  
 wazuh_agentless:  
 wazuh_wodles:  
 filebeat_etc:  
 filebeat_var:
```
In cazul acesta toate 3 (`manager/index/dashboard`)componente o sa fie instalate pe un host in cazul meu pe local host


1. Update pe VM
```bash
sudo apt update && sudo apt upgrade -y
```
1. Descarcă și instalează agentul
(Pentru Wazuh v4.12, ca managerul tău.)
```bash
curl -sO https://packages.wazuh.com/4.12/wazuh-agent-4.12.0.deb
sudo dpkg -i ./wazuh-agent-4.12.0.deb
```
3. Configurează managerul (IP-ul unde rulează Wazuh Manager)
Editează fișierul:
```bash
sudo nano /var/ossec/etc/ossec.conf
```
Caută secțiunea `<client>` și schimbă linia:
`<address>127.0.0.1</address>`
pune acolo IP-ul mașinii unde rulează Wazuh Manager (dacă VM și managerul sunt pe același host → lasă 127.0.0.1).
4. Activează și pornește agentul
```
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
```
5. Verifică status
```bash
sudo systemctl status wazuh-agent
```

Trebuie să fie active (running).
🔹 În Wazuh Dashboard
    Intră pe https://127.0.0.1 (sau IP-ul serverului cu Docker).
    Mergi la Agents → Agent enrollment.
    Vei vedea agentul Ubuntu cu „Pending”.
    Acceptă-l și după câteva minute vei primi primele loguri.
🔹 Cum rezolvi (instalare corectă agent Wazuh pe Ubuntu)
    Mai întâi, adaugă repository-ul oficial Wazuh și cheia GPG:
    
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list
sudo apt update

    Instalează agentul:

sudo apt install wazuh-agent -y
    Configurează agentul să trimită logurile la manager (IP-ul unde rulează Wazuh Manager în Docker):
sudo nano /var/ossec/etc/ossec.conf
Schimbă secțiunea:
<client>
  <server>
    <address>IP_MANAGER</address>
    <port>1514</port>
    <protocol>tcp</protocol>
  </server>
</client>

👉 Pune în <address> IP-ul unde rulează managerul Wazuh. Dacă agentul și managerul sunt pe aceeași mașină, lasă 127.0.0.1.

    Activează și pornește serviciul:

sudo systemctl daemon-reexec
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

    Verifică statusul:

sudo systemctl status wazuh-agent
Dacă vrei totuși să instalezi manual cu .deb, link-ul corect pentru Ubuntu 20.04 (amd64) e acesta:

curl -O https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.12.0-1_amd64.deb
sudo dpkg -i wazuh-agent_4.12.0-1_amd64.deb


Pentru a afla din care `docker-compose` se ruleaza 
```
sudo docker inspect -f '{{ index .Config.Labels "com.docker.compose.project" }} {{ index .Config.Labels "com.docker.compose.project.config_files" }}' zabbix-traefik-1
```

Pentrul ca sal stopam:
```
sudo docker-compose down
```

https://computingforgeeks.com/run-wazuh-server-in-docker-containers-using-docker-compose/