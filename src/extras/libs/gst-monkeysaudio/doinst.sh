chroot . sbin/ldconfig 1> /dev/null 2> /dev/null

if [ -x usr/bin/gst-register ]; then
  chroot . usr/bin/gst-register 1> /dev/null 2> /dev/null
fi
