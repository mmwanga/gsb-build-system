# Preserve new configuration files
install_file() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

install_file etc/gnucash/config.new

# update rarian database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime 1> /dev/null 2> /dev/null
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
    rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/icons/hicolor

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi

# Create required slibcat file
if [ -x usr/bin/guile ]; then
  usr/bin/guile -c "(use-modules (ice-9 slib)) (require 'new-catalog)" 1> /dev/null 2> /dev/null
fi;
