#!/bin/bash

me=$(whoami)
if [ $me == "root" ]; then
echo "User: $me"
else
echo "Please run the install as root! "
exit
fi

# !!!Uncomment after testing!!!
#apt-get update
#apt-get install -y apache2
#apt install jq
#a2enmod cgi
#systemctl restart apache2

jpath="/jail-bin"
echo "set path to $jpath"
mkdir -p $jpath/jail
echo "created jail directory"
mkdir -p $jpath/jail/bin
echo "created jail/bin directory"
mkdir -p $jpath/jail/lib
echo "created jail/lib directory"
mkdir -p $jpath/jail/lib64
echo "created jail/lib64 directory"

echo "copying files to jail"
cp -r -p /bin/* $jpath/jail/bin/
echo "copied /bin/ to jail/bin/"
cp -r -p /lib/* $jpath/jail/lib/
echo "copied /lib/ to jail/lib/"
cp -r -p /lib64/* $jpath/jail/lib64/
echo "copied /lib64/ to jail/lib64/"