# refresh icon cache for gnome and hicolor
for i in gnome hicolor
do
        if [ -e usr/share/icons/$i/icon-theme.cache ]; then
                rm -f usr/share/icons/$i/icon-theme.cache
        fi
        usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i
done
