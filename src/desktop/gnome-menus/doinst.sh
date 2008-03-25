ldconfig -r .

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
    if [ -f $(basename "$1" .new) ];
    then
            mv $(basename "$1" .new) $(basename "$1" .new).$(date +%m%d%y);
    fi;
    # Install our new file.
    mv $1 $(basename "$1" .new)

  else
    rm -f "$FILE.new"
  fi
}


for i in applications preferences settings
do
    install_file etc/gnome/xdg/menus/$i.menu.new
done

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
