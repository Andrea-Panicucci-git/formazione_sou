# 🐧 Vagrant + Ansible: Progetto "Ping-Pong Docker" con Echo Server

Questo progetto configura due macchine virtuali Ubuntu 24.04 con **Vagrant**, automatizzando la provisioning con **Ansible** per installare Docker, configurare le chiavi SSH e orchestrare l'avvio e lo spegnimento alternato di container **Echo Server** su entrambi i nodi.

---

## 🧰 Tecnologie Utilizzate

- 🖥️ [Vagrant](https://www.vagrantup.com/)
- 📦 [VirtualBox](https://www.virtualbox.org/)
- 🤖 [Ansible](https://www.ansible.com/)
- 🐳 [Docker](https://www.docker.com/)
- ⏰ Cron (per avviare/spegnere container a intervalli)

---

---

## ⚙️ Funzionalità principali

### 🔁 Due nodi configurati:
📜 File `inventory.ini`

```ini
[nodo1]
192.168.30.22 ansible_user=vagrant ansible_ssh_private_key_file=~/.ssh/id_rsa

[nodo2]
192.168.30.23 ansible_user=vagrant ansible_ssh_private_key_file=~/.ssh/id_rsa
```
---

### 🛠️ Provisioning Ansible

Il playbook `playbook.yml` esegue le seguenti azioni su **entrambi i nodi**:

- 🔐 **Copia la chiave SSH** pubblica per l'accesso senza password
- ♻️ **Aggiorna i pacchetti**
- 🐳 **Installa Docker**
- 🔄 **Avvia e abilita il servizio Docker**
- ⏱️ **Crea due cron job** per avviare e fermare un container Docker alternando l'esecuzione ogni 2 minuti

---

### 🧪 Container Echo Server

L'immagine [`ealen/echo-server`](https://hub.docker.com/r/ealen/echo-server) è un container di test che stampa la richiesta ricevuta. I container vengono gestiti così:

- **nodo1**:
  - Avvio ogni minuto dispari → `docker run -d -p 3000:80 ...`
  - Spegnimento ogni minuto pari → `docker rm -f echo-server`

- **nodo2**:
  - Avvio ogni minuto pari
  - Spegnimento ogni minuto dispari

Questo crea un comportamento "ping-pong" in cui **solo un nodo alla volta esegue il container**.

---

## 📜 File `inventory.ini`

```ini
[nodo1]
192.168.30.22 ansible_user=vagrant ansible_ssh_private_key_file=~/.ssh/id_rsa

[nodo2]
192.168.30.23 ansible_user=vagrant ansible_ssh_private_key_file=~/.ssh/id_rsa
```


