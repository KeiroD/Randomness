#!/bin/sh
# Shell interpreter. Tells bash, zsh, etc. that this is an actual shell script and to interpret it as such.
# Update system, install necessary packages for development on the rPi.
# Version 0.1.

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install dnsutils fail2ban iotop htop iftop nethogs pv lzop xz-utils python python-dev libjpeg-dev libfreetype6-dev python-setuptools python-pip x11-apps x11-xserver-utils xterm pyroom git conky-std alsa-utils mpg321 lame fonts-inconsolata screen screenie build-essential bluez dos2unix libgnutls28-dev telnet
sudo pip install --upgrade pip

# Chromium:

cd ~ || exit
wget https://dl.dropboxusercontent.com/u/87113035/chromium-browser-l10n_45.0.2454.85-0ubuntu0.15.04.1.1181_all.deb
wget https://dl.dropboxusercontent.com/u/87113035/chromium-browser_45.0.2454.85-0ubuntu0.15.04.1.1181_armhf.deb
wget https://dl.dropboxusercontent.com/u/87113035/chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.15.04.1.1181_armhf.deb
sudo dpkg -i chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.15.04.1.1181_armhf.deb
sudo dpkg -i chromium-browser-l10n_45.0.2454.85-0ubuntu0.15.04.1.1181_all.deb chromium-browser_45.0.2454.85-0ubuntu0.15.04.1.1181_armhf.deb
rm chromium-browser-l10n_45.0.2454.85-0ubuntu0.15.04.1.1181_all.deb
rm chromium-browser_45.0.2454.85-0ubuntu0.15.04.1.1181_armhf.deb
rm chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.15.04.1.1181_armhf.deb


# CSF

cd ~ || exit
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf  || exit
sudo sh install.generic.sh
sudo perl /usr/local/csf/bin/csftest.pl


# Let's Encrypt SSL

cd ~ || exit
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt || exit
service apache2 stop
# Note, this command is meant to be used on first run. Subsequent runs will not require everything.
sudo ./letsencrypt-auto --agree-tos --renew-by-default --text --email=admin@heimkoma.com -d raspie.heimkoma.com certonly
service apache2 start
# The rest of this code is commented out to prevent RaspbianPackages.sh from renewing the SSL certificate
# prematurely. This is the minimum necessary to renew SSL certificates after the initial run.
# Further, you can actually automate this process via crontab!
# Subsequent runs will be something similar to the following:
#sudo ./letsencrypt-auto -c /root/cli.ini certonly
#service apache2 start

# Code for crontab automation for LE cert renewals:
# Include in this in something like renew.sh
# crontab -e
# 00 00  *  *   * every 60 days && echo test
# Cribbed from: http://stackoverflow.com/questions/4549542/cron-job-every-three-days answer from Vishal.
# Adjust code here to your needs.
#!/bin/sh
#case $2 in
#    days)
#        expr `date +%j` % $1 = 0 > /dev/null
#        ;;
#
#    weeks)
#        expr `date +%V` % $1 = 0 > /dev/null
#        ;;
#
#    months)
#        expr `date +%m` % $1 = 0 > /dev/null
#        ;;
#esac
#!/bin/bash
# Get new keys!
#/root/letsencrypt/letsencrypt-auto -c /root/cli.ini certonly

# Reload Services
#service apache2 restart
