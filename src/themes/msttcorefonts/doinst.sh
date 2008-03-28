# font install portion is based on Eric Hameleers <alien@slackware.com>.
#
# Font directory location depends on the X build prefix:
# Determine what X we're running (the modular X returns the prefix
# in the next command, while older versions stay silent):

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

#install_file etc/fonts/alias.conf.new
#install_file etc/fonts/misc.conf.new
#install_file etc/fonts/local.conf.new
#install_file etc/fonts/msfonts-rules.conf.new

XPREF=`pkg-config --variable=prefix x11` || true
if [ "$XPREF" == "" ]; then
  XPREF='/usr/X11R6'
  FONTDIR="$XPREF/lib/X11/fonts/TTF"
else
  FONTDIR="/usr/share/fonts/TTF"
fi

# Update X font indexes and the font cache:
if [ -x $XPREF/bin/mkfontdir ]; then
  chroot . $XPREF/bin/mkfontscale $FONTDIR
  chroot . $XPREF/bin/mkfontdir $FONTDIR
fi
if [ -x $XPREF/bin/fc-cache ]; then
  chroot . $XPREF/bin/fc-cache $FONTDIR
fi
