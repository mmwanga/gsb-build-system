# Install new info files
if [ -x usr/bin/install-info ]; then
  usr/bin/install-info usr/info/libtasn1.info.gz usr/info/dir >/dev/null 2>&1
fi

