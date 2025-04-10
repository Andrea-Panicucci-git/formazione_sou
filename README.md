# Step 8 - Script Coding Mirroring

## Introduzione:

Questo repository contiene esercizi introduttivi in Bash:

## Sommario:

1. [Esercizio 1: CleanUp](#Clean-Up)
2. [Esercizio 2: Am I root?](#Am-I-Root?)
3. [Esercizio 3: Positional Parameters](#Posiotional-Parameters)
4. [Esercizio 4: Plain Variable Assignment](#Plain-Variable-Assignment)
5. [Esercizio 5: Exit Status](#Exit-Status)
6. [Esercizio 6: A Simple Address Database](#Simple-Address-Database)
7. [Esercizio 7: A Simple Implementation of a Progress Bar](#Simple-Implementation-of-a-Progress-Bar)


## Esercizio 1: CleanUp

### Descrizione:

Questo script ha l'obiettivo di cancellare i log di sistema generali (contenuti nel file messages) e i log degli accessi (contenuti nel file wtmp), liberando così lo spazio occupato da tali informazioni.

### Codice:

```bash
# Cleanup
# Run as root, of course.
 
cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Log files cleaned up."
```
---

## Esercizio 2: Am I root?

### Descrizione:

Entrambi gli script hanno lo stesso obiettivo: verificare se l'utente che esegue lo script è root.

Primo script:
In questo caso, lo script confronta l'UID dell'utente che sta eseguendo lo script ($UID) con l'UID di root ($ROOT_UID). Se i due valori sono uguali (-eq), lo script stampa il messaggio "You are root".
Secondo script:
Anche in questo script l'obiettivo è verificare se l'utente è root, ma invece di confrontare gli UID, si confrontano i nomi degli utenti: la variabile $ROOTUSER_NAME (che contiene il nome dell'utente root) viene confrontata con il nome dell'utente che sta eseguendo lo script ($username). Se i due nomi coincidono, lo script stampa il messaggio "You are root".

### Codice:

```bash
#!/bin/bash
# am-i-root.sh:   Am I root or not?
 
ROOT_UID=0   # Root has $UID 0.
 
if [ "$UID" -eq "$ROOT_UID" ]  # Will the real "root" please stand up?
then
  echo "You are root."
else
  echo "You are just an ordinary user (but mom loves you just the same)."
fi
 
exit 0
 
# ============================================================= #
# Code below will not execute, because the script already exited.
 
# An alternate method of getting to the root of matters:
 
ROOTUSER_NAME=root
 
username=`id -nu`              # Or...   username=`whoami`
if [ "$username" = "$ROOTUSER_NAME" ]
then
  echo "Rooty, toot, toot. You are root."
else
  echo "You are just a regular fella."
fi
```
---

## Esercizio 3: Positional Parameters

### Descrizione:

Questo script ha l'obiettivo di stampare i primi tre parametri e il decimo parametro passati come argomenti da riga di comando. Lo script procederà a stampare ciascuno di questi parametri su una riga separata, a condizione che siano forniti almeno dieci parametri.

Nel caso in cui non vengano forniti parametri oppure il numero di parametri sia inferiore a dieci, lo script stamperà il messaggio di errore:
```bash
This script needs at least $MINPARAMS command-line arguments!
```
Dove $MINPARAMS rappresenta il numero minimo di parametri richiesti (ovvero 10).

### Codice:

```bash
#!/bin/bash
 
# Call this script with at least 10 parameters, for example
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10
 
echo
 
echo "The name of this script is \"$0\"."
# Adds ./ for current directory
echo "The name of this script is \"`basename $0`\"."
# Strips out path name info (see 'basename')
 
echo
 
if [ -n "$1" ]              # Tested variable is quoted.
then
 echo "Parameter #1 is $1"  # Need quotes to escape #
fi
 
if [ -n "$2" ]
then
 echo "Parameter #2 is $2"
fi
 
if [ -n "$3" ]
then
 echo "Parameter #3 is $3"
fi
 
# ...
 
 
if [ -n "${10}" ]  # Parameters > $9 must be enclosed in {brackets}.
then
 echo "Parameter #10 is ${10}"
fi
 
echo "-----------------------------------"
echo "All the command-line parameters are: "$*""
 
if [ $# -lt "$MINPARAMS" ]
then
  echo
  echo "This script needs at least $MINPARAMS command-line arguments!"
fi 
 
echo
 
exit 0

```
---

## Esercizio 4: Plain Variable Assignment

### Descrizione:

Assegnazioni dirette: Le variabili vengono assegnate direttamente senza l'uso di comandi complessi, semplificando il processo di gestione dei dati all'interno dello script.
Operazioni aritmetiche con il comando let: Viene utilizzato il comando let per eseguire operazioni aritmetiche. Questo comando permette di eseguire calcoli come somma, sottrazione, moltiplicazione, ecc., direttamente sulle variabili.
Cicli for: Lo script sfrutta i cicli for per iterare su una sequenza di valori, consentendo l'esecuzione ripetuta di un blocco di codice.
Input dell'utente tramite il comando read: Il comando read viene utilizzato per acquisire l'input dell'utente e memorizzarlo in una variabile. Questo consente una maggiore interazione e personalizzazione dello script.

### Codice:

```bash
#!/bin/bash
# Naked variables
 
echo
 
# When is a variable "naked", i.e., lacking the '$' in front?
# When it is being assigned, rather than referenced.
 
# Assignment
a=879
echo "The value of \"a\" is $a."
 
# Assignment using 'let'
let a=16+5
echo "The value of \"a\" is now $a."
 
echo
 
# In a 'for' loop (really, a type of disguised assignment):
echo -n "Values of \"a\" in the loop are: "
for a in 7 8 9 11
do
  echo -n "$a "
done
 
echo
echo
 
# In a 'read' statement (also a type of assignment):
echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."
 
echo
 
exit 0
```
---

## Esercizio 5: Exit Status

### Descrizione:

Questo script esegue le seguenti operazioni:

- Stampa del messaggio "hello": Lo script utilizza il comando echo per stampare "hello" sulla console. Il codice di uscita di echo è 0, che indica che il comando è stato eseguito correttamente senza errori.
- Tentativo di eseguire un comando inesistente: Successivamente, lo script tenta di eseguire il comando lskdf, che non esiste. Poiché il comando non viene trovato, il codice di uscita sarà 127, che segnala un errore (comando non trovato).
- Terminazione dello script con un codice di uscita personalizzato: Infine, lo script termina con il codice di uscita 113, che rappresenta una condizione di uscita personalizzata definita dallo script stesso.

### Codice:

```bash
#!/bin/bash
 
echo hello
echo $?    # Exit status 0 returned because command executed successfully.
 
lskdf      # Unrecognized command.
echo $?    # Non-zero exit status returned -- command failed to execute.
 
echo
 
exit 113   # Will return 113 to shell.
           # To verify this, type "echo $?" after script terminates.
 
#  By convention, an 'exit 0' indicates success,
#+ while a non-zero exit value means an error or anomalous condition.
#  See the "Exit Codes With Special Meanings" appendix.
```
---

## Esercizio 6:  A Simple Address Database

### Descrizione:

Questo script utilizza un array associativo per memorizzare gli indirizzi di tre persone. Le chiavi dell'array sono i nomi (Charles, John, Wilma), mentre i valori sono gli indirizzi corrispondenti. Dopo aver memorizzato i dati nell'array, lo script stampa gli indirizzi associati a ciascun nome.

Infine, lo script utilizza il comando:
```bash
echo ${!address[*]}
```
per stampare un elenco di tutte le chiavi dell'array, ossia i nomi delle persone, mostrando così tutte le chiavi (Charles, John, Wilma) che sono state memorizzate nell'array associativo.

### Codice:

```bash
#!/bin/bash4
# fetch_address.sh
 
declare -A address
#       -A option declares associative array.
 
address[Charles]="414 W. 10th Ave., Baltimore, MD 21236"
address[John]="202 E. 3rd St., New York, NY 10009"
address[Wilma]="1854 Vermont Ave, Los Angeles, CA 90023"
 
 
echo "Charles's address is ${address[Charles]}."
# Charles's address is 414 W. 10th Ave., Baltimore, MD 21236.
echo "Wilma's address is ${address[Wilma]}."
# Wilma's address is 1854 Vermont Ave, Los Angeles, CA 90023.
echo "John's address is ${address[John]}."
# John's address is 202 E. 3rd St., New York, NY 10009.
 
echo
 
echo "${!address[*]}"   # The array indices ...
# Charles John Wilma
```
---

## Esercizio 7: A Simple Implementation of a Progress Bar

### Descrizione:

L'obiettivo principale di questo script è mostrare una barra di progresso. Per fare ciò, avvia un processo in background che genera ogni secondo un punto (".") tramite un ciclo infinito while True.

Nel momento in cui viene premuto ^C, viene eseguito il seguente comando:
```bash
trap "echo !; kill -USR1 $pid; wait $pid" EXIT
```
Questo comando invia il segnale SIGUSR1 al processo in esecuzione, terminandolo. Quando il processo riceve il segnale SIGUSR1, esegue un'altra trap che esegue il comando exit, interrompendo così il ciclo infinito.

Se si commenta la riga di comando con trap "echo !; kill -USR1 $pid; wait $pid" EXIT, il ciclo non verrà più interrotto tramite ^C, poiché il segnale SIGUSR1 non verrà più inviato. Di conseguenza, sarà necessario fermare manualmente il processo utilizzando il comando kill.

### Codice:

```bash
#! /bin/bash
# progress-bar2.sh
# Author: Graham Ewart (with reformatting by ABS Guide author).
# Used in ABS Guide with permission (thanks!).
 
# Invoke this script with bash. It doesn't work with sh.
 
interval=1
long_interval=10
 
{
     trap "exit" SIGUSR1
     sleep $interval; sleep $interval
     while true
     do
       echo -n '.'     # Use dots.
       sleep $interval
     done; } &         # Start a progress bar as a background process.
 
pid=$!
trap "echo !; kill -USR1 $pid; wait $pid"  EXIT        # To handle ^C.
 
echo -n 'Long-running process '
sleep $long_interval
echo ' Finished!'
 
kill -USR1 $pid
wait $pid              # Stop the progress bar.
trap EXIT
 
exit $?
```
---
# Conclusioni:

In questi esercizi, abbiamo esplorato concetti fondamentali di scripting Bash: gestione dei file di log, controllo dell'utente root, manipolazione dei parametri da riga di comando, gestione delle variabili, gestione degli exit status, uso degli array associativi e implementazione di una barra di progresso. 
