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

install_file etc/slapt-get/slapt-update-notifier.conf.new

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

etc/rc.d/rc.slapt-update-notifier

# Add service start to rc.local
if ! grep "/etc/rc.d/rc.slapt-update-notifier" etc/rc.d/rc.local >/dev/null 2>&1; then
  cat <<EOF >>etc/rc.d/rc.local

# To disable slapt-update-notifier, chmod rc.slapt-update-notifier to 644
if [ -x /etc/rc.d/rc.slapt-update-notifier ]; then
  /etc/rc.d/rc.slapt-update-notifier start
fi
EOF
fi

# Add service shutdown to rc.local_shutdown
if ! grep "/etc/rc.d/rc.slapt-update-notifier" etc/rc.d/rc.local_shutdown >/dev/null 2>&1; then
  cat << EOF >>etc/rc.d/rc.local_shutdown


if [ -x /etc/rc.d/rc.slapt-update-notifier ]; then
  /etc/rc.d/rc.slapt-update-notifier stop
fi
EOF
fi

# Update desktop database
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
