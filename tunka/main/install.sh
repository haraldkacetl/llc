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

mkdir -p /usr/lib/cgi-bin
chmod 755 /usr/lib/cgi-bin

cgi_script_content=$(cat cgi_script_content.sh)
echo "$cgi_script_content" > /usr/lib/cgi-bin/process_input.sh
chmod +x /usr/lib/cgi-bin/process_input.sh
chown www-data:www-data /usr/lib/cgi-bin/process_input.sh

cp sites/* /var/www/html/
systemctl restart apache2
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "Apache server installed and configured!"
echo "Visit http://$IP_ADDRESS to access the website."


# Copy Stylesheets
mkdir -p /var/www/html/css
cp ./stylesheets/* /var/www/html/css/

# Copy task_info cgi-script
get_task_info_cgiscript=$(cat cgi_task_info.sh)
echo "$get_task_info_cgiscript" > /usr/lib/cgi-bin/get_task_info_frid.sh
chmod +x /usr/lib/cgi-bin/get_task_info_frid.sh
chown www-data:www-data /usr/lib/cgi-bin/get_task_info_frid.sh

# Copy eval_command script
eval_script_content=$(cat cgi_evaluate_command.sh)
echo "$eval_script_content" > /usr/lib/cgi-bin/eval_command.sh
chmod +x /usr/lib/cgi-bin/eval_command.sh
chown www-data:www-data /usr/lib/cgi-bin/eval_command.sh
#copy gen_test_env script
test_script_content=$(cat cgi_generate_test_env.sh)
echo "$test_script_content" > /usr/lib/cgi-bin/gen_test_env.sh
chown www-data:www-data /usr/lib/cgi-bin/gen_test_env.sh
chmod +x /usr/lib/cgi-bin/gen_test_env.sh
#www-data ALL=(ALL) NOPASSWD: /usr/sbin/chroot
#echo "www-data ALL=(ALL) NOPASSWD: /usr/sbin/chroot" | sudo tee -a /etc/sudoers
#cp /etc/locale.gen /etc/locale.conf /etc/default/locale /var/cgi-jail/etc/

#./cgi_generate_test_env.sh
echo "Installation complete, cgi-jail createt at: /var/cgi-jail"






if [ ! -d '/var/cgi-jail/usr' ]; then
    mkdir -p /var/cgi-jail/usr
    ln -s /usr/ /var/cgi-jail/usr
    echo "linked usr"
fi
if [ ! -d /var/cgi-jail/etc ]; then
    #mkdir -p /var/cgi-jail/etc
    ln -s /etc /var/cgi-jail/
    echo "linked etc"
fi
if [ ! -d /var/cgi-jail/bin ]; then
    #mkdir -p /var/cgi-jail/bin
    ln -s /usr/bin /var/cgi-jail/
    echo "linked bin"
fi
if [ ! -d /var/cgi-jail/lib ]; then
    #mkdir -p /var/cgi-jail/lib
    ln -s /usr/lib /var/cgi-jail/
    echo "linked lib"
fi
if [ ! -d /var/cgi-jail/lib64 ]; then
    #mkdir -p /var/cgi-jail/lib64
    ln -s /usr/lib64 /var/cgi-jail/
    echo "linked lib64"
fi
mkdir -p /var/cgi-jail/dev

#if [ ! -d /var/cgi-jail/usr/bin ]; then
#    ln -s /usr/bin /var/cgi-jail/bin
#fi



#find /usr/lib/ -mindepth 1 -not -path "/usr/lib/cgi-bin/*" -exec ln -s {} /var/cgi-jail/usr/lib/ \;
