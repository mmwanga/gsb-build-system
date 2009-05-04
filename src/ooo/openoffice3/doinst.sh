# Version: 1.0 GSB doinst.sh - Do not remove this line!
# Copyright (c) 2007, 2008:
#   Darren 'Tadgy' Austin <darren (at) gnomeslackbuild.org>, Coventry, UK.
#   Steve Kennedy <steve (at) gnomeslackbuild.org>, Exeter, UK.
# Licenced under the terms of the GNU General Public Licence version 3.
#

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

install_file etc/bash_completion.d/ooffice3.0.sh.new

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database -q usr/share/applications
fi

if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi

if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor
