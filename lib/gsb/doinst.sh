# Version: 1.0
# Example doinst.sh for GSB.
# Remove/edit any parts that are not required for each package.

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

install_file FIXME/FIXME.new

# If the FIXME user/group don't exist, add them:
if ! grep "^FIXME:" etc/group 1>/dev/null 2>&1; then
  echo "FIXME:x:GID:" >>etc/group
fi
if ! grep "^FIXME:" etc/gshadow 1>/dev/null 2>&1; then
  echo "FIXME:*::" >>etc/gshadow
fi
if ! grep "^FIXME:" etc/passwd 1>/dev/null 2>&1; then
  echo "FIXME:x:UID:GID:FIXME user:/FIXME/HOME/DIR:/bin/false" >>etc/passwd
fi
if grep "^FIXME:" etc/shadow 1>/dev/null 2>&1; then
  echo "FIXME:*:9797:0:::::" >>etc/shadow
fi

# Install new info files
[ -x usr/bin/install-info ] && \
  usr/bin/install-info usr/info/FIXME.info.gz usr/info/dir

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi

# Update mime database
if [ -x usr/bin/update-mime-database ]; then
        usr/bin/update-mime-database usr/share/mime/ &> /dev/null
fi

