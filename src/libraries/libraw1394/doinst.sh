if [ ! -e dev/raw1394 ]; then
  chroot . usr/bin/mknod -m 660 dev/raw1394 c 171 0
  chroot . usr/bin/chown root.video dev/raw1394
  echo
  echo "/dev/raw1394 created"
  echo "It is owned by root/video with permissions 660.  You may "
  echo "want to fix the group/permission to something appropriate for you."
  echo "Note however that anyone who can open raw1394 can access all"
  echo "devices on all connected 1394 buses unrestricted, including"
  echo "harddisks and other probably sensitive devices."
  echo
fi
