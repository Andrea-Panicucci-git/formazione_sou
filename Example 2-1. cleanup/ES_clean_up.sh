# Cleanup
# Run as root, of course.
 
cd /var/log # change directory in /var/log

cat /dev/null > messages # svuota il contenuto dei messaggi dei file di log

cat /dev/null > wtmp # svuota i registri dei log

echo "Log files cleaned up." # stampa: Log files cleaned up