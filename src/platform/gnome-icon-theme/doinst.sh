if [ -e usr/share/icons/gnome/icon-theme.cache ]; then
    rm -f usr/share/icons/gnome/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -q -f usr/share/icons/gnome

