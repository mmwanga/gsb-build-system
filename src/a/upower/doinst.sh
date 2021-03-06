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

install_file etc/dbus-1/system.d/org.freedesktop.UPower.conf.new
install_file etc/UPower/UPower.conf.new

# restart udev to load new upower rules.
chroot . /etc/rc.d/rc.udev reload
