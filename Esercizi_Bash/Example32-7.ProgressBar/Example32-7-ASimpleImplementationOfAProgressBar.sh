#! /bin/bash
# progress-bar2.sh
# Author: Graham Ewart (with reformatting by ABS Guide author).
# Used in ABS Guide with permission (thanks!).
 
# Invoke this script with bash. It doesn't work with sh.
 
interval=1               # Assegnazione variabili 
long_interval=10
 
{
     trap "exit" SIGUSR1 				# Trap serve per catturare segnali o eventi di sistema, in questo caso riceve il segnale SIGUSR1 segnale di tipo utente.
     sleep $interval; sleep $interval   		# Sleep serve per sospendere l'esecuzione dello script per un determinato periodo di tempo in questo caso 1 , 10 secondi 
     while true						# Ciclo infinito while che stampa un ounto con una pausa tra ogni stampa, grazie all'operatore & il ciclo viene eseguito in background
     do
       echo -n '.'     
       sleep $interval
     done; } &         
 
pid=$!							# dichiara una variabile pid=PID ($!=PID)
trap "echo !; kill -USR1 $pid; wait $pid"  EXIT         # Trap cattura l'evento Exit che avviene quando temina lo script, echo! stampa l'ultimo comando eseguito
 							# kill -USR1 $pid manda un segnale ad un processo con PID specificato
							# Wait $pid assicura che lo script aspetti che il processo termini prima di completare l'esecuzione

echo -n 'Long-running process '				# Echo -n 'Long-running process', stampa Long-running process senza andare a capo
sleep $long_interval					# sospende l'esecuzione dello script per 10 secondi 
echo ' Finished!'					# Stampa Finished!
 
kill -USR1 $pid						# Manda il segnale SIGUSR1 al processo con PID specificato
wait $pid              					# Aspetta che il processo con quel determinato PID finisca prima di iniziare con il successivo
trap EXIT						# Uscita dal processo
 
exit $?							# Ritorna l' exit-status

