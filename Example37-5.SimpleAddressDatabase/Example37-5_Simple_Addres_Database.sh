#!/bin/bash4
# fetch_address.sh
 
declare -A address  # Declare dichiara variabili e array, l'opzione -A indica un array in cui gli indici sono stringhe e non numeri.

 
address[Charles]="414 W. 10th Ave., Baltimore, MD 21236" # Dichiarazione array 
address[John]="202 E. 3rd St., New York, NY 10009"
address[Wilma]="1854 Vermont Ave, Los Angeles, CA 90023"
 
 
echo "Charles's address is ${address[Charles]}."         # Stampa gli address 
echo "Wilma's address is ${address[Wilma]}."
echo "John's address is ${address[John]}."

 
echo                    # Linuea vuota
 
echo "${!address[*]}"   # Stampa le chiavi dell'array associativo address, in questo caso Charles Wilma John
