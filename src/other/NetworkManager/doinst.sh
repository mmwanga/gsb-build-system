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

config etc/rc.d/rc.networkmanager.new

# if rc.local doesn't exist, create it
if [ ! -e /etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > /etc/rc.d/rc.local
	chmod 755 /etc/rc.d/rc.local
fi
	
# if rc.networkmanager is executable, run it on startup
run=`grep ". /etc/rc.d/rc.networkmanager" /etc/rc.d/rc.local`
if [[ "${run}" == "" ]]; then	
	# run rc.networkmanager from rc.local
	echo "" >> /etc/rc.d/rc.local
	echo "# To disable networkmanager, chmod rc.networkmanager to 644" >> /etc/rc.d/rc.local
	echo "if [ -x /etc/rc.d/rc.networkmanager ]; then" >> /etc/rc.d/rc.local
	echo "Starting NetworkManager" >> /etc/rc.d/rc.local
	echo "	. /etc/rc.d/rc.networkmanager start" >> /etc/rc.d/rc.local
	echo "fi" >> /etc/rc.d/rc.local
fi
