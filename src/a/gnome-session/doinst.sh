# Remove old .new xinitrc if it exists
rm -f $PKG/etc/X11/xinit/xinitrc.gnome.new

# Update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Enable gnome-wm as windowizer
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
  --set /desktop/gnome/session/required_components/windowmanager gnome-wm 1> /dev/null 2> /dev/null

# Set GSB splash screen as default
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
  --set /apps/gnome-session/options/splash_image splash/gsb-splash.png 1> /dev/null 2> /dev/null

# Disable splash screen by default
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
  --set /apps/gnome-session/options/show_splash_screen false 1> /dev/null 2> /dev/null

# Update icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
