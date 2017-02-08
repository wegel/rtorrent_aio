#!/bin/sh

apt install -y zip \
	curl \
	wget \
	unzip \
	unrar-free \
	mediainfo \
	ffmpeg \
	php \
	python \
	python-openssl \
	python-lxml

mkdir -p /data/downloads
mkdir -p /data/session

mkdir -p /var/www
cd /var/www
git clone https://github.com/Novik/ruTorrent.git rutorrent
sed -i.bak 's#$label = rawurlencode($label);#//$label = rawurlencode($label);#g' rutorrent/php/rtorrent.php

cd /var/www/rutorrent/plugins
git clone https://github.com/xombiemp/rutorrentMobile.git mobile

chown -R :www-data /var/www/rutorrent
chmod -R 774 /var/www/rutorrent
adduser root www-data
