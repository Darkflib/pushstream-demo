#!/bin/bash


#dot deb repo
echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list
curl wget http://www.dotdeb.org/dotdeb.gpg | apt-key add -

#packages we need
apt-get -y update
apt-get -y install nginx-extras php5-fpm php5-curl redis-server redis-cli

#nginx config
mkdir -p /var/www/


#web app
cd /var/www/
git clone https://github.com/Darkflib/pushstream-app.git pushstream-app

