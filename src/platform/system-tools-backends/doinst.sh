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

install_file etc/dbus-1/system.d/system-tools-backends.conf.new
install_file etc/rc.d/rc.stb.new

##
## If the stb-admin group don't exist, add them:
## 
if grep "^stb-admin::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "stb-admin::87:" >> etc/group
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
	
# if rc.stb is executable, run it on startup
run=`grep ". /etc/rc.d/rc.stb" etc/rc.d/rc.local`
if [[ "${run}" == "" ]]; then
cat << EOF >>etc/rc.d/rc.local

# To disable system-tools-backends, chmod rc.stb to 644
if [ -x /etc/rc.d/rc.stb ]; then
  . /etc/rc.d/rc.stb start
fi
EOF
fi

# if rc.stb is executable, shutdown on reboot
run=`grep ". /etc/rc.d/rc.stb" etc/rc.d/rc.local_shutdown`
if [[ "${run}" == "" ]]; then
cat << EOF >>etc/rc.d/rc.local_shutdown

# To disable system-tools-backends shutdown, chmod rc.stb to 644
if [ -x /etc/rc.d/rc.stb ]; then
  . /etc/rc.d/rc.stb stop
fi
EOF
fi

## 
## Complain if dbus somehow was removed, and disable autostart.
##
if [ ! -f etc/rc.d/rc.messagebus ]; then
	echo "System-tools-backends requires dbus.  You appear to be missing /etc/rc.d/rc.messagebus."
	echo "Perhaps you need to reinstall the dbus package?"
fi;

## 
## Make dbus executable if system-tools-backends is installed
##
if [ ! -x etc/rc.d/rc.messagebus ]; then
	chmod +x etc/rc.d/rc.messagebus;
fi;

##
## Restart dbus (reload system-tools-backends info), and start services
##
#if [ -x etc/rc.d/rc.messagebus ]; then
	#. etc/rc.d/rc.messagebus restart;
    #. etc/rc.d/rc.stb start;
#fi; 

# By default, disable s-t-b.  Users must enable if they wish.
chmod -x etc/rc.d/rc.stb
