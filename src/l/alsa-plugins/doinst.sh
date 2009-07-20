# Preserve new configuration files
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

install_file etc/asound.conf.new
