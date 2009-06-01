# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
  killall -HUP gconfd-2 ;
fi
