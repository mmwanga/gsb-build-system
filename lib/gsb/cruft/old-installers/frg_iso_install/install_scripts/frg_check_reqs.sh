#!/bin/sh
#
# Script to check some pre-requisites for FRG
#
# Fixed by Mike Reynolds mike@marskreations.com
# Sun Oct  2 23:05:17 EDT 2005

REQUIRED_PACKAGES="
perl
mozilla
python
libexif
flac
libogg
libao
libmad
libmikmod
gdk-pixbuf
cdparanoia
x11
x11-xnest
"

check_packages() {
  local PKG=$1
  PACKAGE=/var/log/packages/${PKG}-[I0-9]*

  if [ ! -f $PACKAGE 2> /dev/null ]; then
  	MISSING_PACKAGES="$MISSING_PACKAGES $PKG"
  fi
}

for i in $REQUIRED_PACKAGES
do
  check_packages $i
done

if [ -n "$MISSING_PACKAGES" ]; then
    echo ""
    echo "The following package(s) are missing:"
    echo ""

    for i in $MISSING_PACKAGES
    do
      echo $i
    done

    echo ""
    echo "Please install them from your Slackware CDs or a slackware mirror"
    echo ""
else
    echo "All pre-requisites met"
fi
