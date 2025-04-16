# 🐧 Vagrant Ping-Pong con Docker tra Due Nodi Ubuntu

Questo progetto usa **Vagrant** per creare due macchine virtuali Ubuntu 24.04 (`nodo1` e `nodo2`) collegate in rete privata. Uno script bash fa "rimbalzare" un container Docker (`ealen/echo-server`) da un nodo all'altro ogni 60 secondi.

---

## 📦 Requisiti

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Terminale Unix-like (Linux, macOS, WSL)

---

#  Descrizione

