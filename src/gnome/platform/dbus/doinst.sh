#!/bin/sh

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

config etc/rc.d/rc.messagebus.new

# If the messagebus user/group don't exist, add them:
if grep "^messagebus:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "messagebus:x:60:60:messagebus:/etc/dbus-1:" >> etc/passwd
fi
if grep "^messagebus::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "messagebus::60:messagebus" >> etc/group
fi
if grep "^messagebus:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "messagebus:*:9797:0:::::" >> etc/shadow
fi

# most of this doinst.sh is taken from the dropline doinst.sh script for dbus
if [ ! -d var/lib/dbus ]; then
	mkdir -p var/lib/dbus
fi

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi
	
# if rc.messagebus is executable, run it on startup
run=`grep ". /etc/rc.d/rc.messagebus" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then	
cat << EOF >> etc/rc.d/rc.local

# To disable dbus, chmod rc.messagebus to 644
if [ -x /etc/rc.d/rc.messagebus ]; then
  echo "Starting D-BUS Messaging Subsystem"
  . /etc/rc.d/rc.messagebus start
fi
EOF
fi

