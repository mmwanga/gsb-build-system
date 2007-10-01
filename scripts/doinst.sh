# Version: 0.1.1
# Example doinst.sh for GSB.
# Remove/edit any parts that are not required for each package.

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

install_file FIXME/FIXME.new

[ -x usr/bin/install-info ] && \
  usr/bin/install-info usr/info/FIXME.info.gz usr/info/dir
