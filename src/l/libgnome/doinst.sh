# Update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime/ >/dev/null 2>&1
fi

# update icon cache
for i in gnome hicolor
do
        if [ -e usr/share/icons/$i/icon-theme.cache ]; then
                rm -f usr/share/icons/$i/icon-theme.cache
        fi
        usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i 1>/dev/null 2>/dev/null
done

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
  killall -HUP gconfd-2 ;
fi
