if [ ! -e dev/raw1394 ]; then
  chroot . usr/bin/mknod -m 660 dev/raw1394 c 171 0
  chroot . usr/bin/chown root.video dev/raw1394
fi
