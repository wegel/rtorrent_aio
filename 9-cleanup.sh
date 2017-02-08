#!/bin/sh

cd /

echo "cgi.fix_pathinfo = 0" >> /etc/php/7.0/fpm/php.ini


apt remove -y git \
        subversion \
        build-essential \
        automake \
        libtool \
        libcppunit-dev \
        libcurl4-openssl-dev \
        libsigc++-2.0-dev \
        libncurses5-dev \
        zlib1g-dev \
        libssl-dev

apt autoremove -y

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/local/src 2>/dev/null || true
