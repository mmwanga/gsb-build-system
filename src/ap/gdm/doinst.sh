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

install_file etc/X11/gdm/Xsession.new
install_file etc/X11/gdm/custom.conf.new
install_file etc/X11/gdm/PreSession/Default.new
install_file etc/X11/gdm/PostSession/Default.new
install_file etc/X11/gdm/PostLogin/Default.new

# If the gdm user/group don't exist, add them:
if ! grep "^gdm:" etc/group >/dev/null 2>&1; then
  echo "gdm:x:42:" >>etc/group
fi
if ! grep "^gdm:" etc/gshadow >/dev/null 2>&1; then
  echo "gdm:*::" >>etc/gshadow
fi
if ! grep "^gdm:" etc/passwd >/dev/null 2>&1; then
  echo "gdm:x:42:42:gdm:/etc/X11/gdm:/bin/bash" >>etc/passwd
fi
if grep "^gdm:" etc/shadow >/dev/null 2>&1; then
  echo "gdm:*:9797:0:::::" >>etc/shadow
fi

# update rarian database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# These GTK+ files need to be kept up to date for
# proper input method with additional gdm modules
if [ -x /usr/bin/update-gtk-immodules ]; then
  /usr/bin/update-gtk-immodules 1>/dev/null 2>/dev/null
fi

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor 1>/dev/null 2>/dev/null

# notice for users
cat << EOF
Note: GDM will start at runlevel 4.  If you would like to have GDM run
when the computer boots, please change your /etc/inittab to default to 
runlevel 4 at boot time. For example, 

# Default runlevel. 
id:4:initdefault:
EOF
