# Version: 0.1.1

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

install_file etc/dbus-1/system.d/dhcdbd.conf.new
install_file etc/dhclient-enter-hooks.new
install_file etc/dhclient-exit-hooks.new
install_file etc/rc.d/rc.dhcdbd.new
install_file etc/dhclient-enter-hooks.d/00dbus_hooks.sh.new

#chmod +x etc/rc.d/rc.dhcdbd;

##  
## Make dbus executable if dhcdbd is installed
##
if [ ! -x etc/rc.d/rc.messagebus ]; then
    chmod +x etc/rc.d/rc.messagebus;
fi;


##
## Restart dbus (reload dhcdbd info), and start services
##
#if [ -x etc/rc.d/rc.messagebus ]; then
    #. etc/rc.d/rc.messagebus restart;
    #. etc/rc.d/rc.dhcdbd start;
#fi;
