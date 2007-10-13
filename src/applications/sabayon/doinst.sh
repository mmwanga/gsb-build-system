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

install_file etc/gconf/2/local-mandatory.path.new
install_file etc/gconf/2/local-defaults.path.new

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
