# Zabbix dashboard and alert
#TODO add n8n server, wazuh server, T-Pot server, and more services here:




## Agent install:
```bash
# 1) Add the Zabbix repository (24.04 / noble)
wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_latest+ubuntu24.04_all.deb
sudo apt update

# 2) Install Agent 2
sudo apt install zabbix-agent2 -y

# 3) Enable & start
sudo systemctl enable --now zabbix-agent2
```
Configul este urmator:
```bash
sudo nano /etc/zabbix/zabbix_agent2.conf
```
Trebuie de schimb urmatoarele configurari:
```bash
Server=10.13.13.2
ServerActive=10.13.13.2
Hostname=VPN-server-PROD
```
De pe server verificam daca hostul este valabil:
```bash
zabbix_get -s 10.10.10.1 -p 10050 -k agent.ping
```
Instalarea pe Arc
```bash
yay -S zabbix-agent
```