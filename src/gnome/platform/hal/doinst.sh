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

config etc/rc.d/rc.hal.new

# If the haldaemon user/group don't exist, add them:
if grep "^haldaemon:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "haldaemon:x:61:61:haldaemon:/:" >> etc/passwd
fi
if grep "^haldaemon::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "haldaemon::61:haldaemon" >> etc/group
fi
if grep "^haldaemon:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "haldaemon:*:9797:0:::::" >> etc/shadow
fi

# most of this is taken from dropline's hal package
# the patches for hal are also from dropline's sources

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi

# if rc.hal is executable, run it on startup
run=`grep ". /etc/rc.d/rc.hal" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then
cat << EOF >> etc/rc.d/rc.local

# To disable hal, chmod rc.hal to 644
if [ -x /etc/rc.d/rc.hal ]; then
	echo "Starting HAL"
	# wait a few seconds to let udev complete its 
	# initialization.  Otherwise hald will not recognize CD/DVD
	# drives and will not start polling them
( sleep 5; /etc/rc.d/rc.hal start ) &
fi
EOF
fi

# make sure sysfs exists in /etc/fstab
sysfs=`grep "sysfs" etc/fstab`
if [[ "${sysfs}" == "" ]]; then
	echo "none		/sys		sysfs		defaults	0   0" >> etc/fstab
fi

# make sure /sys exists
if [ ! -d sys ]; then
	mkdir -p sys
fi
