# Make sure xfce thunar doesn't steal our job
if [ -f usr/share/applications/Thunar-folder-handler.desktop ]; then
  echo "Disabling Thunar GNOME folder handling."
  mv -f usr/share/applications/Thunar-folder-handler.desktop \
   usr/share/applications/Thunar-folder-handler.desktop.disabled
fi;

# update rarian database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime 1> /dev/null 2> /dev/null
fi;

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor 2>/dev/null 1>/dev/null

# compile glib2 schemas
if [ -x usr/bin/glib-compile-schemas ]; then
  usr/bin/glib-compile-schemas usr/share/glib-2.0/schemas
fi

