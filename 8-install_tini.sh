#!/bin/sh

TINI_VERSION=v0.13.2
http_proxy= gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0527A9B7
wget -O/usr/sbin/tini     "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini"
wget -O/usr/sbin/tini.asc "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc"
gpg --verify /usr/sbin/tini.asc
rm -f /usr/sbin/tini.asc
chmod a+x /usr/sbin/tini

GOSU_VERSION=1.10
http_proxy= gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
wget -O/usr/sbin/gosu     "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture)"
wget -O/usr/sbin/gosu.asc "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture).asc"
gpg --verify /usr/sbin/gosu.asc
rm -f /usr/sbin/gosu.asc
chmod a+x /usr/sbin/gosu
