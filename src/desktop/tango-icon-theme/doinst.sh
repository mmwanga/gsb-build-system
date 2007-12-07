if [ -e usr/share/icons/Tango/icon-theme.cache ]; then
	rm -f usr/share/icons/Tango/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/icons/Tango

# Set Tango as GSB default Icon theme
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /desktop/gnome/interface/icon_theme Tango
