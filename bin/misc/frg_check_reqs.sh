#!/bin/sh
#
# Script to check some pre-requisites for FRG
#
# check on some packages, mozilla, libexif, perl, python
# 
#
#
FRGROOT=`dirname $0`

REQUIRED_PACKAGES="
bar
perl-5.8.6-i486-1
mozilla-1.7.6-i486-1
python-2.4-i486-1
libexif-0.6.11-i486-1
flac-1.1.1-i486-1
libogg-1.1-i486-1
libao-0.8.5-i486-1
libjpeg-6b-i386-4
libpng-1.2.8-i486-1
libtiff-3.7.1-i486-2
libmad-0.15.1b-i486-1
foo
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

if [ -n $MISSING_PACKAGES ]; then
    echo ""
    echo "The following packages are missing:"
    echo ""

    for i in $MISSING_PACKAGES
    do
      echo $i
    done

    echo ""
    echo "Please install them from your Slackware CDs"
    echo ""
fi
