#!/bin/bash

me=$(whoami)
if [ $me == "root" ]; then
echo "User: $me"
else
echo "Please run the install as root! "
exit
fi

# !!!Uncomment after testing!!!
#apt-get update -y
#apt-get upgrade -y
#apt-get install -y apache2
#apt install jq -y
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
#cp -r -p /bin/* $jpath/jail/bin/
echo "copied /bin/ to jail/bin/"
#cp -r -p /lib/* $jpath/jail/lib/
echo "copied /lib/ to jail/lib/"
#cp -r -p /lib64/* $jpath/jail/lib64/
echo "copied /lib64/ to jail/lib64/"

cgi_script_content=$(cat command_execution.sh)
echo "$cgi_script_content" > /usr/lib/cgi-bin/process_input.sh
chmod +x /usr/lib/cgi-bin/process_input.sh
chown www-data:www-data /usr/lib/cgi-bin/process_input.sh
echo "created /usr/lib/cgi-bin/process_input.sh"


cp sites/* /var/www/html/
echo "copied site-files to /var/www/html/"
systemctl restart apache2
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "Apache server installed and configured!"
echo "Visit http://$IP_ADDRESS to access the website."

mkdir -p /var/www/html/css
cp ./stylesheets/* /var/www/html/css/
echo "copied stylesheets to /var/www/html/css/"