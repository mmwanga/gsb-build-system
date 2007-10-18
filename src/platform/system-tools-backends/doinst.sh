#!/bin/sh

##
## Configuration Preservation
##

##
## Configuration Preservation
##

ldconfig -r .

function install_file() {
  # $1 = File to process

  FILE="$(dirname "$1")/$(basename "$1" .new)"
  if [ ! -e "$FILE" ]
  then
    mv "$FILE.new" "$FILE"
  elif [ "$(cat "$FILE" | md5sum)" != "$(cat "$FILE.new" | md5sum)" ]
  then
    #     |--------|--------------------------------------------------|
    echo "WARNING: $FILE has been customised."
    echo "         Examine the $FILE.new file"
    echo "         and integrate any changes into the custom file."
    echo
  else
    rm -f "$FILE.new"
  fi
}

install_file etc/dbus-1/system.d/system-tools-backends.conf.new
install_file etc/rc.d/rc.stb.new

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
