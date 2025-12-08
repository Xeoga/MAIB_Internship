## Ansible:
Instalam `brocade.fos` plaginul pentru Brocade:
```bash
ansible-galaxy collection install brocade.fos
```
Rularea playbook:
```bash
ansible-playbook -i inventory.ini brocade_zoning.yml \
  -e "server_name=VMWCL04N05_fc1 server_pwwn=10:00:70:B7:E4:32:A6:B8"
```