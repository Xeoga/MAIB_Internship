## Ansible install:
```bash
# Actualizează
sudo apt update

# (Opțional, mai nou) Ansible din PPA „ansible” – de obicei mai fresh
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Instalează
sudo apt install -y ansible

# Verifică
ansible --version

```
Inventarul implicit: /etc/ansible/hosts.
Exemplu inventar rapid:
```bash
[web]
10.10.10.5 ansible_user=ubuntu
```
### Creem un utilizator `ansible`:
```bash
sudo useradd -m -s /bin/bash ansible
sudo passwd ansible
```
Dadem drepturi de `sudo` pentru acesta
```bash
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
```

### Creează cheia SSH:
```bash
sudo -u ansible ssh-copy-id -i /home/ansible/.ssh/id_ed25519.pub ansible@10.10.10.5
```
Acum pe toate serverile trebuie sa adaugam cheia publica pentru a permite logarea acestei
        Exemplu n8n-server:
        1. Adaugam userul ansible 
        2. In directoriul `/home/ansible/.ssh` creiem fisierul `authorized_keys` si punem acolo public key:


## Rundeck install ([docker-compose](./build-image.yml)):
Acesta este instalat prin docker deoarece este mult mai comod de instalat si manevrat cu el 
La fel fisierul `.env` pentru dockerul dat:
```bash
TZ=Europe/Berlin 
RUNDECK_DOMAIN=rundeck.i9t24.online     # subdomeniu pentru acesta 
CERT_RESOLVER=lehttp   # același resolver ca în Traefik (din stack-ul tău)
```

## Guide pentru interfata grafica:
[Aici incepem](https://www.youtube.com/watch?v=QSY_qw9Buic&list=PLTDT4q38A2NutovIx_IFJev9Z6w68P6Xo)
