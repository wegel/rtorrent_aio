#!/bin/sh

mkdir -p /usr/local/src

cd /usr/local/src
svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/advanced xmlrpc-c
cd xmlrpc-c

./configure
make
make install

cd ..
cp -r xmlrpc-c /usr/share
