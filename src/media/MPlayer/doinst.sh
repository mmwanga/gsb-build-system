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

install_file etc/mplayer/mplayer.conf.new
install_file etc/mplayer/input.conf.new
install_file etc/mplayer/mencoder.conf.new
#install_file usr/share/mplayer/subfont.ttf.new

#if [ -x usr/bin/update-desktop-database ]; then
  #usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
#fi
