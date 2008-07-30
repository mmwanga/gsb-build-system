# Version: 1.0 - Do not remove this line!

# run libtool to finish off installation
chroot . libtool --finish --silent usr/lib*/pulse-*/modules/

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

# Add a shm mount in fstab if it doesn't exist
if ! grep "^shm" etc/fstab >/dev/null 2>&1; then
  echo "shm            /dev/shm     tmpfs  defaults        0     0" >>etc/fstab
  chroot . sbin/mount shm >/dev/null 2>&1
fi

###############################################################################
# Remove previous pulse, pulse-access and pulse-rt users/groups.
# This is needed because the previous ones were created with IDs >100.
# System level users/groups should have IDs <100.
if grep "^pulse:[^:]*:103:" etc/passwd >/dev/null 2>&1; then
  cat etc/passwd >etc/passwd.gsb
  cat etc/passwd.gsb | grep -v "^pulse:[^:]*:103:" >etc/passwd
  if [ $? -ne 0 ]; then
    # Don't leave etc/password in an unknown state.
    cat etc/passwd.gsb >etc/passwd
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old pulse user."
  fi
  rm -f etc/passwd.gsb
fi
if grep "^pulse:[^:]*:94:" etc/group >/dev/null 2>&1; then
  cat etc/group >etc/group.gsb
  cat etc/group.gsb | grep -v "^pulse:[^:]*:94:" >etc/group
  if [ $? -ne 0 ]; then
    # Don't leave etc/group in an unknown state.
    cat etc/group.gsb >etc/group
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old pulse group."
  fi
  rm -f etc/group.gsb
fi
if grep "^pulse-rt:[^:]*:104:" etc/group >/dev/null 2>&1; then
  cat etc/group >etc/group.gsb
  cat etc/group.gsb | grep -v "^pulse-rt:[^:]*:104:" >etc/group
  if [ $? -ne 0 ]; then
    # Don't leave etc/group in an unknown state.
    cat etc/group.gsb >etc/group
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old pulse-rt group."
  fi
  rm -f etc/group.gsb
fi
if grep "^pulse-access:[^:]*:105:" etc/group >/dev/null 2>&1; then
  cat etc/group >etc/group.gsb
  cat etc/group.gsb | grep -v "^pulse-access:[^:]*:105:" >etc/group
  if [ $? -ne 0 ]; then
    # Don't leave etc/group in an unknown state.
    cat etc/group.gsb >etc/group
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old pulse-access group."
  fi
  rm -f etc/group.gsb
fi

# If the pulse group doesn't exist, add it
# pulse is required for user level 
if ! grep "^pulse:" etc/group >/dev/null 2>&1; then
  echo "pulse:x:53:" >>etc/group
fi
if ! grep "^pulse:" etc/passwd >/dev/null 2>&1; then
  echo "pulse:x:53:53:pulse:/var/run/pulse:/bin/false" >>etc/passwd
fi
if ! grep "^pulse:" etc/gshadow >/dev/null 2>&1; then
  echo "pulse:*::" >>etc/gshadow
fi
if ! grep "^pulse:" etc/shadow >/dev/null 2>&1; then
  echo "pulse:*:9797:0:::::" >>etc/shadow 
fi

# If the pulse, pulse-access and pulse-rt groups don't exist, add them
# pulse-rt and pulse-access required for system-wide daemon
# disabled per default
#if ! grep "^pulse-access:" etc/group >/dev/null 2>&1; then
  #echo "pulse-access:x:54:" >>etc/group
#fi
#if ! grep "^pulse-access:" etc/gshadow >/dev/null 2>&1; then
  #echo "pulse-access:*::" >>etc/gshadow
#fi
#if ! grep "^pulse-rt:" etc/group >/dev/null 2>&1; then
  #echo "pulse-rt:x:55:" >>etc/group
#fi
#if ! grep "^pulse-rt:" etc/gshadow >/dev/null 2>&1; then
  #echo "pulse-rt:*::" >>etc/gshadow
#fi

## If pulseaudio installed, prefer is to esd
if [ -f usr/bin/esdcompat ]; then
  # Move old esd out of the way
  if [ -f usr/bin/esd -a ! -f usr/bin/esound.pulsified ]; then
    chroot . mv -f usr/bin/esd usr/bin/esound.pulsified ;
  fi;
  # Make sure pulseaudio is default instead of esd
  chroot . ln -sf /usr/bin/esdcompat usr/bin/esd ;
fi; 

## If pulseaudio installed, prefer is to paplay
if [ -f usr/bin/paplay ]; then
  # Move old esdplay out of the way
  if [ -f usr/bin/esdplay -a ! -f usr/bin/esdplay.pulsified ]; then
    chroot . mv -f usr/bin/esdplay usr/bin/esdplay.pulsified ;
  fi ;
  # Make sure paplay is default instead of esdplay
  chroot . ln -sf /usr/bin/paplay usr/bin/esdplay ;
fi;
