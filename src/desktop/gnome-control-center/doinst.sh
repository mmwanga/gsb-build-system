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

install_file etc/gnome/xdg/menus/gnomecc.menu.new

# update rarian scrollkeeper database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime 1> /dev/null 2> /dev/null
fi;

## Allow users to modify the list of user-specified or Favorite applications
if [ -x usr/bin/gconftool-2 ]; then
   GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type string \
     --set /desktop/gnome/applications/main-menu/lock-down/user_modifiable_apps True >/dev/null 2>&1
fi;

# refresh gnome icon cache
for i in gnome hicolor
do
        if [ -e usr/share/icons/$i/icon-theme.cache ]; then
                rm -f usr/share/icons/$i/icon-theme.cache
        fi
        usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i 1>/dev/null 2>/dev/null
done

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
