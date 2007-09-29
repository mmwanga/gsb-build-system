if [ -e usr/share/icons/Tango/icon-theme.cache ]; then
	rm -f usr/share/icons/Tango/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/icons/Tango

## 
## Change default icon theme to Tango!
##
if [ -x usr/bin/gconftool-2 ]; then
	usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /desktop/gnome/interface/icon_theme Tango
fi;
