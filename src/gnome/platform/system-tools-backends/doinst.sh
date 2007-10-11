#!/bin/sh

##
## Configuration Preservation
##

config() {
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

config etc/dbus-1/system.d/system-tools-backends.conf.new

##
## If the stb-admin group don't exist, add them:
## 
if grep "^stb-admin::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "stb-admin::86:" >> etc/group
fi

## 
## Complain if dbus somehow was removed, and disable autostart.
##
if [ ! -f etc/rc.d/rc.messagebus ]; then
	echo "System-tools-backends requires dbus.  You appear to be missing /etc/rc.d/rc.messagebus."
	echo "Perhaps you need to reinstall the dbus package?"
fi;

## 
## Make dbus executable if system-tools-backends is installed
##
if [ ! -x etc/rc.d/rc.messagebus ]; then
	chmod +x etc/rc.d/rc.messagebus;
fi;

##
## Restart dbus (reload system-tools-backends info), and start services
##
if [ -x etc/rc.d/rc.messagebus ]; then
	. etc/rc.d/rc.messagebus restart;
fi;
