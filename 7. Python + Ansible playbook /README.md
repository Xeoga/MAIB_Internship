### Obiectiv:
Este necesară realizarea unui script care să automatizeze și să ușureze procesul de zonare a serverelor noi. Implementarea se va face folosind Python și Ansible. 1. Componenta Python Scop: colectarea datelor despre servere și interacțiunea directă cu echipamentul de rețea Brocade SAN Switch. Cerințe: Implementarea unui ciclu while care: Solicită introducerea denumirii serverului și a valorii PWWN. Exemplu: NAME: VMWCL04N05_fc1 PWWN: 10:00:70:B7:E4:32:A6:B8 NAME: VMWCL04N05_fc1 PWWN: 10:00:70:B7:E4:32:A6:B8 Permite ieșirea din ciclu la introducerea unui cuvânt-cheie, de exemplu Exit. Realizarea conectării prin SSH la echipamentul Brocade SAN Switch. După conectare, scriptul va executa comenzi specificate. Trebuie gestionate și afișate eventualele erori de execuție (output explicit). După rularea comenzilor, conexiunea SSH se va închide automat. 2. Componenta Ansible Scop: automatizarea push-ului de comenzi către echipamentele Brocade, pe baza unui inventory. Cerințe: Analizarea existenței unui modul predefinit pentru Brocade în Ansible (dacă există, utilizarea acestuia). Crearea unui playbook Ansible care: Citește datele din inventory. Execută comenzile de configurare/zoning pe echipamentele Brocade corespunzătoare. 
 
Modulul oficial este `brocade.fos`

### 3. Lista de comenzi Brocade
```bash
#Create Alias
alicreate "VMWCL04N05_fc1", "10:00:70:B7:E4:32:A6:B8"
#Create Zones
zonecreate "VMWCL04N05_fc1_HSD01_A_P2", "HSD01_A_P2;VMWCL04N05_fc1"
zonecreate "VMWCL04N05_fc1_HSD01_B_P2", "HSD01_B_P2;VMWCL04N05_fc1"
zonecreate "VMWCL04N05_fc1_HSD02_A_P2", "HSD02_A_P2;VMWCL04N05_fc1"
zonecreate "VMWCL04N05_fc1_HSD02_B_P2", "HSD02_B_P2;VMWCL04N05_fc1"
#TV5K Multi-Node Zone
zonecreate "VMWCL04N05_fc1_TV5K_N1_N2_P1", "TV5K_N1_P1;TV5K_N2_P1;VMWCL04N05_fc1"
#Add Zones to Configuration
cfgadd "fcsw1_bc", "VMWCL04N05_fc1_HSD01_A_P2;VMWCL04N05_fc1_HSD01_B_P2;VMWCL04N05_fc1_HSD02_A_P2;VMWCL04N05_fc1_HSD02_B_P2;VMWCL04N05_fc1_TV5K_N1_N2_P1"
# Enable Configuration
cfgenable "fcsw1_bc"
# Save Configuration10:00:70:B7:E4:32:A6:B8
cfgsave
```

```bash
10.10.10.10
root
password

VMWCL04N05_fc1
10:00:70:B7:E4:32:A6:B8
```

## 2. Ansible:
Instalam `brocade.fos` plaginul pentru Brocade:
```bash
ansible-galaxy collection install brocade.fos
```
Rularea playbook:
```bash
ansible-playbook -i inventory.ini brocade_zoning.yml \
  -e "server_name=VMWCL04N05_fc1 server_pwwn=10:00:70:B7:E4:32:A6:B8"
```