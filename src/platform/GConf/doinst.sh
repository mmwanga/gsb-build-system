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

install_file etc/gconf/2/path.new
install_file etc/gconf/2/evoldap.conf.new

# Restart gconfd-2 to reload new settings
killall -HUP gconfd-2 >/dev/null 2>&1
