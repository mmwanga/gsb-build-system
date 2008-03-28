function install_file() {
  # $1 = File to process

  FILE="$(dirname "$1")/$(basename "$1" .new)"
  if [ ! -e "$FILE" ]
  then
    mv "$FILE.new" "$FILE"
  elif [ "$(cat "$FILE" | md5sum)" != "$(cat "$FILE.new" | md5sum)" ]
  then
    # We need to make sure to install our version of the file;
    # Move the old versions out of the way.
    if [ -f $(basename "$1" .new) ];
    then
            mv $(basename "$1" .new) $(basename "$1" .new).$(date +%m%d%y);
    fi;
    # Install our new file.
    mv $1 $(basename "$1" .new)

  else
    rm -f "$FILE.new"
  fi
}

install_file etc/X11/xinit/xinitrc.gnome.new

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

## If pulseaudio installed, prefer is to esd
if [ -f /usr/bin/esdcompat ]; then
  if [ -f /usr/bin/esd -a ! -f /usr/bin/esound.pulsified ]; then
    mv -f /usr/bin/esd /usr/bin/esound.pulsified ;
  fi ;
  # Make sure pulseaudio is default instead of esd
  ln -sf /usr/bin/esdcompat /usr/bin/esd ;
fi;

# Set GSB splash screen as default
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /apps/gnome-session/options/splash_image splash/gsb-splash.png 1> /dev/null 2> /dev/null
# Ensure sound server start up
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type boolean --set /desktop/gnome/sound/enable_esd true 1> /dev/null 2> /dev/null

if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
