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

