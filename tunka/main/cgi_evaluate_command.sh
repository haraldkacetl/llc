#!/bin/bash

# Export environment variables
export PATH=/bin:/usr/bin:/usr/sbin:/usr/local/bin
export LANG="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

# Content-type header for HTML output
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

# Extract task_id, input_command, and eval_difficulty using sed and URL-decoding
task_id=$(echo "$INPUT" | sed -n 's/.*task_id=\([^&]*\).*/\1/p' | tr '+' ' ' | sed 's/%20/ /g')
eval_difficulty=$(echo "$INPUT" | sed -n 's/.*eval_difficulty=\([^&]*\).*/\1/p' | tr '+' ' ' | sed 's/%20/ /g')

# Default task_id if not set
task_id=${task_id:-"unknown"}

# Set task path
task_path="task_infos/$task_id"

# Debugging: Output extracted values
echo "<h3>Debugging: Extracted Inputs</h3>"
echo "Task ID: $task_id<br>"
echo "Input Command: $input_command<br>"
echo "Eval Difficulty: $eval_difficulty<br>"

# Execute gen_test_env.sh script for environment setup (ensure it exists and is executable)
if [ -x "./gen_test_env.sh" ]; then
    echo "Running environment setup script..."
    ./gen_test_env.sh
else
    echo "Error: gen_test_env.sh not found or not executable!<br>"
    exit 1
fi

# Define chroot jail command
command_in_jail="sudo chroot /usr/lib/cgi-bin/cgi-jail"

# Debugging: Show command being executed
echo "<h3>Debugging: Command to be executed in jail</h3>"
echo "$command_in_jail $input_command<br>"

# Sanitize input command to avoid harmful characters
input_command_safe=$(echo "$input_command" | sed 's/[^a-zA-Z0-9_\-\/ ]//g')

# Append the sanitized input command to the jail command
command_in_jail="$command_in_jail $input_command_safe"

# Execute the command inside the jail and capture output
echo "Executing command inside chroot jail: $command_in_jail<br>"
output=$(eval "$command_in_jail 2>&1")
exit_status=$?
echo "Exit Status: $exit_status<br>"
echo "Output: <pre>$output</pre>"


# Debugging: Show output of command
echo "<h3>Debugging: Command Output</h3>"
echo "<pre>$output</pre>"

# Final output (in HTML format)
echo "<h3>Execution Result</h3>"
echo "<pre>$output</pre>"

# Debugging: Display the raw POST input
echo "<h3>Raw Input Data</h3>"
echo "<pre>$INPUT</pre>"































#
#
#
#if [[ -f "$task_path" ]]; then 
#    right_solutions=$(jq -r 'right_commands' $task_path)
#    min_len_solution=$(jq -r '.min_command_length' $task_path)
#    m_command=$(jq -r '.main_command' $task_path)
#    best_command=$(jq -r '.best_command' $task_path)
#else
#    right_commands="Unknown"
#    min_len_solution=0
#    m_command="Unknown"
#    best_command="Unknown"
#fi
#min_len_solution=$(( $min_len_solution + 2 ))
#if [ "$eval_difficulty" = "eval_easiest" ];then
#    easiest_input_main_command=$(echo "$input_command" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
#    
#    if [ "$easiest_input_main_command" = "$m_command" ]; then
#        echo "Richtig!"
#        echo "TODO: PTS SYSTEM -> ADD -AMT- PTS"
#    else
#        echo "Falsch!"
#        echo "TODO: PTS SYSTEM -> ADD 0 PTS"
#    fi
#fi
#
#if [ "$eval_difficulty" = "eval_niederle" ];then
#    len_input_command=$(echo ${#input_command})
#    input_main_command=$(echo "$input_command" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
#    min_len_solution=$(echo ${#best_command})
#    len_input_command=$(( $len_input_command - 2 ))
#    if [ "$len_input_command" -gt "$min_len_solution" ]; then
#        echo "len_input_command:$len_input_command"
#        echo "min_len_solution:$min_len_solution"
#        echo "TODO; PTS SYSTEM -> ADD 0 PTS"
#    else
#    if [ "$input_main_command" = "$m_command" ]; then
#        
#        second_comparer_input=$(echo "$input_command" | awk '{print $2}')
#        second_comparer_right=$(echo "$best_command" | awk '{print $2}')
#        
#        
#        if [ "$second_comparer_input" = "$second_comparer_right" ]; then
#            echo "Richtig!"
#            echo "TODO; PTS SYSTEM -> ADD -AMT- PTS"
#            echo "second_comparer_input:$second_comparer_input"
#            echo "second_comparer_right:$second_comparer_right"
#        else
#        echo "Comparer not equally"
#        fi
#        #
#        #WORK HERE
#        #
#    else
#        echo "isnot main_command TODO; PTS SYSTEM -> ADD 0 PTS"
#    fi
#    fi
#
#fi  
#

echo "end"
