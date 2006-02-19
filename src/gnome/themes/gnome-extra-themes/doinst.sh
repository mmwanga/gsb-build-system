for i in Suede firefox-thunderbird TiCons gcezanne Edge-Icons-0.4 \
	etiquette DebianIcons-vitamin-0.4a Glossed MacOS-X Kreski-Lines \
	MMX-Mercury-L Marcintesh_OS-L-Black-Icons Marcintesh_OS-L-Blue-Icons \
	Marcintesh_OS-L-Green-Icons Marcintesh_OS-L-White-Icons Xi-GNOME d3a-icons \
	gartoon exquisite gnant Lila
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
	usr/bin/gtk-update-icon-cache -q -f --ignore-theme-index usr/share/icons/$i
done

