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

## Prefer pulseaudio to esd (esd will eventually be deprecated in GNOME)
if [ -f usr/bin/esd -a ! -f usr/bin/esound.pulsified ]; then
  mv usr/bin/esd usr/bin/esound.pulsified ;
  ln -s usr/bin/esdcompat usr/bin/esd ;
fi ;

##
## Modify passwd and group to add pulse and pulse-access
##

## If the pulse user doesn't exist, add them:
if grep "^pulse:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "pulse:x:92:92:pulse:/etc/pulse:" >> etc/passwd
fi
if grep "^pulse:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "pulse:*:92:0:::::" >> etc/shadow
fi

## If the pulse group (for system-wide daemon) doesn't exist, add them:
if grep "^pulse::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "pulse::92:pulse" >> etc/group
fi

## If the pulse-access group (for system-wide users) doesn't exist, add them:
if grep "^pulse-access::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "pulse-access::94:" >> etc/group
fi

cat << EOF

Note:

Pulseaudio is currently installed as a user space daemon.  If you would prefer to install
it as a system-wide daemon, please see http://pulseaudio.org/wiki/SystemWideInstance or
PulseAudio in /usr/doc.

EOF
