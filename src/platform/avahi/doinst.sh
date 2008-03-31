#!/bin/sh

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

install_file etc/rc.d/rc.avahidaemon.new
install_file etc/rc.d/rc.avahidnsconfd.new
install_file etc/dbus-1/system.d/avahi-dbus.conf.new

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
  echo "avahi:*:86:0:::::" >> etc/shadow
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
  echo "netdev::85:avahi" >> etc/group
fi

##
## If rc.local doesn't exist, create it
##
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi

##
## If rc.local_shutdown doesn't exist, create it
##
if [ ! -e etc/rc.d/rc.local_shutdown ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local_shutdown
	chmod 755 etc/rc.d/rc.local_shutdown
fi
	
# If rc.avahi is executable, run it on startup
run=`grep ". /etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then	
cat << EOF >> etc/rc.d/rc.local

# To disable avahi, chmod rc.avahidaemon to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  . /etc/rc.d/rc.avahidaemon start
  . /etc/rc.d/rc.avahidnsconfd start
fi
EOF
fi

# If rc.avahi is executable, make sure to shutdown properly
run=`grep ". /etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local_shutdown`
if [ "${run}" == "" ]; then	
cat << EOF >> etc/rc.d/rc.local_shutdown

# To disable avahi shutdown, chmod rc.avahidaemon to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  . /etc/rc.d/rc.avahidaemon stop
  . /etc/rc.d/rc.avahidnsconfd stop
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
if [ ! -f etc/rc.d/rc.messagebus ]; then
	echo "Avahi requires dbus.  You appear to be missing /etc/rc.d/rc.messagebus."
	echo "Perhaps you need to reinstall the dbus package?"
	chmod -x etc/rc.d/rc.avahi*
fi;

## 
## Make dbus executable if avahi is installed
##
if [ ! -x etc/rc.d/rc.messagebus ]; then
	chmod +x etc/rc.d/rc.messagebus;
fi;

##
## Restart dbus (reload avahi info), and start services
##
if [ -x etc/rc.d/rc.messagebus ]; then
	chmod +x etc/rc.d/rc.avahi*;
fi;

#By default, disable avahi at runtime.  Users must enable if they wish.
#chmod -x etc/rc.d/rc.avahi*;

#By default, enable avahi at runtime.  More and more of GNOME is using it
chmod +x etc/rc.d/rc.avahi*;
