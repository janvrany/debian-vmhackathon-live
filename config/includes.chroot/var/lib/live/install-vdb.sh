#!/bin/bash

set -ex

echo "Installing VDB"

if [ -d config/includes.chroot ]; then
    prefix=config/includes.chroot/opt/vdb
else
	prefix=/opt/vdb
fi

mkdir -p "${prefix}/jv"

hg clone https://swing.fit.cvut.cz/hg/jv-libgdbs "${prefix}/jv/libgdbs"
hg clone https://swing.fit.cvut.cz/hg/jv-vdb     "${prefix}/jv/vdb"