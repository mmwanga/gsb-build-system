#!/bin/sh
# script to be run post install
#

FRGROOT=`dirname $0`

/usr/bin/update-mime-database /usr/share/mime
/usr/bin/update-desktop-database

$FRGROOT/frg_check_reqs.sh