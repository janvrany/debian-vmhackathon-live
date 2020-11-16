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
