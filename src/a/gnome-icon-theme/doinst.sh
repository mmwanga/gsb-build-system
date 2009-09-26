# update gnome icons
if [ -e usr/share/icons/gnome/icon-theme.cache ]; then
        rm -f usr/share/icons/gnome/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/gnome 2>/dev/null 1>/dev/null
