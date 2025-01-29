#!/bin/bash


apt update
apt install apache2
systemctl start apache2
rm -rf /var/www/html/*
cp sites/* /var/www/html/
a2enmod cgi

echo '<VirtualHost *:80>
    # The ServerName directive sets the request scheme, hostname and port that
    # the server uses to identify itself. This is used when creating
    # redirection URLs. In the context of virtual hosts, the ServerName
    # specifies what hostname must appear in the requests Host: header to
    # match this virtual host. For the default virtual host (this file) this
    # value is not decisive as it is used as a last resort host regardless.
    # However, you must set it for any further virtual host explicitly.
    #ServerName www.example.com

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this virtual host
    # only after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/sites-available/000-default.conf

echo "<Directory /var/www/html/cgi-bin>
    Options +ExecCGI
    AddHandler cgi-script .cgi .pl
    Require all granted
</Directory>
" >> /etc/apache2/sites-available/000-default.conf
mkdir /var/www/html/cgi-bin
chmod 755 /var/www/html/cgi-bin


echo '#!/usr/bin/perl

use CGI;

# Create a new CGI object
my $cgi = CGI->new;

# Get the form data
my $name = $cgi->param('name');
my $email = $cgi->param('email');

# Set the content type header
print $cgi->header('text/html');

# Print the HTML response
print "<html><body>";
print "<h1>Form Submitted Successfully!</h1>";
print "<p>Name: $name</p>";
print "<p>Email: $email</p>";
print "</body></html>";
' > /var/www/html/cgi-bin/submit_form.cgi
chmod +x /var/www/html/cgi-bin/submit_form.cgi

systemctl start apache2
systemctl restart apache2