#!/bin/bash

chroot_path="/jail-bin"

echo "Content-type: text/html; charset=UTF-8"
echo ""

# Read POST data if available
if [ "$REQUEST_METHOD" = "POST" ]; then
    read -n "$CONTENT_LENGTH" INPUT
else
    INPUT=""
fi
decode_url() {
    echo -e "$(echo "$1" | sed 's/+/ /g; s/%\(..\)/\\x\1/g' | xargs -0 printf '%b')"
}

input_command=$(echo "$INPUT" | awk -F"&" '{for (i=1; i<=NF; i++) if ($i ~ /^input_command=/) print substr($i,15)}')
input_command=$(decode_url "$input_command")

command_in_jail="chroot $chroot_path /bin/bash -c \"$input_command\""
output=$(eval "$command_in_jail 2>&1")