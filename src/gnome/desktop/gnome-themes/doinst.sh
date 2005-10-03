for i in Crux Flat-Blue Sandy Smokey-Blue Smokey-Red HighContrast \
	LargePrint LowContrastLargePrint HighContrastLargePrint \
	LowContrast HighContrastLargePrintInverse HighContrastInverse
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
	usr/bin/gtk-update-icon-cache -q --ignore-theme-index usr/share/icons/$i
done

