# Preserve new configuration files
install_file() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

install_file etc/dbus-1/system.d/newprinternotification.conf.new

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Warning if we're missing the rc.cups script
if [ ! -f etc/rc.d/rc.cups ]; then
	echo "You seem to be missing the /etc/rc.d/rc.cups startup script."
	echo "The cupsd daemon must be running in order to use system-config-printer."
fi;
