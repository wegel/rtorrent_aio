#!/bin/sh

apt install -y libcurl3

cd /usr/local/src

git clone https://github.com/rakshasa/rtorrent.git
cd rtorrent
git checkout 10ce686

./autogen.sh
./configure --with-xmlrpc-c=/usr/local/src/xmlrpc-c/xmlrpc-c-config
make -j8
make install
ln -s /usr/local/bin/rtorrent /usr/bin/
ldconfig

#sudo adduser --system --home=/var/lib/rtorrent --group rtorrent

#sudo adduser rtorrent media

