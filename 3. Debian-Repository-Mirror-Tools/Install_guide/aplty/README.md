# Instalarea și Testarea aptly
## Pregătirea Sistemului și Instalarea aptly
aptly este un instrument excelent pentru gestionarea depozitelor de pachete Debian/Ubuntu.
## Adaugarea repoului necesare:
Se adaugă sursa oficială a depozitului aptly în lista de surse a sistemului și se importă cheia publică necesară.
```bash
echo "deb [trusted=yes] http://repo.aptly.info/ squeeze main" | sudo tee /etc/apt/sources.list.d/aptly.list
wget -qO - https://www.aptly.info/pubkey.txt | sudo apt-key add -
sudo apt update
```
## Instalam instrumentul:
```bash
sudo apt install aptly -y
# Verificarea:
aptly version
```

## Crearea și Popularea Depozitului Local
Un depozit (repo) aptly acționează ca o colecție de pachete organizate.
```bash
# Creează și intră în directorul de lucru
mkdir -p ~/aptly_repo
cd ~/aptly_repo
# Creează un depozit local aptly
# -comment: Descriere
# -distribution: Numele distribuției (ex: 'noble' pentru Ubuntu 24.04 LTS)
# -component: Numele componentei (ex: 'main')
# test-repo: Numele intern dat depozitului
aptly repo create -comment="Repo local de test" -distribution="noble" -component="main" test-repo
```
Se creează un director de lucru și se inițializează un depozit aptly local, specificând o distribuție și o componentă.

## Adăugarea Pachetelor:
Se adaugă un pachet Debian (`.deb`) existent în depozitul local numit test-repo.
```bash
aptly repo add test-repo /path/to/package.deb
```
## Publicarea (Publishing) Depozitului:
Pentru a evita configurarea cheilor GPG, se poate publica depozitul cu opțiunea de a sări peste semnare. Acest lucru este recomandat doar pentru medii de testare locale.
```bash
# publică fără semnare
aptly publish repo -architectures="amd64" -skip-signing=true test-repo
```
ATENȚIE: În producție, este esențial să se configureze și să se utilizeze semnarea GPG pentru a asigura integritatea și autenticitatea pachetelor.

## Rularea și Accesarea Depozitului Publicat:
```bash
# Rularea serverului pe adresa locală (localhost) și portul 8080
aptly serve -listen=":8080"

# Rularea serverului pe toate interfețele (accesibil de la distanță) și portul 8080
aptly serve -listen="0.0.0.0:8080"
```
## Accesarea Depozitului:
După ce serverul rulează (presupunând că IP-ul serverului este 207.154.213.49), depozitul va fi accesibil la:
| Descriere                      | Adresa URL de Acces                                                                 |
| ------------------------------ | ----------------------------------------------------------------------------------- |
| **Baza Depozitului Publicat**  | [http://207.154.213.49:8080/](http://207.154.213.49:8080/)                         |
| **Locația Indexului Depozitului** | [http://207.154.213.49:8080/dists/noble/main/binary-amd64/Packages.gz](http://207.154.213.49:8080/dists/noble/main/binary-amd64/Packages.gz) |
| **Exemplu de pachet (Nginx)**  | [http://207.154.213.49:8080/pool/main/n/nginx/](http://207.154.213.49:8080/pool/main/n/nginx/) |


Pentru a adăuga acest depozit la un client (ex: o mașină virtuală de test), se adaugă următoarea linie în fișierul `/etc/apt/sources.list.d/local.list`:
```bash
deb http://207.154.213.49:8080 noble main
```
Urmată de un sudo apt update.