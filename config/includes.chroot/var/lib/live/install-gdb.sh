#!/bin/bash

set -ex

repo=https://github.com/janvrany/binutils-gdb

echo "Installing GDB from ${repo}"

apt-get -y install \
	build-essential texinfo python3-dev \
	flex bison libexpat1-dev libsource-highlight-dev

rm -rf /tmp/binutils-gdb

git clone --depth=1 "${repo}" /tmp/binutils-gdb
(cd /tmp/binutils-gdb && ./configure --prefix=/opt/gdb --disable-werror --with-guile=no --with-python=/usr/bin/python3 --enable-targets="i686-pc-linux-gnu,x86_64-pc-linux-gnu,i686-w64-mingw32,x86_64-w64-mingw32,riscv64-pc-linux-gnu,ppc-pc-linux-gnu")
make -C /tmp/binutils-gdb -j2
make -C /tmp/binutils-gdb install

rm -rf /tmp/binutils-gdb