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

install_file etc/rc.d/rc.avahidaemon.new
install_file etc/rc.d/rc.avahidnsconfd.new
install_file etc/dbus-1/system.d/avahi-dbus.conf.new
#install_file etc/dbus-1/system-local.conf.new

# If the netdev and avahi groups don't exist, add them
if ! grep "^avahi:" etc/group >/dev/null 2>&1; then
  echo "avahi:x:85:" >>etc/group
fi
if ! grep "^avahi:" etc/gshadow >/dev/null 2>&1; then
  echo "avahi:*::" >>etc/gshadow
fi
if ! grep "^avahi-autoipd:" etc/group >/dev/null 2>&1; then
  echo "avahi-autoipd:x:88:" >>etc/group
fi
if ! grep "^avahi-autoipd:" etc/gshadow >/dev/null 2>&1; then
  echo "avahi-autoipd:*::" >>etc/gshadow
fi

# If the avahi-autoipd user doesn't exist, add it
if ! grep "^avahi-autoipd:" etc/passwd >/dev/null 2>&1; then
  echo "avahi-autoipd:x:88:88:avahi-autoipd:/etc/avahi:/bin/false" >>etc/passwd
fi
if ! grep "^avahi-autoipd:" etc/shadow >/dev/null 2>&1; then
  echo "avahi-autoipd:*:9797:0:::::" >>etc/shadow
fi

# If the avahi user doesn't exist, add it
if ! grep "^avahi:" etc/passwd >/dev/null 2>&1; then
  echo "avahi:x:85:85:avahi:/etc/avahi:/bin/false" >>etc/passwd
fi
if ! grep "^avahi:" etc/shadow >/dev/null 2>&1; then
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
  cat <<EOF >>etc/rc.d/rc.local

# To disable avahi, chmod rc.avahidaemon and rc.avahidnsconfd to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  /etc/rc.d/rc.avahidaemon start
  /etc/rc.d/rc.avahidnsconfd start
fi
EOF
fi

# Add service shutdown to rc.local_shutdown
if ! grep "/etc/rc.d/rc.avahidaemon" etc/rc.d/rc.local_shutdown >/dev/null 2>&1; then
  cat << EOF >>etc/rc.d/rc.local_shutdown

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
