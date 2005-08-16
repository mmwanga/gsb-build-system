GCONF_SOURCE=`chroot . usr/bin/gconftool-2 --get-default-source | sed 's#/etc#etc#'`
for i in etc/gconf/schemas/*.entries
do
	chroot . usr/bin/gconftool-2 --config-source=$GCONF_SOURCE --load $i
	chroot . usr/bin/gconftool-2 --config-source=$GCONF_SOURCE --load $i /apps/panel
done

if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper 1> /dev/null 2> /dev/null
fi
