#!/bin/bash
 
# Call this script with at least 10 parameters, for example
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10       # Assegnazione variabile
 
echo               # Linea vuota
 
echo "The name of this script is \"$0\"." # Stampa con $0 il nome dello script includendo il path se specificato  
# Adds ./ for current directory
echo "The name of this script is \"`basename $0`\"." # Stampa il nome del file dello script in questo caso Positional-Parameters
 
echo
 
if [ -n "$1" ]              # Inizio ciclo if, -n controlla se la stringa è vuota, "$1" Parametro posizionale asegnato che da indietro il primo parametro assegnato 
then
 echo "Parameter #1 is $1"  # Allora, stampa: parametro n°1 è il primo parametro assegnato 
fi
 
if [ -n "$2" ]              # Codizione if, -n controlla che la stringa non sia vuota, $2 è il secondo parametro posizionale assegnato 
then
 echo "Parameter #2 is $2"  # Stampa: parametro n°2 è $2 (secondo parametro posizionale)
fi
 
if [ -n "$3" ]              # Stessa cosa per  il terzo parametro e cosi via..
then
 echo "Parameter #3 is $3"
fi
 
# ...
 
 
if [ -n "${10}" ]  # Ciclo if che imposta una condizione, ovvero: parametri > 9 vengono messi tra parentesi {}
then
 echo "Parameter #10 is ${10}" # Stampa: Parametro 10 è ${10}
fi
 
echo "-----------------------------------"   # Linea divisoria
echo "All the command-line parameters are: "$*" " # Stampa: All the command-line parameters are: $* passa tutti i parametri in un singolo parametro
 
if [ $# -lt "$MINPARAMS" ]  # Ciclo if $# contiene il numero di argomenti passati allo script, -lt operatore di confronto lessthan.
then			    # Quindi: Se il numero di argomenti passati allo script è 'meno dei' parametri assegnati allora lo script stampa: 
  echo                      # Una linea vuota  
  echo "This script needs at least $MINPARAMS command-line arguments!"  # Questo script ha bisnogno almeno di $MINPARAMS(10) argomenti
fi   # Fine ciclo if 
 
echo # Linea vuota
 
exit 0 # exit-status success

