for i in Crux HighContrast HighContrast-SVG HighContrastInverse \
          HighContrastLargePrintInverse HighContrastLargePrint \
	LargePrint LowContrast LowContrastLargePrint Mist 
do
    if [ -e usr/share/icons/$i/icon-theme.cache ]; then
        rm -f usr/share/icons/$i/icon-theme.cache
    fi
	usr/bin/gtk-update-icon-cache -q -f --ignore-theme-index usr/share/icons/$i
done

