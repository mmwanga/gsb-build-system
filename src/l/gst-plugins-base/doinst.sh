# update mime database
if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database /usr/share/mime 2> /dev/null 1> /dev/null
fi
