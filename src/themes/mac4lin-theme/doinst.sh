# This doinst is based on Eric Hameleers <alien@slackware.com>.
#
# Font directory location depends on the X build prefix:
# Determine what X we're running (the modular X returns the prefix
# in the next command, while older versions stay silent):

XPREF=`pkg-config --variable=prefix x11` || true
if [ "$XPREF" == "" ]; then
  XPREF='/usr/X11R6'
  FONTDIR="$XPREF/lib/X11/fonts/TTF"
else
  FONTDIR="/usr/share/fonts/TTF"
fi

# Update X font indexes and the font cache:
if [ -x .$XPREF/bin/mkfontdir ]; then
  chroot . $XPREF/bin/mkfontscale $FONTDIR
  chroot . $XPREF/bin/mkfontdir $FONTDIR
fi
if [ -x .$XPREF/bin/fc-cache ]; then
  chroot . $XPREF/bin/fc-cache $FONTDIR
fi

for i in gnome hicolor mac4lin
do
	if [ -e usr/share/icons/$i/icon-theme.cache ]; then
		rm -f usr/share/icons/$i/icon-theme.cache
	fi
	usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i
done
