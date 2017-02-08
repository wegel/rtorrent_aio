#!/bin/sh

cd /usr/local/src

git clone https://github.com/rakshasa/libtorrent.git

cd libtorrent
git checkout c167c5a

patch -p1 < /usr/local/src/libtorrent_linear.diff

./autogen.sh
./configure
make -j8
make install
