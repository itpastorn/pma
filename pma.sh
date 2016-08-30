#!/bin/bash

# Fixed for my book Webbserverprogrammering 1

# Detta skript ska köras inuti din virtuella maskin
if [[ $HOSTNAME != "homestead" ]]
then
    echo -e "\e[31mSkriptet ska köras inuti din virtuella maskin (homestead)\e[39m"
    exit 1
fi

cd ~/webprojects
if [[ $PWD != "/home/vagrant/webprojects" ]]
then
    echo -e "\e[31mMappen webprojects saknas\e[39m"
    exit 1
fi
echo -e "\e[33mInstallerar unzip och php-bz2\e[39m"
sudo apt-get install -y unzip php-bz2

echo -e "\e[33mLaddar ner phpMyAdmin\e[39m"
# Inte garanterat senaste versionen, men med alla språk
curl -#L https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-all-languages.tar.xz -o phpmyadmin.tar.xz
mkdir phpmyadmin && tar xf phpmyadmin.tar.xz -C phpmyadmin --strip-components 1
rm phpmyadmin.tar.xz

# Senaste version kan hämtas som nedan, men då finns inte svenska som språk
#wget https://github.com/phpmyadmin/phpmyadmin/archive/STABLE.zip
#echo -e "\e[33mPackar upp phpMyAdmin\e[39m"
#unzip STABLE.zip
#sudo mv phpmyadmin-STABLE/ phpmyadmin
#rm STABLE.zip

# Översättning
echo -e "\e[33mKonfigurerar phpMyAdmin\e[39m"
cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
blowfish=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32})
sed -i -e "s@'blowfish_secret'] = ''@'blowfish_secret'] = '$blowfish'@g" phpmyadmin/config.inc.php
sed -i -e "s@//\$cfg\['DefaultLang'\] = 'de';@\$cfg\['DefaultLang'\] = 'sv';@" phpmyadmin/config.inc.php
# Windows + Homestead requires this
echo "\$cfg['CheckConfigurationPermissions'] = false;" >> phpmyadmin/config.inc.php


echo -e "\e[33mAktiverar phpMyAdmin som en Nginx virtual host\e[39m"
CMD=/vagrant/scripts/serve-laravel.sh
if [ ! -f $CMD ]; then
    # fallback for older versions
    # As of 2016-08-25 this includes Homestead Improved
    CMD=/vagrant/scripts/serve.sh
fi

sudo bash $CMD phpmyadmin.app $(pwd)/phpmyadmin
sudo nginx -s reload

echo -e "\e[33mFärdig. Lägg själv till 192.168.10.10 phpmyadmin.app i din värddators hosts-fil\e[39m"
