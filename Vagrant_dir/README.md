# 📦 Vagrant Setup con Ubuntu 24.04, Apache2 e Icecast2


Questo progetto utilizza **Vagrant** per creare una macchina virtuale basata su **Ubuntu 24.04**, con installazione automatica di **Apache2** e **Icecast2**

---

## 🚀 Requisiti

Assicurati di avere installato:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

## 📖 Descrizione

All'avvio, la VM installa automaticamente Apache2 e Icecast2, configurando anche il backup del file di configurazione principale di Icecast.

## ⚙️ Funzionalità principali
- Provisioning automatico all’avvio:
```bash
apt-get update
apt-get install -y apache2
sudo apt-get install -y icecast2
sudo cp /etc/icecast2/icecast.xml /etc/icecast2/icecast.xml.bak
sudo service icecast2 restart
```
- Port forwarding per accesso ai servizi locali:
```bash
config.vm.network "forwarded_port", guest: 8000, host: 8000, host_ip: "127.0.0.1"
```
- Rete privata:
```bas
config.vm.network "private_network", ip: "192.168.33.10"
```
## ⚙️ Come avviare la macchina virtuale

1. **Clona questo repository** o scarica il Vagrantfile.
2. Apri un terminale nella cartella dove si trova il `Vagrantfile`.
3. Avvia la VM con:

```bash
vagrant up
```

