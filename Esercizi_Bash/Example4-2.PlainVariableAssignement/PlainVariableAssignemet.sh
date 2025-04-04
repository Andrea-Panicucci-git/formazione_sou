#!/bin/bash
# Naked variables
 
echo   
 
# When is a variable "naked", i.e., lacking the '$' in front?
# When it is being assigned, rather than referenced.
 
# Assignment
a=879 # Assegnazione della variabile 
echo "The value of \"a\" is $a." # Stampa la variabile a=879
 
# Assignment using 'let'
let a=16+5 # Assegnazione variabile con let per le operazioni aritmetiche 
echo "The value of \"a\" is now $a." # Stampa la variabile a=21
 
echo #stampa una riga vuota per leggibiltà
 
# In a 'for' loop (really, a type of disguised assignment):
echo -n "Values of \"a\" in the loop are: "
for a in 7 8 9 11 # Ciclo for che itera sulla variabile a una sequenza di numeri 
do
  echo -n "$a " # Stampa la varibile a, -n opzione per non andare a capo tra i numeri 
done
 
echo 
echo
 
# In a 'read' statement (also a type of assignment):
echo -n "Enter \"a\" " # Stampa un testo che chiede all'utente di inserire un valore 
read a # Assegnazione input da parte dell'utente, alla variabile a
echo "The value of \"a\" is now $a." # Stampa il nuovo valore letto da read
 
echo
 
exit 0 #termina lo script
