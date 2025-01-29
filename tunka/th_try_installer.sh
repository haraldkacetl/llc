#!/bin/bash

# Update package list and install Apache
sudo apt-get update
sudo apt-get install -y apache2

# Enable CGI module in Apache
sudo a2enmod cgi
sudo systemctl restart apache2

# Create a directory for the CGI scripts
sudo mkdir -p /usr/lib/cgi-bin
sudo chmod 755 /usr/lib/cgi-bin

# Create a CGI script to handle the input
# Create a CGI script to handle the input
sudo bash -c 'cat > /usr/lib/cgi-bin/process_input.sh <<EOF
#!/bin/bash

# Set the content type to HTML
echo "Content-type: text/html"
echo ""

# Read the POST data
if [ "$REQUEST_METHOD" = "POST" ]; then
    read -r INPUT
    # Extract the value of the input field (user_input)
    INPUT_VALUE=$(echo "$INPUT" | sed -n '\''s/.*user_input=\([^&]*\).*/\1/p'\'' | sed '\''s/%20/ /g; s/%21/!/g; s/%22/"/g; s/%23/#/g; s/%24/$/g; s/%25/%/g; s/%26/\&/g; s/%27/'\''\'\'''\''/g; s/%28/(/g; s/%29/)/g; s/%2A/*/g; s/%2B/+/g; s/%2C/,/g; s/%2D/-/g; s/%2E/./g; s/%2F/\//g; s/%3A/:/g; s/%3B/;/g; s/%3C/</g; s/%3D/=/g; s/%3E/>/g; s/%3F/?/g; s/%40/@/g; s/%5B/[/g; s/%5C/\\/g; s/%5D/]/g; s/%5E/^/g; s/%5F/_/g; s/%60/`/g; s/%7B/{/g; s/%7C/|/g; s/%7D/}/g; s/%7E/~/g'\'')
else
    INPUT_VALUE="No input received"
fi

# Generate the HTML response
cat <<EOF
<html>
<head><title>CGI Response</title></head>
<body>
    <h1>Server Response</h1>
    <p>You sent: $INPUT_VALUE</p>
    <a href="/">Go back</a>
</body>
</html>
EOF
EOF'

# Make the CGI script executable
sudo chmod +x /usr/lib/cgi-bin/process_input.sh

# Create a basic HTML file with an input box and form
sudo bash -c 'cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apache CGI Example</title>
</head>
<body>
    <h1>Apache CGI Example</h1>
    <form action="/cgi-bin/process_input.sh" method="post">
        <label for="user_input">Enter something:</label>
        <input type="text" id="user_input" name="user_input">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
EOF'

# Restart Apache to apply changes
sudo systemctl restart apache2

# Print the IP address of the server
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "Apache server installed and configured!"
echo "Visit http://$IP_ADDRESS to access the website."