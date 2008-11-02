if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Set GSB background as default
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /desktop/gnome/background/picture_filename /usr/share/pixmaps/backgrounds/gsb-background.png 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /desktop/gnome/background/picture_options stretched 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set  /desktop/gnome/peripherals/mouse/cursor_theme whiteglass 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type integer --set /desktop/gnome/peripherals/mouse/cursor_size 16 1> /dev/null 2> /dev/null

for i in gnome hicolor
do
	if [ -e usr/share/icons/$i/icon-theme.cache ]; then
		rm -f usr/share/icons/$i/icon-theme.cache
	fi
	usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i
done
