# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Restart gconfd-2 to reload new settings
killall -HUP gconfd-2 >/dev/null 2>&1
