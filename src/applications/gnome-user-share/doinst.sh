function install_file() {
  # $1 = File to process

  FILE="$(dirname "$1")/$(basename "$1" .new)"
  if [ ! -e "$FILE" ]
  then
    mv "$FILE.new" "$FILE"
  elif [ "$(cat "$FILE" | md5sum)" != "$(cat "$FILE.new" | md5sum)" ]
  then
    # We need to make sure to install our version of the file;
    # Move the old versions out of the way.
    if [ -f "$FILE" ];
    then
            mv "$FILE" "$FILE".old.$(date +%m%d%y);
    fi;
    # Install our new file.
    mv "$FILE.new" "$FILE"
  else
    rm -f "$FILE.new"
  fi
}

install_file usr/share/gnome-user-share/dav_user_2.0.conf.new
install_file usr/share/gnome-user-share/dav_user_2.2.conf.new

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
