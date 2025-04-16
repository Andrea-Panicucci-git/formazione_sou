#!/bin/bash

USER="vagrant"
NODO2="192.168.30.21"
KEYFILE="/home/${USER}/.ssh/id_rsa"
#genera la chiave se non esistente

if [ ! -f "$KEYFILE" ]; then           
    sudo -u $USER ssh-keygen -t rsa -N "" -f "$KEYFILE"
fi 

#copio la chiave sul nodo2
sudo -u $USER sshpass -p "vagrant" ssh-copy-id -f -o StrictHostKeyChecking=no ${USER}@${NODO2}