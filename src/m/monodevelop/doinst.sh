# Update desktop database
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi

# Update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime/ >/dev/null 2>&1
fi

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor 1>/dev/null 2>/dev/null

# http://www.monodevelop.com/Inotify_Watches_Limit
echo "fs.inotify.max_user_watches=16384" >> etc/sysctl.conf  >/dev/null 2>&1
