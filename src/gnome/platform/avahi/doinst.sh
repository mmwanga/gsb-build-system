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

config etc/rc.d/rc.avahidaemon.new
config etc/rc.d/rc.avahidnsconfd.new

# If the avahi user/group don't exist, add them:
if grep "^avahi:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "avahi:x:86:86:avahi:/etc/avahi:" >> etc/passwd
fi
if grep "^avahi::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "avahi::86:avahi" >> etc/group
fi
if grep "^avahi:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "avahi:*:9797:0:::::" >> etc/shadow
fi

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi
	
# if rc.avahi is executable, run it on startup
run=`grep ". /etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then	
cat << EOF >> etc/rc.d/rc.local

# To disable avahi, chmod rc.avahidaemon to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  echo "Starting the Avahi Zeroconf Subsystem"
  . /etc/rc.d/rc.avahidaemon start
  . /etc/rc.d/rc.avahidnsconfd start
fi
EOF
fi

