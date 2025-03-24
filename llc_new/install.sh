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
apt-get install -y apache2
apt install jq -y
a2enmod cgi
systemctl restart apache2
mkdir -p /usr/lib/cgi-bin
chmod 755 /usr/lib/cgi-bin

read -p "Do you want to create and copy directories/files? (Required on first install)(y/N): " answer
if [[ "e$anwser" == "e" ]]; then
    anwser="n"
fi
anwser=$(echo "$anwser" | tr '[:upper:]' '[:lower:]')
jpath="/var/jail-bin"
if [[ "$answer" == "y" ]]; then
    echo "Creating directories and copying files..."

    
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

    echo "Designing jail environment"
    mkdir -p $jpath/jail/home
    mkdir -p $jpath/jail/home/user
    mkdir -p $jpath/jail/home/user/Desktop
    mkdir -p $jpath/jail/home/user/Documents
    mkdir -p $jpath/jail/home/user/Downloads
    mkdir -p $jpath/jail/home/user/Music
    mkdir -p $jpath/jail/home/user/Pictures
    mkdir -p $jpath/jail/home/user/Public
    mkdir -p $jpath/jail/home/user/Templates
    mkdir -p $jpath/jail/home/user/Videos

    touch $jpath/jail/home/user/Desktop/Fortnite.exe
    touch $jpath/jail/home/user/Desktop/Minecraft.exe
    touch $jpath/jail/home/user/Desktop/Valorant.exe
    touch $jpath/jail/home/user/Documents/Passwords.txt
    touch $jpath/jail/home/user/Documents/Secrets.txt
    touch $jpath/jail/home/user/Documents/TopSecret.txt
    touch $jpath/jail/home/user/Downloads/Setup.exe
    touch $jpath/jail/home/user/Downloads/Setup.zip
    touch $jpath/jail/home/user/Downloads/Files.rar
    touch $jpath/jail/home/user/Music/BestSong.mp3
    touch $jpath/jail/home/user/Music/GoodSong.mp3
    touch $jpath/jail/home/user/Music/TopSong.mp3
    touch $jpath/jail/home/user/Pictures/Fammily.jpg
    touch $jpath/jail/home/user/Pictures/funny.jpg
    touch $jpath/jail/home/user/Pictures/Memes/Schrek.jpg
    touch $jpath/jail/home/user/Public/Shared.txt
    touch $jpath/jail/home/user/Public/Shared2.txt
    touch $jpath/jail/home/user/Templates/Template.docx
    touch $jpath/jail/home/user/Templates/Template2.docx
    touch $jpath/jail/home/user/Videos/BestVideo.mp4
    touch $jpath/jail/home/user/Videos/TopVideo2.mp4
    touch $jpath/jail/home/user/Videos/GoodVideo.mp4
    touch $jpath/jail/home/user/Videos/TopVideo.mp4

    echo "Finished designing jail environment"

else 
    echo "Skipping directory creation and file copying..."
fi
cp clear.sh $jpath/jail/bin/clear.sh
chmod +x $jpath/jail/bin/clear.sh
cp clear.sh $jpath/jail/usr/bin/clr.sh
chmod +x $jpath/jail/usr/bin/clr.sh
echo "copied clear.sh to $jpath/jail/bin/clear"

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

rm /var/www/html/css/*
echo "removed old stylesheets"
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

cgi_teletabbies_content=$(cat tab_files.sh)
echo "$cgi_teletabbies_content" > /usr/lib/cgi-bin/tab_files.sh
chmod +x /usr/lib/cgi-bin/tab_files.sh
chown www-data:www-data /usr/lib/cgi-bin/tab_files.sh
echo "created /usr/lib/cgi-bin/tab_files.sh"

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

addsudoline="www-data ALL=(ALL) NOPASSWD: /usr/sbin/chroot"


if sudo grep -Fxq "$addsudoline" /etc/sudoers; then
    echo "www-data already able to run chroot. No changes made."
else
    echo "$addsudoline" | sudo tee -a /etc/sudoers
    echo "Added chroot to www-data."
fi