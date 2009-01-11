#!/usr/bin/bash
#
# rc.gsb.M      This is the startup/shutdown script for the the Slax GSB 
#               Module. It is designed to be run from runlevel 3 (Multiple 
#               User Mode) in order to setup and finalise all GSB packages 
#               on a persistent file system (only as run once), as well 
#               repeated on non-persistent file systems (like CDs)
#
# Author:       Steve Kennedy, <steve@gnomeslackbuild.org>
# Version:      @(#)/etc/init.d/rc.gsb.M  1.00  Sun Nov 16 12:17:18 GMT 2008
#

# Load Slax functions
. /usr/lib/liblinuxlive

# Grab version
if [ -f /etc/gsb.base-version ] ; then
 VERSION=$(cat /etc/gsb.base-version)
else
 VERSION="GSB"
fi;
   
# Our gsb_start function for SYSV runtime compat
gsb_start() {

# Allow hal to query the PolicyKit database to enforce privileges
if ! /usr/bin/polkit-auth --user haldaemon --explicit | grep -q 'org.freedesktop.policykit.read'; then
   /usr/bin/polkit-auth --user haldaemon --grant 'org.freedesktop.policykit.read'
   echogreen "*" ; echo " GSB: Added haldaemon to policykit."
fi

}

gsb_stop() {
	echogreen "* " ; echo " Stopping services:"
	
	# Shutdown services
	if [ -x /etc/rc.d/rc.networkmanager ]; then
		/etc/rc.d/rc.networkmanager stop ;
	fi ;
	if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
	  /etc/rc.d/rc.avahidaemon stop
	  /etc/rc.d/rc.avahidnsconfd stop
	fi
        # Shutdown all gconfd daemons
        if ps acx | grep -q gconfd-2 ; then
          killall gconfd-2 ;
        fi
}

case "$1" in
'start')
  gsb_start
  ;;
'stop')
  gsb_stop
  ;;
*)
  echo $"Usage: $0 {start|stop}"
    ;;
esac
