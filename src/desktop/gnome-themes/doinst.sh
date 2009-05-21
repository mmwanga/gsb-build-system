for i in HighContrast-SVG Crux Mist HighContrast LargePrint HighContrastLargePrint ;
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
#usr/bin/gtk-update-icon-cache -q -f --ignore-theme-index usr/share/icons/$i
done
