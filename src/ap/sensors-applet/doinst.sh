# update rarian database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor 1>/dev/null 2>/dev/null
