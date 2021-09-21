#!/bin/bash
ufw allow 22
ufw allow 80
ufw allow 8080
ufw allow 8880
ufw allow 443
ufw allow 8443
ufw allow 8843
ufw allow 3478
ufw enable

apt install ntp -y

apt install haveged -y

fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'

sh -c 'echo "apt autoremove -y" >> /etc/cron.monthly/autoremove'
chmod +x /etc/cron.monthly/autoremove
