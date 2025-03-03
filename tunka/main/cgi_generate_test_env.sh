#!/bin/bash


#task_path,task_id,
#
#
#
#
#

#right_solutions=$(jq -r 'right_commands' $task_path)
mkdir -p /var/cgi-jail/{bin,lib,lib64,usr,dev}
cp -a test_archives/0001/* /var/cgi-jail/



cp /usr/bin/bash /var/cgi-jail/bin/
cp /usr/bin/ls /var/cgi-jail/bin/
cp /usr/bin/whoami /var/cgi-jail/bin/
cp /bin/pwd /var/cgi-jail/bin/
cp /bin/cat /var/cgi-jail/bin/
cp /bin/echo /var/cgi-jail/bin/
cp /bin/mv /var/cgi-jail/bin/
cp /bin/rm /var/cgi-jail/bin/
cp /bin/cp /var/cgi-jail/bin/
cp /bin/grep /var/cgi-jail/bin/
cp /bin/sed /var/cgi-jail/bin/
cp /bin/which /var/cgi-jail/bin/
cp /bin/head /var/cgi-jail/bin/
cp /bin/tail /var/cgi-jail/bin/
cp /bin/less /var/cgi-jail/bin/
cp /bin/more /var/cgi-jail/bin/
cp /bin/ln /var/cgi-jail/bin/
cp /bin/rmdir /var/cgi-jail/bin/
cp /bin/mkdir /var/cgi-jail/bin/
cp /bin/touch /var/cgi-jail/bin/
cp /bin/chmod /var/cgi-jail/bin/
cp /lib/x86_64-linux-gnu/libtinfo.so.6 /var/cgi-jail/lib/
cp /lib/x86_64-linux-gnu/libc.so.6 /var/cgi-jail/lib/
cp /lib64/ld-linux-x86-64.so.2 /var/cgi-jail/lib64/
ldd /bin/ls | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/bash | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /usr/bin/whoami | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/pwd | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/cat | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/echo | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/mv | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/rm | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/cp | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/grep | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/sed | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/which | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/head | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/tail | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/less | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/more | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/ln | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/rmdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/mkdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/touch | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/
ldd /bin/chmod | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /var/cgi-jail/


