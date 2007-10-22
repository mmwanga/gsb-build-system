#!/bin/sh

##
## Configuration Preservation
##

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

install_file etc/pulse/daemon.conf.new
install_file etc/pulse/client.conf.new

cat << EOF

Note:

Pulseaudio is currently installed as a user space daemon.  If you would prefer to install
it as a system-wide daemon, please see http://pulseaudio.org/wiki/SystemWideInstance or
PulseAudio in /usr/doc.

EOF
