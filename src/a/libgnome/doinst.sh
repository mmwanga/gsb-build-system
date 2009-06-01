# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime/ >/dev/null 2>&1
fi

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
  killall -HUP gconfd-2 ;
fi
