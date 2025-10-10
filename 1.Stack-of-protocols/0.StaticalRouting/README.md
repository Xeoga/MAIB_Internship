# Routarea statica 
In principiul acesta rutele sunt scrise de administrator cu manele sale deci el ea decizia prin ce interfata si unde sunt rutate pachetele un exemplu.
### Cisco:
```Cisco
R1> enable
R1# configure terminal
R1(config)# ip route <DESTINATIE> <MASk> <NEXT_HOP>
```
Exemplu real:
```Cisco
ip route 192.168.50.0 255.255.255.0 10.0.0.1
```
Trimite traficul către rețeaua 192.168.50.0/24 prin gateway-ul 10.0.0.1

Pentru a verifica rutele adaugate
```Cisco
show ip route
```
### Linux:
```Linux
sudo ip route add <DESTINATIE>/<MASK> via <GATEWAY>
```
Aceasta este o ruta temporat la reboot aceasta se sterge.

Verificam care sunt rutele:
```Linux
ip show route
```
