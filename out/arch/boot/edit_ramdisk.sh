#!/sbin/sh

mkdir /tmp/ramdisk
cp /tmp/initrd.img /tmp/ramdisk/initrd.gz
cd /tmp/ramdisk/
gunzip -c /tmp/ramdisk/initrd.gz | cpio -i
rm /tmp/ramdisk/initrd.gz
rm /tmp/initrd.img

if [ $(grep -c "mount tmpfs tmpfs /storage mode=0050,uid=0,gid=1028" /tmp/ramdisk/init.rc) == 0 ]; then
   sed -i "/mkdir \/mnt\/asec/i\ \ \ \ mount tmpfs tmpfs /storage mode=0050,uid=0,gid=1028" /tmp/ramdisk/init.rc
fi

if [ $(grep -c "init.d" /tmp/ramdisk/init.rc) == 0 ]; then
   echo "" >> /tmp/ramdisk/init.rc
   echo "service userinit /system/xbin/busybox run-parts /system/etc/init.d" >> /tmp/ramdisk/init.rc
   echo "    oneshot" >> /tmp/ramdisk/init.rc
   echo "    class late_start" >> /tmp/ramdisk/init.rc
   echo "    user root" >> /tmp/ramdisk/init.rc
   echo "    group root" >> /tmp/ramdisk/init.rc
fi

find . | cpio -o -H newc | gzip > /tmp/initrd.img
