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

config etc/rc.d/rc.howl.new

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi
	
# if rc.howl is executable, run it on startup
run=`grep ". /etc/rc.d/rc.howl" etc/rc.d/rc.local`
if [[ "${run}" == "" ]]; then	
cat << EOF >> etc/rc.d/rc.local

# To disable howl, chmod rc.howl to 644
if [ -x /etc/rc.d/rc.howl ]; then
  echo "Starting Howl mDNS daemons"
  . /etc/rc.d/rc.howl start
fi
EOF
fi

