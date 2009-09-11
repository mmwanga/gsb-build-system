# Preserve new configuration files
install_file() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then 
  # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

if [ ! -e etc/rc.d/rc.bluetooth -o ! -x etc/rc.d/rc.bluetooth ]; then
  chmod 644 etc/rc.d/rc.bluetooth.new
else
  chmod 755 etc/rc.d/rc.bluetooth.new
fi

install_file etc/alsa/bluetooth.conf.new
install_file etc/dbus-1/system.d/bluetooth.conf.new
install_file etc/bluetooth/audio.conf.new
install_file etc/bluetooth/input.conf.new
install_file etc/bluetooth/network.conf.new
install_file etc/bluetooth/main.conf.new
install_file etc/bluetooth/rfcomm.conf.new
install_file etc/rc.d/rc.bluetooth.new
install_file etc/bluetooth/passkeys/default.new
#install_file etc/default/bluetooth.new
