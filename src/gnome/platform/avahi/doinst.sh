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

config etc/rc.d/rc.avahidaemon.new
config etc/rc.d/rc.avahidnsconfd.new

##
## Modify passwd and group to add avahi and netdev groups
##

##
## If the avahi user don't exist, add them:
## 
if grep "^avahi:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "avahi:x:86:86:avahi:/etc/avahi:" >> etc/passwd
fi
if grep "^avahi:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "avahi:*:9797:0:::::" >> etc/shadow
fi

##
## If the avahi group don't exist, add them:
## 
if grep "^avahi::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "avahi::86:avahi" >> etc/group
fi

##
## If the netdev group don't exist, add them:
## 
if grep "^netdev::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "netdev::87:avahi" >> etc/group
fi

##
## If rc.local doesn't exist, create it
##
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi
	
# If rc.avahi is executable, run it on startup
run=`grep ". /etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then	
cat << EOF >> etc/rc.d/rc.local

# To disable avahi, chmod rc.avahidaemon to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  echo "Starting the Avahi Zeroconf Subsystem: "
  . /etc/rc.d/rc.avahidaemon start
  . /etc/rc.d/rc.avahidnsconfd start
fi
EOF
fi

##
## Update Desktop Database with Avahi .desktops
##
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

## 
## Complain if dbus somehow was removed, and disable autostart.
##
if [ ! -f /etc/rc.d/rc.messagebus ]; then
	echo "Avahi requires dbus.  You appear to be missing /etc/rc.d/rc.messagebus."
	echo "Perhaps you need to reinstall the dbus package?"
	chmod -x /etc/rc.d/rc.avahi*
fi;

## 
## Make dbus executable if avahi is installed
##
if [ ! -x /etc/rc.d/rc.messagebus ]; then
	chmod +x /etc/rc.d/rc.messagebus;
fi;

##
## Restart dbus (reload avahi info), and start services
##
if [ -x /etc/rc.d/rc.messagebus ]; then
	chmod +x /etc/rc.d/rc.avahi*;
	. /etc/rc.d/rc.messagebus restart;
	. /etc/rc.d/rc.avahidaemon restart;
	. /etc/rc.d/rc.avahidnsconfd restart;
fi;
