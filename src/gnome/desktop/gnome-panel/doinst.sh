if [ -z $ROOT ];then
	GCONF_SOURCE=`gconftool-2 --get-default-source| sed 's#/etc#etc#'`
	for i in etc/gconf/schemas/*.entries
	do
		gconftool-2 --config-source=$GCONF_SOURCE --load $i
		gconftool-2 --config-source=$GCONF_SOURCE --load $i /apps/panel
	done
else
	GCONF_SOURCE=`gconftool-2 --get-default-source`
	for i in /etc/gconf/schemas/*.entries
	do
		chroot $ROOT /usr/bin/gconftool-2 --config-source=$GCONF_SOURCE --load $i
		chroot $ROOT /usr/bin/gconftool-2 --config-source=$GCONF_SOURCE --load $i /apps/panel
	done
fi

if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper 1> /dev/null 2> /dev/null
fi
