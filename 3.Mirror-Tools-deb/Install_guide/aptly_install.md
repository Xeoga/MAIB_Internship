# aptly install + testing
Pregatirea sistemului:
```
echo "deb [trusted=yes] http://repo.aptly.info/ squeeze main" | sudo tee /etc/apt/sources.list.d/aptly.list
wget -qO - https://www.aptly.info/pubkey.txt | sudo apt-key add -
sudo apt update
```

Instalam instrumentul:
```
sudo apt install aptly -y
```
Verificarea:
```
aptly version
```
Creem repoul:
```
mkdir -p ~/aptly_repo
cd ~/aptly_repo
aptly repo create -comment="Repo local de test" -distribution="noble" -component="main" test-repo
```
Adaugarea unui pachet de tip `.deb` in repo manual:
```
aptly repo add test-repo /path/to/package.deb
```
Publicam repoul: #FARA SEMNARE PROBLEMA 
```
# publică fără semnare
aptly publish repo -architectures="amd64" -skip-signing=true test-repo
```
Rularea varianta rapida:
```
aptly serve -listen=":8080"

aptly serve -listen="0.0.0.0:8080"
```
Acesibil la lincul:

http://207.154.213.49:8080
#Pachetul nginx (adaugat anterior)
http://207.154.213.49:8080/pool/main/n/nginx/


