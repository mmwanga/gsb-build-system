if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

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

## Preserve any previous customizations
install_file etc/slapt-get/gsb.slapt-getrc.new

if [ -e usr/share/icons/gnome/icon-theme.cache ]; then
    rm -f usr/share/icons/gnome/icon-theme.cache
fi

usr/bin/gtk-update-icon-cache -f -q --ignore-theme-index usr/share/icons/gnome
