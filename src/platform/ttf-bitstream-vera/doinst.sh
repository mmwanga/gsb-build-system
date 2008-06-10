# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

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

install_file etc/fonts/bitstream-vera.conf.new

# Update X font indexes and cache
if [ -x usr/bin/mkfontdir ]; then
  chroot . usr/bin/mkfontscale /usr/share/fonts/TTF >/dev/null 2>&1
  chroot . usr/bin/mkfontdir /usr/share/fonts/TTF >/dev/null 2>&1
fi
if [ -x usr/bin/fc-cache ]; then
  chroot . usr/bin/fc-cache /usr/share/fonts/TTF >/dev/null 2>&1
fi
