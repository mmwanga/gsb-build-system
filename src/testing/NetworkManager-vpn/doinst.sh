ldconfig -r .  
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

install_file etc/dbus-1/system.d/nm-openvpn-service.conf.new
install_file etc/dbus-1/system.d/nm-vpnc-service.conf.new

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
    rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor


cat << EOF

You will need to restart the dbus message system in order to load the new
NetworkManager-vpn settings.
EOF
