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

install_file etc/fonts/bitstream-vera.conf.new

# Update X font indexes and cache
if [ -x usr/bin/mkfontdir ]; then
  chroot . usr/bin/mkfontscale /usr/share/fonts/TTF >/dev/null 2>&1
  chroot . usr/bin/mkfontdir /usr/share/fonts/TTF >/dev/null 2>&1
fi
if [ -x usr/bin/fc-cache ]; then
  chroot . usr/bin/fc-cache /usr/share/fonts/TTF >/dev/null 2>&1
fi
