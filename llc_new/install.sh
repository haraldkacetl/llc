#!/bin/bash

me=$(whoami)
if [ $me == "root" ]; then
echo "User: $me"
else
echo "Please run the install as root! "
exit
fi

# !!!Uncomment after testing!!!
apt-get update -y
#apt-get upgrade -y
apt-get install -y apache2
apt install jq -y
a2enmod cgi
systemctl restart apache2
mkdir -p /usr/lib/cgi-bin
chmod 755 /usr/lib/cgi-bin

read -p "Do you want to create and copy directories/files? (Required on first install)(y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Creating directories and copying files..."

    jpath="/var/jail-bin"
    echo "set path to $jpath"
    mkdir -p $jpath/jail
    chown www-data:www-data $jpath/jail
    echo "created jail directory"
    mkdir -p $jpath/jail/bin
    echo "created jail/bin directory"
    mkdir -p $jpath/jail/lib
    echo "created jail/lib directory"
    mkdir -p $jpath/jail/lib64
    echo "created jail/lib64 directory"
    mkdir -p $jpath/jail/usr
    echo "created jail/usr directory"

    echo "copying files to jail"
    echo "copying /bin/ to jail/bin/"
    cp -r -p /bin/* $jpath/jail/bin/
    echo "copied /bin/ to jail/bin/"
    echo "copying /lib/ to jail/lib/"
    cp -r -p /lib/* $jpath/jail/lib/
    echo "copied /lib/ to jail/lib/"
    echo "copying /lib64/ to jail/lib64/"
    cp -r -p /lib64/* $jpath/jail/lib64/
    echo "copied /lib64/ to jail/lib64/"
    echo "copying /usr/ to jail/usr/"
    cp -r -p /usr/* $jpath/jail/usr/
    echo "copied /usr/ to jail/usr/"
    echo "copying /usr/ to jail/usr/"
    cp -r -p /usr/* $jpath/jail/usr/
    echo "copied /usr/ to jail/usr/"

else 
    echo "Skipping directory creation and file copying..."
fi

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
systemctl restart apache2
echo "www-data ALL=(ALL) NOPASSWD: /usr/sbin/chroot" | sudo tee -a /etc/sudoers
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
systemctl restart apache2
echo "www-data ALL=(ALL) NOPASSWD: /usr/sbin/chroot" | sudo tee -a /etc/sudoers