config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/rc.d/rc.saslauthd.new
config usr/lib/sasl2/smtpd.conf.new

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
        echo "#!/bin/sh" > etc/rc.d/rc.local
        chmod 755 etc/rc.d/rc.local
fi

# if rc.saslauthd is executable, run it on startup
run=`grep ". /etc/rc.d/rc.saslauthd" etc/rc.d/rc.local`
if [[ "${run}" == "" ]]; then
cat << EOF >> etc/rc.d/rc.local

# To disable saslauthd, chmod rc.dbus to 644
if [ -x /etc/rc.d/rc.saslauthd ]; then
  echo "Starting SaSLAuthD"
  . /etc/rc.d/rc.saslauthd start
fi
EOF
fi
