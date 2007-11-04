if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime 1> /dev/null 2> /dev/null
fi

## 
## Complain if dbus somehow was removed, and disable autostart.
##
if [ ! -f etc/rc.d/rc.messagebus ]; then
    echo "Tracker requires dbus.  You appear to be missing /etc/rc.d/rc.messagebus."
    echo "Perhaps you need to reinstall the dbus package?"
fi;

## 
## Make dbus executable if tracker is installed
## 
if [ ! -x etc/rc.d/rc.messagebus ]; then
    chmod +x etc/rc.d/rc.messagebus;
fi;

##
## Restart dbus (reload tracker info), and start services
## 
if [ -x etc/rc.d/rc.messagebus ]; then
    . etc/rc.d/rc.messagebus restart;
fi;
