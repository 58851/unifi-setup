#!/bin/bash

# CONFIGURE OS FIREWALL
ufw allow 22
ufw allow 80
ufw allow 8080
ufw allow 8880
ufw allow 443
ufw allow 8443
ufw allow 8843
ufw allow 3478
ufw enable

# INSTALL TIME SERVICE
apt install ntp -y
date

# INSTALL RANDOM
apt install haveged -y

# CREATE AND CONFIGURE THE SWAPFILE
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'
cat /etc/fstab


# AUTOMATICALLY REMOVE OBSOLETE PACKAGES
#sh -c 'echo "apt autoremove -y" >> /etc/cron.monthly/autoremove'
#chmod +x /etc/cron.monthly/autoremove

dpkg-reconfigure tzdata
