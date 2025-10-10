# STP(Spanning  Tree Protocol)
Este un protocol de nivel 2 care elimina buclele de retea in topologii unde sunt mai multe switcheuri conectate.

## Starile de porturi pentur STP
- **Blocking**      -> prevenire bucla -> POrtul nu trasmite pachete
- **Listening**     -> Asteapta informatiii BPDU
- **Learning**      -> Invatare MAC -> Stocheaza adrese, dar nu transmite inca
- **Forwarding**    -> Activ -> Portul transmite normal traficul 
- **Disabled**      -> Oprit -> Portul nu participa in STP

 ## Tipuri de STP 
 - RSTP -> standard rapid, cel mai folosit azi
 - PVRST+(Cisco) -> o instanță STP per VLAN
 - MSTP -> mai multe VLAN-uri per instanță, rapid, standardizat

Vezi [RSTP](#RSTP)
