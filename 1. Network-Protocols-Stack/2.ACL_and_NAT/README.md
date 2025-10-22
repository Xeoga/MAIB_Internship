# [1. ACL (Access Control Lists)](ACL.md)
**ACL-urile** sunt seturi de reguli (filtre) aplicate pe interfețele routerelor sau switch-urilor de Layer 3, folosite pentru a controla fluxul de trafic și a îmbunătăți securitatea rețelei.

**Cum Lucrează:**
O ACL examinează pachetele de date pe măsură ce acestea trec printr-un dispozitiv și le compară cu o listă ordonată de permisiuni (`permit`) sau interdicții (`deny`). Odată ce un pachet se potrivește cu o regulă, acea acțiune este aplicată, iar procesul de verificare se oprește.

**Principiul Fundamental:**
Fiecare ACL se termină cu o regulă implicită de **`deny all`** (interzice tot), invizibilă, care blochează orice trafic care nu a fost permis explicit.

# [2. NAT (Network Address Translation)](NAT.md)
**NAT** este un proces prin care adresele IP private dintr-o rețea internă sunt traduse în una sau mai multe adrese IP publice înainte ca traficul să părăsească rețeaua locală și să ajungă pe internet.

**Cum Lucrează:**
NAT funcționează ca un intermediar, modificând informațiile de adresare (antetul pachetului IP) pentru a permite mai multor dispozitive dintr-o rețea privată să partajeze o singură adresă IP publică (în cazul NAT Overload/PAT). Menține o **tabelă de translație** pentru a urmări sesiunile de trafic și a ști unde să trimită răspunsurile primite de pe internet.

**Scopul Fundamental:**
Conservarea adreselor IP publice (IPv4) și asigurarea securității prin ascunderea structurii interne a rețelei.
