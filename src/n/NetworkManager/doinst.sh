# Preserve new configuration files
install_file() {
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

install_file etc/rc.d/rc.networkmanager.new
install_file etc/NetworkManager/nm-system-settings.conf.new
install_file etc/dbus-1/system.d/nm-avahi-autoipd.conf.new
install_file etc/dbus-1/system.d/NetworkManager.conf.new
#install_file etc/dbus-1/system.d/nm-system-settings.conf.new
install_file etc/dbus-1/system.d/nm-dhcp-client.conf.new
install_file etc/dbus-1/system.d/nm-dispatcher.conf.new

# If rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local
	chmod 755 etc/rc.d/rc.local
fi

# If rc.local_shutdown doesn't exist, create it
if [ ! -e etc/rc.d/rc.local_shutdown ]; then
	echo "#!/bin/sh" > etc/rc.d/rc.local_shutdown
	chmod 755 etc/rc.d/rc.local_shutdown
fi
	
# if rc.networkmanager is executable, run it on startup
run=$(grep ". /etc/rc.d/rc.networkmanager" etc/rc.d/rc.local)
if [[ "${run}" == "" ]]; then
cat << EOF >>etc/rc.d/rc.local

# To disable networkmanager, chmod rc.networkmanager to 644
if [ -x /etc/rc.d/rc.networkmanager ]; then
  . /etc/rc.d/rc.networkmanager start
fi
EOF
fi

# if rc.networkmanager is executable, stop on shutdown
run=$(grep ". /etc/rc.d/rc.networkmanager" etc/rc.d/rc.local_shutdown)
if [[ "${run}" == "" ]]; then
cat << EOF >>etc/rc.d/rc.local_shutdown

# To disable networkmanager shutdown, chmod rc.networkmanager to 644
if [ -x /etc/rc.d/rc.networkmanager ]; then
  . /etc/rc.d/rc.networkmanager stop
fi
EOF
fi

# By default, disable NetworkManager.  Users must enable if they wish.
chmod -x etc/rc.d/rc.networkmanager*;
# Now deprecated.
if [ -f etc/rc.d/rc.networkmanager-dispatcher ]; then
  chmod -x etc/rc.d/rc.networkmanager-dispatcher ;
fi;

cat << EOF

Note for Slackware Users:
-----
To allow users to connect to the NetworkManager daemon, they have to be in the
group "netdev". 

By default, NetworkManager is disabled.  In order to enable it, you will need to 
restart the dbus message system to load the new NetworkManager settings, and make
the /etc/rc.d/rc.networkmanager executable.
EOF
