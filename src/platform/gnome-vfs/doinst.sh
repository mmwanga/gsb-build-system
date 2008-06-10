# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime/ >/dev/null 2>&1
fi

# Restart gconfd-2 to reload new settings
killall -HUP gconfd-2 >/dev/null 2>&1
