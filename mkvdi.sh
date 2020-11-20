#!/bin/bash

set -e

if [ -r live-image-amd64.img ]; then
	echo "ERROR: live-image-amd64.img exists, please remove first"
	exit 1
fi
if [ -r live-image-amd64.vdi ]; then
	echo "ERROR: live-image-amd64.vdi exists, please remove first"
	exit 2
fi
if [ ! -r live-image-amd64.hybrid.iso ]; then
	echo "ERROR: live-image-amd64.hybrid.iso does NOT exist, please run 'sudo lb binary'";
	exit 3
fi

set -x

LOOPDEV=/dev/loop0

truncate -s 10G live-image-amd64.img
sudo losetup -P "${LOOPDEV}" live-image-amd64.img
sudo losetup -a
sudo ./mkusb-minp -p live-image-amd64.hybrid.iso "${LOOPDEV}"
read ignored
sudo losetup -d "${LOOPDEV}"
qemu-img convert -f raw -O vdi live-image-amd64.img live-image-amd64.vdi
sha256sum live-image-amd64.vdi > live-image-amd64.vdi.sha256
