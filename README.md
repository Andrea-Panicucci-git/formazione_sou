# Step 8 - Script Coding Mirroring

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

Questo script...

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

Questo script...

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

Questo script...

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

Questo script...

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

Questo script...

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

Questo script...

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

Questo script...

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

Questi esercizi...
