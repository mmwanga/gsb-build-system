# Update the X font indexes:
if [ -x usr/bin/fc-cache ]; then
  chroot . usr/bin/fc-cache -f
fi

if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
