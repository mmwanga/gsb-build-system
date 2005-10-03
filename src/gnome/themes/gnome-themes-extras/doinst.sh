for i in Amaranth Gorilla Nuvola Lush Wasp
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
	usr/bin/gtk-update-icon-cache -q --ignore-theme-index usr/share/icons/$i
done

