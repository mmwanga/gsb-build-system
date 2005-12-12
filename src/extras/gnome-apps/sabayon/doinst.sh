config() {
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

config etc/gconf/2/local-mandatory.path.new
config etc/gconf/2/local-defaults.path.new

# If the sabayon user/group don't exist, add them:
if grep "^sabayon:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon:x:63:63:Sabayon user:/var/sabayon:/bin/false" >> etc/passwd
fi
if grep "^sabayon::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon::63:sabayon" >> etc/group
fi
if grep "^sabayon:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon:*:9797:0:::::" >> etc/shadow
fi

chroot . bin/chown -R sabayon.sabayon var/sabayon

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
config() {
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

config etc/gconf/2/local-mandatory.path.new
config etc/gconf/2/local-defaults.path.new

# If the sabayon user/group don't exist, add them:
if grep "^sabayon:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon:x:63:63:Sabayon user:/var/sabayon:/bin/false" >> etc/passwd
fi
if grep "^sabayon::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon::63:sabayon" >> etc/group
fi
if grep "^sabayon:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon:*:9797:0:::::" >> etc/shadow
fi

chroot . bin/chown -R sabayon.sabayon var/sabayon

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
