#!/bin/sh
#
# Script to check some pre-requisites for FRG
#

FRGROOT=`dirname $0`

REQUIRED_PACKAGES="
perl-*-i486-*
mozilla-*-i486-*
python-*-i486-*
libexif-*-i486-*
flac-*-i486-*
libogg-*-i486-*
libao-*-i486-*
libmad-*-i486-*
libmikmod-*-i486-*
gdk-pixbuf-*-i486-*
cdparanoia-*-i386-*
x11-*-i486-*
x11-xnest-*-i486-*
"

check_packages() {
    PACKAGE=$1

    if [ ! -f /var/log/packages/$PACKAGE ]; then
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
