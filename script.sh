#!/bin/sh

tar -pxzf distro.tar.gz

rootfs=distro
rootiso=iso
initramfs=xyz.gz

cd $rootfs
find . | cpio -o -H newc | gzip -9 > ../$initramfs

cd ..
cp $initramfs $rootiso
cd $rootiso

genisoimage -r -V "xyz" -cache-inodes -J -l -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../xyz.iso .

rm ../$initramfs
