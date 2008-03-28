if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database /usr/share/mime 
fi

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database 
fi

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
