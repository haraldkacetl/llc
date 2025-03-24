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

# Extrahiere den varpath
varpath=$(echo "$INPUT" | awk -F"&" '{for (i=1; i<=NF; i++) if ($i ~ /^varpath=/) print substr($i,9)}')
varpath=$(decode_url "$varpath" | tr -d '\r')  # Windows-Zeilenumbrüche entfernen

ls_magic='ls | sed "s/^/\"/; s/$/\"/" | paste -sd, - | sed "s/^/[ /; s/$/ ]/"'


output=$(sudo chroot "$chroot_path" /bin/bash -c "$ls_magic" 2>&1)
echo "$output"