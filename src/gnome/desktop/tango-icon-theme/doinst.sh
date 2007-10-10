if [ -e usr/share/icons/Tango/icon-theme.cache ]; then
	rm -f usr/share/icons/Tango/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/icons/Tango
