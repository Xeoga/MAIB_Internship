La fel o sa fie instalat din docker compose:
```yml 

```

Instalam CLI:
```bash
python3 -m pip install --user pulp-cli pulp-cli-deb
```

Aici `172.22.0.2` este containerul cu `pulp` instalat:
```bash
~/.local/bin/pulp config create \
  --base-url http://172.22.0.2 \
  --username admin \
  --password 'password'
```

Creem un repozitoriu:
```bash
pulp deb repository create --name local-deb
```

Incarcam pachetele in repozitoriu nostru:
```bash
pulp deb repository upload --repository local-deb --file cowsay_3.03+dfsg2-8_all.deb 
```


```bash
[root@8831ff65014d debs]# pulp artifact upload --file /tmp/debs/cowsay_3.03+dfsg2-8_all.deb
```


```bash
curl -u admin:'PAROLA_TA' -H "Content-Type: application/json" \
  -d '{
        "artifact": "/pulp/api/v3/artifacts/0199f144-14e1-7bae-8b1c-302825d256c6/",
        "filename": "cowsay_3.03+dfsg2-8_all.deb"
      }' \
  http://172.22.0.2/pulp/api/v3/content/deb/packages/
```

```bash
[root@8831ff65014d debs]# curl -u admin:'password' -H "Content-Type: application/json" \
  -d '{
        "repository": "/pulp/api/v3/repositories/deb/apt/0199f139-8f5d-7915-bb01-e80cb29ae9b9/",
        "simple": true
      }' \
  http://localhost/pulp/api/v3/publications/deb/apt/
{"task":"/pulp/api/v3/tasks/0199f156-98af-7861-8d5d-c79c4a34aee6/"}
```


```bash
curl -u admin:'password' -H "Content-Type: application/json" \
  -d "{
        \"name\": \"local-deb-distro\",
        \"base_path\": \"local/deb\",
        \"publication\": \"/pulp/api/v3/publications/deb/apt/0199f1c2-.../\"
      }" \
  http://localhost/pulp/api/v3/distributions/deb/apt/
```

```bash
/pulp/api/v3/publications/deb/apt/0199f156-9903-79a6-a544-fff55c9bbfd2/
```

Verificare rapida:
```bash
curl -I http://127.0.0.1:8088/pulp/content/local/deb/
```

Dupa 7 mii de incercari avem si repozitoriul nostru 
![alt text](add_repo_in_pulp.png)

```bash
    "distributions/deb/apt": "http://127.0.0.1:8088/pulp/api/v3/distributions/deb/apt/",
    "publications/deb/apt": "http://127.0.0.1:8088/pulp/api/v3/publications/deb/apt/",
    "remotes/deb/apt": "http://127.0.0.1:8088/pulp/api/v3/remotes/deb/apt/",
    "repositories/deb/apt": "http://127.0.0.1:8088/pulp/api/v3/repositories/deb/apt/",
    "content/deb/generic_contents": "http://127.0.0.1:8088/pulp/api/v3/content/deb/generic_contents/",
    "content/deb/installer_file_indices": "http://127.0.0.1:8088/pulp/api/v3/content/deb/installer_file_indices/",
    "content/deb/installer_packages": "http://127.0.0.1:8088/pulp/api/v3/content/deb/installer_packages/",
    "content/deb/package_indices": "http://127.0.0.1:8088/pulp/api/v3/content/deb/package_indices/",
    "content/deb/package_release_components": "http://127.0.0.1:8088/pulp/api/v3/content/deb/package_release_components/",
    "content/deb/packages": "http://127.0.0.1:8088/pulp/api/v3/content/deb/packages/",
    "content/deb/release_architectures": "http://127.0.0.1:8088/pulp/api/v3/content/deb/release_architectures/",
    "content/deb/release_components": "http://127.0.0.1:8088/pulp/api/v3/content/deb/release_components/",
    "content/deb/release_files": "http://127.0.0.1:8088/pulp/api/v3/content/deb/release_files/",
    "content/deb/releases": "http://127.0.0.1:8088/pulp/api/v3/content/deb/releases/",
    "content/deb/source_indices": "http://127.0.0.1:8088/pulp/api/v3/content/deb/source_indices/",
    "content/deb/source_release_components": "http://127.0.0.1:8088/pulp/api/v3/content/deb/source_release_components/",
    "content/deb/source_packages": "http://127.0.0.1:8088/pulp/api/v3/content/deb/source_packages/",
    "publications/deb/verbatim": "http://127.0.0.1:8088/pulp/api/v3/publications/deb/verbatim/",
```

## Snapsoturi:
#TODO
## Inghetarea repo:
#TODO
## Stable vs Testing
#todo
