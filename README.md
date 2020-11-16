# 2nd International VM Hackathon Live CD

## How to build the Live CD

1. Install prereqs:

   ```
   apt-get install live-build arch-install-scripts
   ```

2. Clone this repo:

   ```
   git clone https://github.com/janvrany/debian-vmhackathon-live
   cd debian-vmhackathon-live
   ```

3. Configure:

   ```
   lb config
   ```

4. Build initial chroot of live system:

   ```
   sudo lb bootstrap && sudo lb chroot
   ```

5. Build extras for live system:

   ```
   mkdir -p config/install.chroot/opt
   sudo mount --bind chroot chroot
   sudo mount --bind config/includes.chroot/opt chroot/opt

   sudo arch-chroot chroot /var/lib/live/install-gdb.sh
   sudo arch-chroot chroot /var/lib/live/install-stx.sh
   sudo arch-chroot chroot /var/lib/live/install-vdb.sh
   
   sudo umount chroot/opt
   sudo umount chroot
   ```

6. Build final chroot:

   ```
   sudo lb clean && sudo lb bootstrap && sudo lb chroot
   ```

7. Build the Live CD .iso:

   ```
   sudo lb binary
   ```

## How to build a disk image with persistency (for VirtualBox)

1. Create a disk image file:

   ```
   truncate -s 2G live-image-amd64.img
   ```

2. Setup a loopback block device:

   ```
   sudo losetup -fP live-image-amd64.img && sudo losetup -a
   ```

   Note the output of last command to see which loopback device to use in following steps.

3. Copy .iso to the image and setup persistency (assuming `/dev/loop0` is the name of the loopback device creared in previous step):

   !!! BE SUPER DUPER EXTRA CAREFULL !!!

   !!! AGAIN, DOUBLE CHECK EVERYTHING !!!

   !!! SERIOUSLY !!!

   ```
   sudo ./mkusb-minp -p live-image-amd64.hybrid.iso /dev/loop0
   ```

4. Delete / deconfigure loopback device (assuming `/dev/loop0` is the name of the loopback device creared in previous step):

   ```
   sudo losetup -d /dev/loop0
   ```

5. Convert the image to `.vdi` format:

   ```
   qemu-img convert -f raw -O vdi live-image-amd64.img live-image-amd64.vdi
   ```

