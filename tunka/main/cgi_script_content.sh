#!/bin/bash

export PATH=/bin:/usr/bin:/usr/sbin/chroot
export LANG="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

echo "Content-type: text/html; charset=UTF-8"
echo ""

# POST-Daten einlesen
if [ "$REQUEST_METHOD" = "POST" ]; then
    read -n "$CONTENT_LENGTH" INPUT
else
    INPUT=""
fi

# POST-Daten korrekt extrahieren
TASK=$(echo "$INPUT" | sed -n 's/.*task=\([^&]*\).*/\1/p' | tr '+' ' ')
COMMAND=$(echo "$INPUT" | sed -n 's/.*command=\([^&]*\).*/\1/p' | tr '+' ' ')

# Falls leer, Standardwerte setzen
TASK=${TASK:-"unknown"}
COMMAND=${COMMAND:-"unknown"}


# Erwartete Befehle für die Aufgaben
declare -A TASKS
TASKS["rename_file"]="mv alte_datei.txt neuer_name.txt"
TASKS["change_dir"]="cd /home/user"
TASKS["list_files"]="ls -l"

# Überprüfung der Lösung
if [[ "${TASKS[$TASK]}" == "$COMMAND" ]]; then
    OUTPUT="✅ Richtig! Der Befehl ist korrekt."
else
    OUTPUT="❌ Falsch! Der richtige Befehl wäre: ${TASKS[$TASK]}"
fi

# HTML-Ausgabe
echo "<html>"
echo "<head>"
echo "<meta charset="UTF-8">"
echo "<link rel="stylesheet" href="/css/style.css">"
echo "</head>"
echo "<body>"
echo "<h1>CGI Response</h1>"
echo "<p>Aufgabe: $TASK</p>"
echo "<p>Deine Eingabe: $COMMAND</p>"
echo "<p style='color:blue;'>$OUTPUT</p>"
#echo "<a href='/'>Noch eine Aufgabe lösen</a>"
echo "</body></html>"




#Using apache errorlog as debug cause its easy

echo "input was: $INPUT" >&2 