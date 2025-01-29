#!/bin/bash

# Apache installieren
sudo apt update
sudo apt install -y apache2

# CGI aktivieren
sudo a2enmod cgi
sudo systemctl restart apache2

# Webseiten kopieren
TARGET_DIR="/var/www/html"
CGI_DIR="$TARGET_DIR/cgi-bin"
if [ -d "sites" ]; then
    sudo cp -r sites/* $TARGET_DIR/
    sudo chmod -R 755 $TARGET_DIR
    echo "Webseiten aus 'sites' wurden nach $TARGET_DIR kopiert."
else
    echo "Verzeichnis 'sites' nicht gefunden. Bitte stellen Sie sicher, dass es existiert."
fi

# Sicherstellen, dass das CGI-Verzeichnis existiert
sudo mkdir -p $CGI_DIR
sudo chmod 755 $CGI_DIR

# Funktion zur Statusprüfung
check_status() {
    echo "Apache-Status:"
    systemctl status apache2 | grep Active
}

# Neues Skript im Webseitenverzeichnis erstellen
cat <<EOF | sudo tee $CGI_DIR/script.sh
#!/bin/bash
#source $CGI_DIR/install.sh

echo "Content-type: text/plain"
echo ""
#check_status
EOF

# Rechte setzen
sudo chmod +x $CGI_DIR/script.sh

echo "Installation abgeschlossen. Webseiten und CGI-Skripte wurden kopiert. Zugriff über /cgi-bin/script.sh möglich."
