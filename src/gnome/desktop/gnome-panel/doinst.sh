for i in /etc/gconf/schemas/*.entries
do
	gconftool-2 --config-source=`gconftool-2 --get-default-source` --load $i
done
