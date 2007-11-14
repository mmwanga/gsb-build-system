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

install_file etc/rc.d/rc.networkmanager.new
install_file etc/rc.d/rc.networkmanager-dispatcher.new
install_file etc/dbus-1/system.d/NetworkManager.conf.new

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
    echo "#!/bin/sh" > etc/rc.d/rc.local
    chmod 755 etc/rc.d/rc.local
fi

##
## If the netdev group don't exist, add them:
## 
if grep "^netdev::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "netdev::87:avahi" >> etc/group
fi

# if rc.networkmanager is executable, run it on startup
run=`grep ". /etc/rc.d/rc.networkmanager" etc/rc.d/rc.local`
if [[ "${run}" == "" ]]; then
cat << EOF >>etc/rc.d/rc.local

# To disable networkmanager, chmod rc.networkmanager to 644
if [ -x /etc/rc.d/rc.networkmanager ]; then
  . /etc/rc.d/rc.networkmanager start
fi
EOF
fi

## 
## Make dbus executable if NetworkManager is installed
##
if [ ! -x etc/rc.d/rc.messagebus ]; then
    chmod +x etc/rc.d/rc.messagebus;
fi;
  
##
## Restart dbus (reload NetworkManager info), and start services
##
#if [ -x etc/rc.d/rc.messagebus ]; then
    #chmod +x etc/rc.d/rc.networkmanager*;
    #. etc/rc.d/rc.messagebus restart;
    #. etc/rc.d/rc.networkmanager restart;
#fi;

# By default, disable NetworkManager.  Users must enable if they wish.
chmod -x etc/rc.d/rc.networkmanager*;

cat << EOF

Note:
-----
To allow users to connect to the NetworkManager daemon, they have to be in the
group "netdev". 

EOF
