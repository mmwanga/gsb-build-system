GCONF_SOURCE=`gconftool-2 --get-default-source| sed 's#/etc#etc#'`

for i in etc/gconf/schemas/*.entries
do
	gconftool-2 --config-source=$GCONF_SOURCE --load $i
done
