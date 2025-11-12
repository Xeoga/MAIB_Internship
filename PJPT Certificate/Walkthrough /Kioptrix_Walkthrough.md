# Kioptrix:
Credintiale:
```bash
john:TwoCows2
```
## Exploatarea
### Scanarea porturilor deschise:
Rulam nmap cu urmatoarele flaguri. Aici putem sa adaugam si flagul pentru a detecta versiunele la serviciul `-sV`.
```bash
nmap -sS -T4 -p- -A 192.168.1.24
...
PORT      STATE SERVICE     VERSION
22/tcp    open  ssh         OpenSSH 2.9p2 (protocol 1.99)
80/tcp    open  http        Apache httpd 1.3.20 ((Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b)
111/tcp   open  rpcbind     2 (RPC #100000)
139/tcp   open  netbios-ssn Samba smbd (workgroup: MYGROUP)
443/tcp   open  ssl/https   Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b
32768/tcp open  status      1 (RPC #100024)
...
```
![Kioptrix_Walkthrough-2025-11-12-00-17-43.png](../src/img/Kioptrix_Walkthrough-2025-11-12-00-17-43.png)

Din urmatoarea scanarea posibil puncte slabe
- mod_ssl/2.8.4 OpenSSL/0.9.6b

### HTTP/HTTPS enumeration:
