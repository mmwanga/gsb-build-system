# update mime database
if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database /usr/share/mime 2> /dev/null 1> /dev/null
fi

# update desktop entries
if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database 2> /dev/null 1> /dev/null
fi
