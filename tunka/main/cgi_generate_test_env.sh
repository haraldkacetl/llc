#!/bin/bash


#task_path,task_id,
#
#
#
#
#

#right_solutions=$(jq -r 'right_commands' $task_path)
mkdir -p /tmp/cgi-jail/{bin,lib,lib64,usr,dev}
cp -a test_archives/0001/* /tmp/cgi-jail/


cp /bin/bash /tmp/cgi-jail/bin/
cp /usr/bin/ls /tmp/cgi-jail/bin/
cp /usr/bin/whoami /tmp/cgi-jail/bin/
cp /bin/pwd /tmp/cgi-jail/bin/
cp /bin/cat /tmp/cgi-jail/bin/
cp /bin/echo /tmp/cgi-jail/bin/
cp /bin/mv /tmp/cgi-jail/bin/
cp /bin/rm /tmp/cgi-jail/bin/
cp /bin/cp /tmp/cgi-jail/bin/
cp /bin/grep /tmp/cgi-jail/bin/
cp /bin/sed /tmp/cgi-jail/bin/
cp /bin/which /tmp/cgi-jail/bin/
cp /bin/head /tmp/cgi-jail/bin/
cp /bin/tail /tmp/cgi-jail/bin/
cp /bin/less /tmp/cgi-jail/bin/
cp /bin/more /tmp/cgi-jail/bin/
cp /bin/ln /tmp/cgi-jail/bin/
cp /bin/rmdir /tmp/cgi-jail/bin/
cp /bin/mkdir /tmp/cgi-jail/bin/
cp /bin/touch /tmp/cgi-jail/bin/
cp /bin/chmod /tmp/cgi-jail/bin/
cp /lib/x86_64-linux-gnu/libtinfo.so.6 /tmp/cgi-jail/lib/
cp /lib/x86_64-linux-gnu/libc.so.6 /tmp/cgi-jail/lib/
cp /lib64/ld-linux-x86-64.so.2 /tmp/cgi-jail/lib64/
ldd /bin/ls | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/bash | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /usr/bin/whoami | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/pwd | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/cat | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/echo | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/mv | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/rm | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/cp | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/grep | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/sed | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/which | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/head | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/tail | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/less | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/more | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/ln | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/rmdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/mkdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/touch | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/
ldd /bin/chmod | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /tmp/cgi-jail/


