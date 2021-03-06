# update desktop entires
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# update hicolor icon cache
if [ -e usr/share/ccsm/icons/hicolor/icon-theme.cache ]; then
    rm -f usr/share/ccsm/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/ccsm/icons/hicolor
