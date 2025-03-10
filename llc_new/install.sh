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

a2enmod cgi
systemctl restart apache2

