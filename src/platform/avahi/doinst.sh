# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Preserve new configuration files
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

install_file etc/rc.d/rc.avahidaemon.new
install_file etc/rc.d/rc.avahidnsconfd.new
install_file etc/dbus-1/system.d/avahi-dbus.conf.new

# If the avahi and netdev groups don't exist, add them
if ! grep "^avahi:" etc/group >/dev/null 2>&1; then
  echo "avahi:x:86:" >>etc/group
fi
if ! grep "^avahi:" etc/gshadow >/dev/null 2>&1; then
  echo "avahi:*::" >>etc/gshadow
fi
if ! grep "^netdev:" etc/group >/dev/null 2>&1; then
  echo "netdev:x:87:avahi" >>etc/group
fi
if ! grep "^netdev:" etc/gshadow >/dev/null 2>&1; then
  echo "netdev:*::avahi" >>etc/gshadow
fi

# If the avahi user doesn't exist, add it
if ! grep "^avahi:" etc/passwd >/dev/null 2>&1; then
  echo "avahi:x:86:86:avahi:/etc/avahi:/bin/false" >>etc/passwd
fi
if grep "^avahi:" etc/shadow >/dev/null 2>&1; then
  echo "avahi:*:9797:0:::::" >>etc/shadow
fi

# If rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
  echo "#!/bin/sh" >etc/rc.d/rc.local
  chmod 755 etc/rc.d/rc.local
fi

# If rc.local_shutdown doesn't exist, create it
if [ ! -e etc/rc.d/rc.local_shutdown ]; then
  echo "#!/bin/sh" >etc/rc.d/rc.local_shutdown
  chmod 755 etc/rc.d/rc.local_shutdown
fi

# Add service start to rc.local
if ! grep "/etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local >/dev/null 2>&1; then
  cat <EOF >>etc/rc.d/rc.local

# To disable avahi, chmod rc.avahidaemon and rc.avahidnsconfd to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  /etc/rc.d/rc.avahidaemon start
  /etc/rc.d/rc.avahidnsconfd start
fi
EOF
fi

# Add service shutdown to rc.local_shutdown
if ! grep "/etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local_shutdown >/dev/null 2>&1; then
  cat <EOF >>etc/rc.d/rc.local_shutdown

if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  /etc/rc.d/rc.avahidaemon stop
  /etc/rc.d/rc.avahidnsconfd stop
fi
EOF
fi

# Update desktop database
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi

# Warn is dbus is not installed
if [ ! -e usr/bin/dbus-daemon ]; then
  #     |--------|--------------------------------------------------|
  echo "WARNING: The dbus messaging system is not installed."
  echo "         You MUST have the Slackware dbus package installed"
  echo "         for GSB to work correctly."
  echo
  # Note: Do not disable avahi here (as was here in a previous version) as
  #       the user has been warned on the problems.  We can't be responsible
  #       for users not being able to install Slackware correctly :)
fi

# Warn is dbus is not started at boot
if [ ! -x etc/rc.d/rc.messagebus ]; then
  #     |--------|--------------------------------------------------|
  echo "WARNING: The dbus messaging system is not enabled."
  echo "         You MUST have dbus enabled for GSB to work correctly."
  echo "         To enable dbus, chmod rc.messagebus 755."
  echo
  # Note: Do not adjust permissions here (as was done in a previous version) as
  #       the user has been warned on the problems.  We can't be responsible
  #       for users not being able to install Slackware correctly :)
fi
