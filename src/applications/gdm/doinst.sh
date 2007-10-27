if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

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

## Preserve any previous customizations
install_file etc/X11/xdm/Xsession.new
install_file etc/X11/gdm/custom.conf.new
install_file etc/X11/gdm/PreSession/Default.new
install_file etc/X11/gdm/PostLogin/Default.new

##
## If the gdm user don't exist, add them:
##
if grep "^gdm:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "gdm:x:95:95:gdm:/etc/X11/gdm:" >> etc/passwd
fi
if grep "^gdm:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "gdm:*:95:0:::::" >> etc/shadow
fi

##
## If the gdm group don't exist, add them:
##
if grep "^gdm::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "gdm::95:gdm" >> etc/group
fi

cat << EOF

Note: GDM will start at runlevel 4.  If you would like to have GDM run
when the computer boots, please change your /etc/inittab to default to 
runlevel 4 at boot time. For example, 

# Default runlevel. 
id:4:initdefault:

EOF
