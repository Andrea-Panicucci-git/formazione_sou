#!/bin/bash
# am-i-root.sh:   Am I root or not?
 
ROOT_UID=0   # Root has $UID 0.
 
if [ "$UID" -eq "$ROOT_UID" ]  # Will the real "root" please stand up? # ciclo if che imposta una condizione sull'UID: se UID è equivalente al ROOT_UID 
then 
  echo "You are root." # allora, stampa: Sei root
else
  echo "You are just an ordinary user (but mom loves you just the same)." # differentemente stampa: sei soltanto un user ordinario (ma mamma ti ama lo  stesso)
fi # fine ciclo if 
 
exit 0 # successo dello script
 
# ============================================================= #
# Code below will not execute, because the script already exited.
 
# An alternate method of getting to the root of matters:
 
ROOTUSER_NAME=root # imposta la variabile assegnando ad essa root
 
username=`id -nu`              # Or...   username=`whoami,` specifica in una variabile il nome e l'user UID
if [ "$username" = "$ROOTUSER_NAME" ] # ciclo if che imposta una condizione sulla variabile username creata e la eguaglia al ROOTUSER_NAME 
then
  echo "Rooty, toot, toot. You are root." # se uguali stampa: Rooty, toot , toot. You are root.
else
  echo "You are just a regular fella."  # se diversi stampa: you are just a regular fella 
fi # fine ciclo
