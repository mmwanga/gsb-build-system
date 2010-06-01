# Remove old .new xinitrc if it exists
rm -f $PKG/etc/X11/xinit/xinitrc.gnome.new

# Update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Enable gnome-wm as windowizer
usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set /desktop/gnome/session/required_components/windowmanager gnome-wm 1> /dev/null 2> /dev/null 

# Set GSB splash screen as default
usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set /apps/gnome-session/options/splash_image splash/gnome-splash.png 1> /dev/null 2> /dev/null

# Disable splash screen by default
usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type boolean --set /apps/gnome-session/options/show_splash_screen false 1> /dev/null 2> /dev/null

# Update icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
