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

install_file etc/xdg/menus/gnome-screensavers.menu.new

## Update Scrollkeeper
if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper 1> /dev/null 2> /dev/null
fi

## Update .desktop Files
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

##
## Convert xscreensaver configurations to gnome-screensaver.
##
if [ -f /var/log/packages/xscreensaver* ]; then
    (
    cd /usr/share/gnome-screensaver/themes;
    for f in /usr/share/xscreensaver/config/*.xml; do
          /usr/libexec/gnome-screensaver/migrate-xscreensaver-config.sh $f 2>&1 > /dev/null
      done
    )
fi;

echo;
chmod +s /usr/libexec/gnome-screensaver-dialog;

cat << EOF
 *** WARNING ***"

/usr/libexec/gnome-screensaver-dialog has been installed setuid.
This is because Slackware uses shadow passwords. It must be installed
as a setuid root program in order for locking to work with
shadow passwords.

If you have serious concerns over system security, or if this worries
you for other reasons, please make sure to unset the setuid.

        chmod -s /usr/libexec/gnome-screensaver-dialog

EOF
