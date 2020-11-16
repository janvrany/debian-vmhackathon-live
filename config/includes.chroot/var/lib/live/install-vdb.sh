#!/bin/bash

set -ex

echo "Installing VDB"

mkdir -p /opt/vdb/jv

hg clone https://swing.fit.cvut.cz/hg/jv-libgdbs /opt/vdb/jv/libgdbs
hg clone https://swing.fit.cvut.cz/hg/jv-vdb /opt/vdb/jv/vdb