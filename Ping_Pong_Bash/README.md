# Vagrant Ping-Pong con Docker tra Due Nodi Ubuntu

Questo progetto usa **Vagrant** per creare due macchine virtuali Ubuntu 24.04 (`nodo1` e `nodo2`) collegate in rete privata. Uno script bash fa "rimbalzare" un container Docker (`ealen/echo-server`) da un nodo all'altro ogni 60 second 

---

## Requisiti

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Terminale Unix-like (Linux, macOS, WSL)

---

## Struttura del progetto:

### Vagrant file:

- Definisce le VM nodo1 e nodo2 con IP privati e installa Docker, sshpass e le necessarie configurazioni.

### pingpong.sh:

Script bash che:
- Avvia il container ping-pong su un nodo.
- Dopo 60 secondi, spegne il container e lo avvia sull'altro nodo.
- Scrive i log su /home/vagrant/pingpong.log.

### setup.sh:

Script per:
- Generare una chiave SSH (se non esistente) per l'utente vagrant.
- Copiare automaticamente la chiave sul secondo nodo (nodo2) usando sshpass per passwordless SSH.

### pingpong.service:

- File di servizio systemd che assicura l'avvio automatico dello script pingpong.sh all'avvio del sistema.

# Intallazione

1. Clonare il repository:

   ```bash
   git clone <repo-url>
   cd <repo-folder>
   ```
2. Avviare le macchine virtuali:

   ```bash
   vagrant up
   ```
Questo comando:

- Crea nodo1 (192.168.30.20) e nodo2 (192.168.30.21)
- Installa Docker su entrambi i nodi
- Configura l'accesso SSH senza password da nodo1 a nodo2
- Avvia il servizio pingpong

## Funzionamento

- nodo1 esegue il servizio pingpong.sh come demone systemd.
- Il container ping-pong (ealen/echo-server) viene avviato su un nodo, attende 60 secondi, poi viene avviato sull'altro nodo.
- Questo processo continua in loop infinito.
- Tutti i log vengono salvati su /home/vagrant/pingpong.log su nodo1.
