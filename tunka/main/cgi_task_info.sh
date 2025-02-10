#!/bin/bash

export PATH=/bin:/usr/bin:/usr/sbin/chroot
export LANG="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

echo "Content-type: text; charset=UTF-8"
echo ""

# POST-Daten einlesen
if [ "$REQUEST_METHOD" = "POST" ]; then
    read -n "$CONTENT_LENGTH" INPUT
else
    INPUT=""
fi

task_id=$(echo "$INPUT" | sed -n 's/.*task_id=\([^&]*\).*/\1/p' | tr '+' ' ')
task_id=${task_id:-"unknown"}

task_path=$(echo "task_infos/$task_id")
content=""
if [[ -f "$task_path" ]]; then 
    content=$(jq -r '.task_infos[]' $task_path)
else
    content="Unknown"
fi
echo "$content"