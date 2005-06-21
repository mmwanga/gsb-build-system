#!/bin/sh
#
# script to be run post frg install
#

/usr/bin/update-mime-database /usr/share/mime
/usr/bin/update-desktop-database

sh "$FRGROOT"/install_scripts/frg_check_reqs.sh
