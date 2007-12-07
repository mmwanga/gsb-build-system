if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Set GSB background as default
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /desktop/gnome/background/picture_filename backgrounds/gsb-background.png
