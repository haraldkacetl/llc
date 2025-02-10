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

task_id=$(echo "$INPUT" | sed -n 's/.*task_id=\([^&]*\).*/\1/p' | tr '+' ' ')
input_command=$(echo "$INPUT" | sed -n 's/.*input_command=\([^&]*\).*/\1/p' | tr '+' ' ')
eval_difficulty=$(echo "$INPUT" | sed -n 's/.*eval_difficulty=\([^&]*\).*/\1/p' | tr '+' ' ')
task_id=${task_id:-"unknown"}

#gen Test env
./gen_test_env.sh












































task_path=$(echo "task_infos/$task_id")
content=""
if [[ -f "$task_path" ]]; then 
    right_solutions=$(jq -r 'right_commands' $task_path)
    min_len_solution=$(jq -r '.min_command_length' $task_path)
    m_command=$(jq -r '.main_command' $task_path)
    best_command=$(jq -r '.best_command' $task_path)
else
    right_commands="Unknown"
    min_len_solution=0
    m_command="Unknown"
    best_command="Unknown"
fi
min_len_solution=$(( $min_len_solution + 2 ))
if [ "$eval_difficulty" = "eval_easiest" ];then
    easiest_input_main_command=$(echo "$input_command" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
    
    if [ "$easiest_input_main_command" = "$m_command" ]; then
        echo "Richtig!"
        echo "TODO: PTS SYSTEM -> ADD -AMT- PTS"
    else
        echo "Falsch!"
        echo "TODO: PTS SYSTEM -> ADD 0 PTS"
    fi
fi

if [ "$eval_difficulty" = "eval_niederle" ];then
    len_input_command=$(echo ${#input_command})
    input_main_command=$(echo "$input_command" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
    min_len_solution=$(echo ${#best_command})
    len_input_command=$(( $len_input_command - 2 ))
    if [ "$len_input_command" -gt "$min_len_solution" ]; then
        echo "len_input_command:$len_input_command"
        echo "min_len_solution:$min_len_solution"
        echo "TODO; PTS SYSTEM -> ADD 0 PTS"
    else
    if [ "$input_main_command" = "$m_command" ]; then
        
        second_comparer_input=$(echo "$input_command" | awk '{print $2}')
        second_comparer_right=$(echo "$best_command" | awk '{print $2}')
        
        
        if [ "$second_comparer_input" = "$second_comparer_right" ]; then
            echo "Richtig!"
            echo "TODO; PTS SYSTEM -> ADD -AMT- PTS"
            echo "second_comparer_input:$second_comparer_input"
            echo "second_comparer_right:$second_comparer_right"
        else
        echo "Comparer not equally"
        fi
        #
        #WORK HERE
        #
    else
        echo "isnot main_command TODO; PTS SYSTEM -> ADD 0 PTS"
    fi
    fi

fi  


echo "end"
