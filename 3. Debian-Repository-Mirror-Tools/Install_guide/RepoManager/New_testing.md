# RepoManager + Nginx (reverse proxy)


## Structura folderelor pe server:
Se utilizează structura standardizată din /opt pentru claritate, mentenanță și backup facil:
```bash
/opt/repomanager/
├── data/              # date interne ale aplicației (DB & state)
├── repo/              # depozite publicate (pachete reale)
├── nginx/
│   └── conf.d/        # configurarea Nginx
└── certs/             # certificate pentru TLS (dacă sunt interne)
```

## Docker-compose:
[Prezen aici:](../../../src/docker-compose/repomanager+nginx-docker-compose.yml)


## nginx config:
[Conținut:](../../../src/confs/nginx+repomanager.conf)

Justificări tehnice:
| Config                                      | Motiv                                                            |
| ------------------------------------------- | ---------------------------------------------------------------- |
| `http2 on;`                                 | Utilizează directiva modernă, evitând avertismentul „deprecated” |
| `large_client_header_buffers` în `server{}` | Nu este permisă în `location{}` conform standardelor Nginx       |
| `proxy_read_timeout 600s`                   | Necesare pentru sincronizări de pachete mari                     |
| `client_max_body_size 64m`                  | Permite upload de pachete interne semnificative                  |

#TODO mirror real snapshot si asa mai departte
