#!/bin/bash

NODO1="192.168.30.20"
NODO2="192.168.30.21"
USER="vagrant"
CONTAINER_NAME="ping-pong"
IMAGE="ealen/echo-server"
DELAY=60

CURRENT_NODE=$NODO1
LOGFILE="/home/vagrant/pingpong.log"

echo "Ping-Pong $(date)" >> "$LOGFILE"

while true; do 
    echo "[$(date)] Avvio del container su: $CURRENT_NODE" | tee -a "$LOGFILE"
    
    # Avvia il container
    ssh ${USER}@${CURRENT_NODE} "docker rm -f ${CONTAINER_NAME} 2>/dev/null; docker run -d --name ${CONTAINER_NAME} ${IMAGE}" >> "$LOGFILE" 2>&1
    
    # Verifica che il container sia in esecuzione
    echo "[$(date)] Verifica che il container sia in esecuzione su: $CURRENT_NODE" | tee -a "$LOGFILE"
    ssh ${USER}@${CURRENT_NODE} "docker ps --filter 'name=${CONTAINER_NAME}' --filter 'status=running'" >> "$LOGFILE" 2>&1
    
    # Messaggio di attesa
    echo "[$(date)] Attendo ${DELAY} secondi prima di passare al nodo successivo" | tee -a "$LOGFILE"
    sleep $DELAY

    # Cambia nodo
    if [ "$CURRENT_NODE" = "$NODO1" ]; then 
        CURRENT_NODE=$NODO2
    else
        CURRENT_NODE=$NODO1
    fi
done
