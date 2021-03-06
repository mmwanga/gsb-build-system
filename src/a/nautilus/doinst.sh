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

# Set up nautilus as default ftp desktop handler
if [ -x usr/bin/gconftool-2 ]; then
  # For nautilus to control ftp (otherwise annoying error box arises)
  usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set /desktop/gnome/url-handlers/ftp/command "nautilus \"%s\"" 1> /dev/null 2> /dev/null
  # Ensure that Nautilus is used for GNOME desktop, but Thunar or Dolphin
  usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set /desktop/gnome/session/required_components/filemanager "nautilus" 1> /dev/null 2> /dev/null
  # This ensure that nautilus will remember it's window size and position
  usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set "/apps/nautilus/preferences/navigation_window_saved_geometry" "640x480+10+10" 1> /dev/null 2> /dev/null
fi;

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
