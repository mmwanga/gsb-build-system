for i in Suede firefox-thunderbird TiCons gcezanne Edge-Icons-0.4 \
	etiquette DebianIcons-vitamin-0.4a Glossed MacOS-X Kreski-Lines \
	MMX-Mercury-L Marcintesh_OS-L-Icon-Color_Pack Xi-GNOME d3a-icons \
	gartoon exquisite gnant lila-gnome
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
	usr/bin/gtk-update-icon-cache usr/share/icons/$i
done

