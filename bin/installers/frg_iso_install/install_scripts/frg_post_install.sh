#!/bin/sh
#
# script to be run post frg install
#

CWD=`pwd`

if [ $ROOT != "" ]; then
  cd $ROOT
else
  cd /
fi

usr/bin/gdk-pixbuf-query-loaders > etc/gtk-2.0/gdk-pixbuf.loaders
usr/bin/gtk-query-immodules-2.0 > etc/gtk-2.0/gtk.immodules

for i in `bin/ls -1 usr/share/icons`
do
       if [ -e usr/share/icons/$i/icon-theme.cache ]; then
               rm -f usr/share/icons/$i/icon-theme.cache
       fi
       usr/bin/gtk-update-icon-cache usr/share/icons/$i
done

usr/bin/update-mime-database usr/share/mime
usr/bin/update-desktop-database

sh "$FRGROOT"/install_scripts/frg_check_reqs.sh

# $RCD

if [ "$NO_PROMPT" != "true" ]; then

    printf "*********************************

Do you want to enable the rc.d scripts for Freerock GNOME packages?\n"

    echo "
1) Yes
2) No
"

    printf "Selection: "
    read rcd_selection
    echo ""
fi


if [ "$RCD" = "on" ]; then
    rcd_selection=1
fi

if [ "$RCD" = "off" ]; then
    rcd_selection=2
fi

case "$rcd_selection" in
'1')
	echo ""
	echo "Enabling D-BUS"
	chmod +x etc/rc.d/rc.messagebus
	echo "Enabling Hal"
	chmod +x etc/rc.d/rc.hal
	echo ""
	echo "rc.howl, rc.saslauthd and rc.openldap are in also in"
	echo "etc/rc.d for your consideration"
	;;
'2')
	echo ""
	echo "No rc.d scripts enabled"
	echo ""
	;;
*)
	echo ""
	echo "No rc.d scripts enabled"
	echo ""
esac

cd "$CWD"

