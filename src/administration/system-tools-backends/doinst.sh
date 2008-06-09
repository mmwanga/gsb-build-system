# If the stb-admin group doesn't exist, add it:
if ! grep "^stb-admin:" etc/group 1>/dev/null 2>&1; then
  echo "stb-admin:x:87:" >>etc/group
fi
if ! grep "^stb-admin:" etc/gshadow 1>/dev/null 2>&1; then
  echo "stb-admin:*::" >>etc/gshadow
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
#chmod -x etc/rc.d/rc.stb
