#!/bin/bash

# Fixed for my book Webbserverprogrammering 1

cd ~/webprojects

# TODO Always get latest version
echo 'laddar ner phpMyAdmin 4.6.4'
curl -#L https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-all-languages.tar.xz -o phpmyadmin.tar.xz

echo 'packar upp phpMyAdmin'
mkdir phpmyadmin && tar xf phpmyadmin.tar.xz -C phpmyadmin --strip-components 1

rm phpmyadmin.tar.xz

echo 'Aktiverar phpMyAdmin som en Nginx virtual host'
CMD=/vagrant/scripts/serve-laravel.sh
if [ ! -f $CMD ]; then
    # fallback for older versions
    # As of 2016-08-25 this includes Homestead Improved
    CMD=/vagrant/scripts/serve.sh
fi

sudo bash $CMD phpmyadmin.app $(pwd)/phpmyadmin
sudo nginx -s reload

echo 'Färdig. Lägg till 192.168.10.10 phpmyadmin.app i din hosts-fil'
