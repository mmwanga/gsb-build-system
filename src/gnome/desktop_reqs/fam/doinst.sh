#!/bin/sh

if [ ! -e /etc/fam.conf ]; then
	mv /etc/fam.conf.NEW /etc/fam.conf
fi

editconf="perl /usr/lib/fam/editconf.perl"
echo "Adding fam to rpc..."
$editconf rpc add 391002 "sgi_fam         391002"
echo "Adding fam to inetd.conf..."
$editconf inetd.conf add '\b(fam|FAM)\b' \
"# fam, the File Alteration Monitor, http://oss.sgi.com/projects/fam/" \
"sgi_fam/1-2 stream rpc/tcp wait root /usr/bin/fam fam"
echo "Restarting inetd..."
killall -HUP inetd


