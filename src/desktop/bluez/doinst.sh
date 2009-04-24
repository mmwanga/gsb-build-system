# Version: 1.0 GSB doinst.sh - Do not remove this line!
# Copyright (c) 2007, 2008:
#   Darren 'Tadgy' Austin <darren (at) gnomeslackbuild.org>, Coventry, UK.
#   Steve Kennedy <steve (at) gnomeslackbuild.org>, Exeter, UK.
# Licenced under the terms of the GNU General Public Licence version 3.
#

# Preserve new configuration files
function install_file() {
  # $1 = File to process
  FILE="$(dirname "$1")/$(basename "$1" .new)"
  if [ ! -e "$FILE" ]
  then
    mv "$FILE.new" "$FILE"
  elif [ "$(cat "$FILE" | md5sum)" != "$(cat "$FILE.new" | md5sum)" ]
  then
    #     |--------|--------------------------------------------------|
    echo "WARNING: $FILE has been customised."
    echo "         Examine the $FILE.new file"
    echo "         and integrate any changes into the custom file."
    echo
  else
    rm -f "$FILE.new"
  fi
}

if [ ! -e etc/rc.d/rc.bluetooth -o ! -x etc/rc.d/rc.bluetooth ]; then
  chmod 644 etc/rc.d/rc.bluetooth.new
else
  chmod 755 etc/rc.d/rc.bluetooth.new
fi

install_file etc/bluetooth/audio.conf.new
install_file etc/bluetooth/input.conf.new
install_file etc/bluetooth/network.conf.new
install_file etc/bluetooth/main.conf.new
install_file etc/bluetooth/rfcomm.conf.new
install_file etc/dbus-1/system.d/bluetooth.conf.new
install_file etc/rc.d/rc.bluetooth.new
install_file etc/rc.d/rc.bluetooth.conf.new

if [ ! -e etc/asound.conf ]; then
  ( cd etc ; ln -sf bluetooth/asound.conf . )
fi

