
# Step 8:  Script Coding Mirroring

Questo repository contiene una raccolta di esercizi pratici di programmazione in Bash, con l'obiettivo di esplorare vari concetti e tecniche utilizzate nella gestione dei sistemi Unix-like. Ogni esercizio si concentra su uno specifico aspetto della programmazione Bash.

## Sommario
1. [Esercizio 1: Cleanup dei Log](#esercizio-1-Cleanup-Dei-Log)
2. [Esercizio 2: Verifica se Sei Root](#esercizio-2-Am-I-Root?)
3. [Esercizio 3: Parametri Posizionali](#esercizio-3-Positional-Parameters)
5. [Esercizio 4: Assegnazione di Variabili Semplici](#esercizio-4-Plain-Variable-Assignment)
6. [Esercizio 5: Exit e Stato di Uscita](#esercizio-5-Exit-Status)
7. [Esercizio 6: Database degli Indirizzi](#esercizio-6-A-Simple-Address-Database)
8. [Esercizio 7: Barra di Progressione](#esercizio-7-A-Simple-Implementation-of-a-Progress-Bar)

---

## Esercizio 1: Cleanup dei Log

### Descrizione

Questo script serve per "pulire" i file di log di sistema. Viene eseguito come root per poter modificare i file sotto `/var/log`.

### Codice

```bash
#!/bin/bash
# cleanup: A script to clean up log files in /var/log

# Run as root, of course.
cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "Log files cleaned up."
```
---


