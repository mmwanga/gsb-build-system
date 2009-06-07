# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Update desktop database
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi

# Update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime/ >/dev/null 2>&1
fi

# http://www.monodevelop.com/Inotify_Watches_Limit
echo "fs.inotify.max_user_watches=16384" >> etc/sysctl.conf  >/dev/null 2>&1
