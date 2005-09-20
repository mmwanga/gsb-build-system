#!/bin/sh
#
# Script to check some pre-requisites for FRG
#

FRGROOT=`dirname $0`

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
    PACKAGE=$1

    if [ ! -f "/var/log/packages/$PACKAGE-*" ]; then
	MISSING_PACKAGES="$MISSING_PACKAGES $i"
    fi
}

for i in $REQUIRED_PACKAGES
do
  check_packages $i
done

if [ -n "$MISSING_PACKAGES" ]; then
    echo ""
    echo "The following packages are missing:"
    echo ""

    for i in $MISSING_PACKAGES
    do
      echo $i
    done

    echo ""
    echo "Please install them from your Slackware CDs or a slackware mirror"
    echo ""
fi
