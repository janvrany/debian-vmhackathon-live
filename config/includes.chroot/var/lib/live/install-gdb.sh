#!/bin/bash

set -ex

repo=https://github.com/janvrany/binutils-gdb

echo "Installing GDB from ${repo}"

apt-get -y install \
	build-essential texinfo python3-dev \
	flex bison libexpat1-dev libsource-highlight-dev

rm -rf /tmp/binutils-gdb

git clone --depth=1 "${repo}" /tmp/binutils-gdb
(cd /tmp/binutils-gdb && ./configure --prefix=/opt/gdb --disable-werror --with-guile=no --with-python=/usr/bin/python3 --enable-targets=all)
make -C /tmp/binutils-gdb -j2
make -C /tmp/binutils-gdb install

rm -rf /tmp/binutils-gdb
