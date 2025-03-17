#!/bin/bash

chroot_path="/var/jail-bin/jail"


#wmi=$(whoami)
#echo "$wmi"
echo "Content-type: text/html; charset=UTF-8"
echo ""

# POST-Daten einlesen
if [ "$REQUEST_METHOD" = "POST" ]; then
    read -n "$CONTENT_LENGTH" INPUT
else
    INPUT=""
fi

decode_url() {
    echo -e "$(echo "$1" | sed 's/+/ /g; s/%\(..\)/\\x\1/g' | xargs -0 printf '%b')"
}

# Extrahiere den eingegebenen Befehl
input_command=$(echo "$INPUT" | awk -F"&" '{for (i=1; i<=NF; i++) if ($i ~ /^input_command=/) print substr($i,15)}')
input_command=$(decode_url "$input_command")



# Führe den Befehl in der Jail-Umgebung aus

echo "Benutzer-ID: $(id)"
input_command=$(echo "$input_command && echo '<path>' && pwd && echo '</path>'")
command_in_jail="sudo chroot $chroot_path /bin/bash -c \"$input_command\""
echo "execution $command_in_jail"
output=$(eval "$command_in_jail" 2>&1)

# HTML-Ausgabe generieren
echo "<html><head><meta charset='UTF-8'></head><body>"
echo "<pre>$output</pre>"
echo "</body></html>"
