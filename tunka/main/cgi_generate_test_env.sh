#!/bin/bash


#task_path,task_id,
#
#
#
#
#

#right_solutions=$(jq -r 'right_commands' $task_path)
mkdir -p /usr/lib/cgi-bin/cgi-jail/{bin,lib,lib64,usr,dev}
cp -a test_archives/0001/* /usr/lib/cgi-bin/cgi-jail/

cp cdn /usr/lib/cgi-bin/cgi-jail/bin/

cp /bin/bash /usr/lib/cgi-bin/cgi-jail/bin/
cp /usr/bin/ls /usr/lib/cgi-bin/cgi-jail/bin/
cp /usr/bin/whoami /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/pwd /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/cat /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/echo /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/mv /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/rm /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/cp /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/grep /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/sed /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/which /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/head /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/tail /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/less /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/more /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/ln /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/rmdir /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/mkdir /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/touch /usr/lib/cgi-bin/cgi-jail/bin/
cp /bin/chmod /usr/lib/cgi-bin/cgi-jail/bin/
cp /lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/cgi-bin/cgi-jail/lib/
cp /lib/x86_64-linux-gnu/libc.so.6 /usr/lib/cgi-bin/cgi-jail/lib/
cp /lib64/ld-linux-x86-64.so.2 /usr/lib/cgi-bin/cgi-jail/lib64/
ldd /bin/ls | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/bash | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /usr/bin/whoami | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/pwd | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/cat | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/echo | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/mv | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/rm | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/cp | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/grep | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/sed | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/which | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/head | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/tail | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/less | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/more | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/ln | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/rmdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/mkdir | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/touch | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/
ldd /bin/chmod | awk '{print $3}' | grep '^/' | xargs -I {} sudo cp --parents {} /usr/lib/cgi-bin/cgi-jail/


