#!/bin/sh

apt update

echo "Installing building deps"

apt install -y git \
	subversion \
	build-essential \
	automake \
	libtool \
	libcppunit-dev \
	libcurl4-openssl-dev \
	libsigc++-2.0-dev \
	libncurses5-dev \
	zlib1g-dev \
	libssl-dev \
	vim-tiny nano
