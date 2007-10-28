if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

for i in gnome hicolor
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
    usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/icons/$i
done
