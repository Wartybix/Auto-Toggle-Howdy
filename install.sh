username=$(whoami)

sudo cp enable-howdy.sh disable-howdy.sh /usr/local/bin/

echo "$username ALL=(root) NOPASSWD: /usr/local/bin/enable-howdy.sh" | sudo tee /etc/sudoers.d/enable-howdy
echo "$username ALL=(root) NOPASSWD: /usr/local/bin/disable-howdy.sh" | sudo tee /etc/sudoers.d/disable-howdy

echo "Installed 😃"
