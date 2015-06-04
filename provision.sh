#!/bin/bash


#dot deb repo
echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list
curl --silent http://www.dotdeb.org/dotdeb.gpg | apt-key add -

#packages we need
apt-get -y update
apt-get -y install nginx-extras php5-cli php5-fpm php5-curl redis-server git

#nginx config
mkdir -p /var/www/


#web app
cd /var/www/
rm -fr pushstream-app ## clean if already present
git clone https://github.com/Darkflib/pushstream-app.git pushstream-app

cp /vagrant/nginx.conf /etc/nginx/
cp /vagrant/default.conf /etc/nginx/sites-available/

# Conditionally install composer

if [ ! -e /usr/local/bin/composer ]; then
	curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
fi

cd /var/www/pushstream-app
composer install
