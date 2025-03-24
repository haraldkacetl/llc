#!/bin/bash

chroot_path="/var/jail-bin/jail"
history_file="$chroot_path/command_history.txt"

echo "Content-type: text/html; charset=UTF-8"
echo ""

# POST-Daten einlesen
if [ "$REQUEST_METHOD" = "POST" ]; then
    read -n "$CONTENT_LENGTH" INPUT
else
    INPUT=""
fi

decode_url() {
    # URL-Parameter dekodieren und zusätzlich %2F in / umwandeln
    echo -e "$(echo "$1" | sed 's/+/ /g; s/%2F/\//g; s/%\(..\)/\\x\1/g' | xargs -0 printf '%b')"
}

# Extrahiere den eingegebenen Befehl
input_command=$(echo "$INPUT" | awk -F"&" '{for (i=1; i<=NF; i++) if ($i ~ /^input_command=/) print substr($i,15)}')
input_command=$(decode_url "$input_command" | tr -d '\r')  # Windows-Zeilenumbrüche entfernen

# Extrahiere den varpath
varpath=$(echo "$INPUT" | awk -F"&" '{for (i=1; i<=NF; i++) if ($i ~ /^varpath=/) print substr($i,9)}')
varpath=$(decode_url "$varpath" | tr -d '\r')  # Windows-Zeilenumbrüche entfernen

# Falls varpath leer ist, Standardwert setzen
if [[ -z "$varpath" ]]; then
    varpath="/"  # Standard: Root der Jail
fi

# Führe den Befehl in der Jail-Umgebung aus (Kommando in einer einzigen Shell-Session)
command_in_jail="cd \"$varpath\" && { $input_command; echo '<path>'; pwd; echo '</path>'; }"

output=$(sudo chroot "$chroot_path" /bin/bash -c "$command_in_jail" 2>&1)

# Append the output to the history file
echo "$output" >> "$history_file"
#if [[ "s$input_command" != "sclear" ]]; then
#    echo "" > "$chroot_path/command_history.txt"
#fi
# HTML-Ausgabe generieren
#echo "<!DOCTYPE html>"
#echo "<html><head>"
#echo "<meta charset='UTF-8'>"
#echo "<meta charset='UTF-8'></head><body>"
#echo $(cat "$history_file")
echo "<pre>$output</pre>"

# Display history from the file, simulating a terminal

#echo "<pre>"

#if [ -f "$history_file" ]; then
#    tail -n 20 "$history_file"  # Show last 20 lines (you can adjust this number)
#else
#    echo "No history available."
#fi

#echo "</pre>"
#echo "</body></html>"
