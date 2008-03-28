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

# Create pulse:user and group if thet don't exist.
group_exists=`grep ^pulse:x: etc/group`
if [[ "${group_exists}" == "" ]]; then
        groupadd -g 94 pulse
fi
user_exists=`grep ^pulse:x: etc/passwd`
if [[ "${user_exists}" == "" ]]; then
        useradd -c "PulseAudio User" -d /var/run/pulse  -u 103 -g pulse -G audio -s /bin/false pulse
fi

# Create realtime group if  don't exist.
group_exists=`grep ^pulse-rt:x: etc/group`
if [[ "${group_exists}" == "" ]]; then
        groupadd -g 104 pulse-rt
fi

# Create pulse-access group if they don't exist.
group_exists=`grep ^pulse-access:x: etc/group`
if [[ "${group_exists}" == "" ]]; then
        groupadd -g 105 pulse-access
fi

# Add root to pulse, pulse-rt, pulse-access groups.
usermod -G pulse,pulse-rt,pulse-access root 

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
