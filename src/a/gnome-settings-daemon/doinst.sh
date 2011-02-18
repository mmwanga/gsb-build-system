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

# Only needed for polkit
install_file etc/dbus-1/system.d/org.gnome.SettingsDaemon.DateTimeMechanism.conf.new

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor 2>/dev/null 1>/dev/null

# glib2 compile schema
if [ -x usr/bin/glib-compile-schemas ]; then
  usr/bin/glib-compile-schemas usr/share/glib-2.0/schemas
fi
