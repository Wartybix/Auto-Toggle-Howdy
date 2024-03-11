username=$(whoami)

sudo cp enable-howdy.sh disable-howdy.sh /usr/local/bin/

echo "$username ALL=(root) NOPASSWD: /usr/local/bin/enable-howdy.sh" | sudo tee /etc/sudoers.d/enable-howdy
echo "$username ALL=(root) NOPASSWD: /usr/local/bin/disable-howdy.sh" | sudo tee /etc/sudoers.d/disable-howdy

printf "[Service]\nExecStartPre=+-/bin/bash -c \"SUDO_USER=$username /usr/bin/howdy disable 1\"" | sudo tee /etc/systemd/system/systemd-logind.service.d/override.conf

echo "Installed 😃"
