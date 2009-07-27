for i in Gion Neu Foxtrot gnome-alternative;
do
    # These don't really need icon caches
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
done
