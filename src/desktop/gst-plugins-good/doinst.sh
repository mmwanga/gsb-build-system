if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database /usr/share/mime 2> /dev/null 1> /dev/null
fi

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database 2> /dev/null 1> /dev/null
fi

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
