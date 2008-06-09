#!/bin/sh

ldconfig -r .

libtool --finish --silent /usr/lib*/pulse-*/modules/ ;

## Configuration Preservation
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
install_file etc/pulse/default.pa.new

# If the pulse, pulse-rt and pulse-access groups don't exist, add them:
if ! grep "^pulse:" etc/group 1>/dev/null 2>&1; then
  echo "pulse:x:94:" >>etc/group
fi
if ! grep "^pulse:" etc/gshadow 1>/dev/null 2>&1; then
  echo "pulse:*::" >>etc/gshadow
fi
if ! grep "^pulse-rt:" etc/group 1>/dev/null 2>&1; then
  echo "pulse-rt:x:104:" >>etc/group
fi
if ! grep "^pulse-rt:" etc/gshadow 1>/dev/null 2>&1; then
  echo "pulse-rt:*::" >>etc/gshadow
fi
if ! grep "^pulse-access:" etc/group 1>/dev/null 2>&1; then
  echo "pulse-access:x:105:" >>etc/group
fi
if ! grep "^pulse-access:" etc/gshadow 1>/dev/null 2>&1; then
  echo "pulse-access:*::" >>etc/gshadow
fi

# If the pulse user doesn't exist, add it:
if ! grep "^pulse:" etc/passwd 1>/dev/null 2>&1; then
  echo "pulse:x:103:94:PulseAudio user:/var/run/pulse:/bin/false" >>etc/passwd
fi
if grep "^pulse:" etc/shadow 1>/dev/null 2>&1; then
  echo "pulse:*:9797:0:::::" >>etc/shadow
fi

# Add a shm mount in our fstab for shared memory if it doesn't exist
shm_exists=`grep ^shm etc/fstab`
if [[ "${shm_exists}" == "" ]]; then
        echo "shm            /dev/shm     tmpfs  defaults        0     0" >> /etc/fstab
	mount shm ;
fi

cat << EOF

Note:

Pulseaudio is currently installed as a user space daemon.  If you would prefer to install
it as a system-wide daemon, please see http://pulseaudio.org/wiki/SystemWideInstance or
PulseAudio in /usr/doc.

EOF
