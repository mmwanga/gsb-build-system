ldconfig -r .

install_file etc/dbus-1/system.d/newprinternotification.conf.new

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Warning if we're missing the rc.cups script
if [ ! -f etc/rc.d/rc.cups ]; then
	echo "You seem to be missing the /etc/rc.d/rc.cups startup script."
	echo "The cupsd daemon must be running in order to use system-config-printer."
fi;
