#!/usr/bin/env bash

# remove info.php (prevents server info leak)
rm /srv/http/info.php

su docker -c 'pacaur -S --noprogressbar --needed --noedit --noconfirm emoncms'

cp /etc/webapps/emoncms/apache.example.conf /etc/httpd/conf/extra/emoncms.conf
sed -i '$a Include conf/extra/emoncms.conf' /etc/httpd/conf/httpd.conf

cp /usr/share/webapps/emoncms/default.settings.php /usr/share/webapps/emoncms/settings.php
sed -i 's,$username = "_DB_USER_";,$username = "root";,g' /usr/share/webapps/emoncms/settings.php
sed -i 's,$password = "_DB_PASSWORD_";,$password = "";,g' /usr/share/webapps/emoncms/settings.php

mysql -e "CREATE DATABASE emoncms;"

# reduce docker layer size
cleanup-image
