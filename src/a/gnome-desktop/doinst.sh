# refresh scrollkeeper database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# set gsb background as default
if [ -x usr/bin/gconftool-2 ]; then
  GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
    --set /desktop/gnome/background/picture_filename /usr/share/pixmaps/backgrounds/gsb-background.png 1> /dev/null 2> /dev/null
  GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
    --set /desktop/gnome/background/picture_options stretched 1> /dev/null 2> /dev/null
  GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
    --set  /desktop/gnome/peripherals/mouse/cursor_theme comixcursors 1> /dev/null 2> /dev/null
  GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type integer \
     --set /desktop/gnome/peripherals/mouse/cursor_size 16 1> /dev/null 2> /dev/null
fi;

# refresh gnome icon cache
for i in gnome hicolor
do
	if [ -e usr/share/icons/$i/icon-theme.cache ]; then
		rm -f usr/share/icons/$i/icon-theme.cache
	fi
	usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i 1>/dev/null 2>/dev/null
done
