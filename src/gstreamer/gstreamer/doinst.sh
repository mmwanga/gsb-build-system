if [ -x /usr/bin/gst-register ]; then
  /sbin/ldconfig 1> /dev/null 2> /dev/null
  /usr/bin/gst-register 1> /dev/null 2> /dev/null
fi

