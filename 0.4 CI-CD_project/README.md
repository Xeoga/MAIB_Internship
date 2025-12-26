#TODO proiectul de pe gitlab trebuie sa fie pus pe VPN_Zabbix_Pro la acesta trebuie de installat agentul pentru deploy tot ce nimereste pe `main` in gitlab merge prin test la moment hz cum se face lucru dat :(.  Pe urma acesta se face deploy automat pe containerile serverului'

Insall:
```bash
apt install gitlab-runner
```
Configul pentru gitlab-runner:

```bash
nano /etc/gitlab-runner/config.toml
```
Verificare ce configuri sunt puse:
```bash
sudo gitlab-runner verify
sudo gitlab-runner list
```
Pentru configuratia avem fisierul `.gitlab-ci.yml` acest fisier este introdus in repozitoriul ca codul sursa:
```bash
stages: [deploy]

deploy_prod:
  stage: deploy
  rules:
    - if: '$CI_COMMIT_BRANCH == "main"'
  tags: ["shell"]   # pune aici tag-ul pe care îl are runner-ul tău (vezi config.toml)
  script:
    - set -euo pipefail
    - echo "Deploy on $(hostname) at $(date -Is)"
    - cd "$CI_PROJECT_DIR"

    # dacă runner-ul NU face git checkout automat, poți forța:
    # - git fetch --all
    # - git reset --hard "origin/main"

    - docker compose version
    - docker compose pull
    - docker compose up -d --remove-orphans --build

    # opțional: cleanup
    - docker image prune -f
```