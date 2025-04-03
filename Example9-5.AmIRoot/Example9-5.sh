#!/bin/bash
# am-i-root.sh:   Am I root or not?
 
ROOT_UID=0   # Root ha $UID 0
 
if [ "$UID" -eq "$ROOT_UID" ]  # condizione if verifica se la variabile $UID è uguale a ROOT_UID 
then
  echo "You are root." # se la condizione if è vera stampa You are root.
else
  echo "You are just an ordinary user (but mom loves you just the same)." # se la condizione if non è vera stampa You are just an odinary user (but mom loves you just the same)
fi # chiusura ciclo if 
 
exit 0 # termina l'esecuzione dello script, eseguitro senza errori
 
# ============================================================= #
# Code below will not execute, because the script already exited.
 
# An alternate method of getting to the root of matters:
 
ROOTUSER_NAME=root # Definizione della variabile
 
username=`id -nu`              # Oppure.. username=`whoami`, assegna alla variabile il nome utente corrente  
if [ "$username" = "$ROOTUSER_NAME" ] # condizione if di confronto 
then
  echo "Rooty, toot, toot. You are root." # Se la condizioner è vera stampa Rooty, toot, toot, You are root.
else
  echo "You are just a regular fella." # Se la condizione è falsa stampa You are just a regular fella 
fi #chiusura ciclo if
