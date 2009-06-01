# preserve files
install_file() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

install_file etc/X11/xinit/xinitrc.gnome.new

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Set GSB splash screen as default
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
  --set /apps/gnome-session/options/splash_image splash/gsb-splash.png 1> /dev/null 2> /dev/null
# Ensure sound server start up
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
  --set /desktop/gnome/sound/enable_esd false 1> /dev/null 2> /dev/null
# Enable splash screen
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
  --set /apps/gnome-session/options/show_splash_screen true 1> /dev/null 2> /dev/null
# Enable gnome-wm as windowizer
GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
  --set /desktop/gnome/session/required_components/windowmanager gnome-wm 1> /dev/null 2> /dev/null

# update icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
