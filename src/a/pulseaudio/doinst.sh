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

install_file etc/pulse/daemon.conf.new
install_file etc/pulse/client.conf.new

# pulse group is required for user level 
if ! grep "^pulse:" etc/group >/dev/null 2>&1; then
  groupadd -g 53 pulse >/dev/null 2>&1
fi
if ! grep "^pulse:" etc/passwd >/dev/null 2>&1; then
  useradd -u 53 -g pulse -d /dev/null -s /bin/false pulse >/dev/null 2>&1
fi

# reload udev rules
chroot . /etc/rc.d/rc.udev reload
