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

if [ -f etc/gnome/xdg/menus/applications.menu.orig ]; then
  echo "Warning: GNOME menus have already been modified."
  echo "Leaving new menu as etc/gnome/xdg/menus/applications.menu.new"
else
  mv -f etc/gnome/xdg/menus/applications.menu etc/gnome/xdg/menus/applications.menu.orig ;
  install_file etc/gnome/xdg/menus/applications.menu.new ;
fi;

# Icon cache refresh
for i in gnome hicolor
do
        if [ -e usr/share/icons/$i/icon-theme.cache ]; then
                rm -f usr/share/icons/$i/icon-theme.cache
        fi
        usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i
done
