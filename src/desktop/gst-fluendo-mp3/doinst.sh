if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database /usr/share/mime 
fi

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database 
fi
