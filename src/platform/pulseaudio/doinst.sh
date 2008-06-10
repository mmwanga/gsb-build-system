# Version: 1.0 - Do not remove this line!

# FIXME: Tadgy: Not quite sure why this is in here.
# FIXME: Tadgy: This is completely wrong, it's using a full path and no chroot.
libtool --finish --silent /usr/lib*/pulse-*/modules/

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

install_file etc/pulse/daemon.conf.new
install_file etc/pulse/client.conf.new
install_file etc/pulse/default.pa.new

# If the pulse, pulse-rt and pulse-access groups don't exist, add them
if ! grep "^pulse:" etc/group >/dev/null 2>&1; then
  echo "pulse:x:94:" >>etc/group
fi
if ! grep "^pulse:" etc/gshadow >/dev/null 2>&1; then
  echo "pulse:*::" >>etc/gshadow
fi
if ! grep "^pulse-rt:" etc/group >/dev/null 2>&1; then
  echo "pulse-rt:x:104:" >>etc/group
fi
if ! grep "^pulse-rt:" etc/gshadow >/dev/null 2>&1; then
  echo "pulse-rt:*::" >>etc/gshadow
fi
if ! grep "^pulse-access:" etc/group >/dev/null 2>&1; then
  echo "pulse-access:x:105:" >>etc/group
fi
if ! grep "^pulse-access:" etc/gshadow >/dev/null 2>&1; then
  echo "pulse-access:*::" >>etc/gshadow
fi

# If the pulse user doesn't exist, add it
if ! grep "^pulse:" etc/passwd >/dev/null 2>&1; then
  echo "pulse:x:103:94:PulseAudio user:/var/run/pulse:/bin/false" >>etc/passwd
fi
if grep "^pulse:" etc/shadow >/dev/null 2>&1; then
  echo "pulse:*:9797:0:::::" >>etc/shadow
fi

# Add a shm mount in fstab if it doesn't exist
if ! grep "^shm" etc/fstab >/dev/null 2>&1; then
  echo "shm            /dev/shm     tmpfs  defaults        0     0" >>/etc/fstab
  chroot . sbin/mount shm >/dev/null 2>&1
fi
