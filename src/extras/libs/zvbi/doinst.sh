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

config etc/rc.d/rc.zvbid.new

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
        echo "#!/bin/sh" > etc/rc.d/rc.local
        chmod 755 etc/rc.d/rc.local
fi

# if rc.bluetooth executable, run it on startup
run=`grep ". /etc/rc.d/rc.zvbid" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then
cat << EOF >> etc/rc.d/rc.local

# To disable zvbid, chmod rc.zvbid to 644
if [ -x /etc/rc.d/rc.zvbid ]; then
  . /etc/rc.d/rc.zvbid start
fi
EOF
fi

