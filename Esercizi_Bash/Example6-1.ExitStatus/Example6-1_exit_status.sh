#!/bin/bash
 
echo hello # Stampa hello 
echo $?    # Stampa l'exit status dell'ultimo comando eseguito in questo caso 0 poiché il comando è stato eseguito con successo. 
 
lskdf      # Comando non ricomosciuto dalla shell
echo $?    # Stampa l'exit status in questo  caso 127 poiché la shell non ha riconosciuto il comando, può succedere se il comando per esempio non esiste come in questo caso  
         
 
echo       # Stampa una riga vuota 
 
exit 113   # Ritorna nella sehll l'exit status 113 scelto per la simulazione di errore.
           
