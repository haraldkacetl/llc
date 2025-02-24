#!/bin/bash

# Verzeichnis angeben, für das die Checksummen generiert werden sollen
#directory="${1:-.}"
directory="/usr/lib/cgi-bin/cgi-jail/"
# Durch alle Dateien (rekursiv) im angegebenen Verzeichnis iterieren
find "$directory" -type f -exec sha256sum {} \;
