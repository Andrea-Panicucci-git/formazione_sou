
# Step 8:  Script Coding Mirroring

Questo repository contiene una raccolta di esercizi pratici di programmazione in Bash, con l'obiettivo di esplorare vari concetti e tecniche utilizzate nella gestione dei sistemi Unix-like. Ogni esercizio si concentra su uno specifico aspetto della programmazione Bash.

## Sommario
1. [Esercizio 1: Cleanup dei Log](#esercizio-1-cleanup-dei-log)
2. [Esercizio 2: Verifica se Sei Root](#esercizio-2-verifica-sei-root)
3. [Esercizio 3: Parametri Posizionali](#esercizio-3-parametri-posizionali)
4. [Esercizio 4: Assegnazione di Variabili Semplici](#esercizio-4-assegnazione-di-variabili-semplici)
5. [Esercizio 5: Exit e Stato di Uscita](#esercizio-5-exit-e-stato-di-uscita)
6. [Esercizio 6: Database degli Indirizzi](#esercizio-6-database-degli-indirizzi)
7. [Esercizio 7: Barra di Progressione](#esercizio-7-barra-di-progressione)

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


