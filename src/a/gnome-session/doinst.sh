# Remove old .new xinitrc if it exists
rm -f $PKG/etc/X11/xinit/xinitrc.gnome.new

# Update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Update icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor

# glib2 compile FileChooser schema
if [ -x usr/bin/glib-compile-schemas ]; then
  usr/bin/glib-compile-schemas usr/share/glib-2.0/schemas
fi
