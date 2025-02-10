#!/bin/bash


#task_path,task_id,
#
#
#
#
#

right_solutions=$(jq -r 'right_commands' $task_path)
mkdir -p /srv/cgi-jail/{bin,lib,lib64,usr,dev}
cp /bin/bash /srv/cgi-jail/bin/
cp /bin/ls /srv/cgi-jail/bin/
cp /usr/bin/whoami /srv/cgi-jail/bin/
cp /bin/cd /srv/cgi-jail/bin/
cp /bin/pwd /srv/cgi-jail/bin/
cp /bin/cat /srv/cgi-jail/bin/
cp /bin/echo /srv/cgi-jail/bin/
cp /bin/mv /srv/cgi-jail/bin/
cp /bin/rm /srv/cgi-jail/bin/
cp /bin/cp /srv/cgi-jail/bin/
cp /bin/grep /srv/cgi-jail/bin/
cp /bin/sed /srv/cgi-jail/bin/
cp /bin/which /srv/cgi-jail/bin/dd /bin/ls | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
cp /bin/head /srv/cgi-jail/bin/
cp /bin/tail /srv/cgi-jail/bin/
cp /bin/less /srv/cgi-jail/bin/
cp /bin/more /srv/cgi-jail/bin/
cp /bin/ln /srv/cgi-jail/bin/
cp /bin/rmdir /srv/cgi-jail/bin/
cp /bin/mkdir /srv/cgi-jail/bin/
cp /bin/touch /srv/cgi-jail/bin/
cp /bin/chmod /srv/cgi-jail/bin/
cp /lib/x86_64-linux-gnu/libtinfo.so.6 /srv/cgi-jail/lib/
cp /lib/x86_64-linux-gnu/libc.so.6 /srv/cgi-jail/lib/
cp /lib64/ld-linux-x86-64.so.2 /srv/cgi-jail/lib64/
ldd /bin/ls | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/bash | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /usr/bin/whoami | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/cd | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/pwd | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/cat | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/echo | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/mv | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/rm | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/cp | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/grep | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/sed | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/which | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/head | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/tail | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/less | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/more | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/ln | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/rmdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/mkdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/touch | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/
ldd /bin/chmod | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /srv/cgi-jail/


