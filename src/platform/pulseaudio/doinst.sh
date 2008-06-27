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

# Add a shm mount in fstab if it doesn't exist
if ! grep "^shm" etc/fstab >/dev/null 2>&1; then
  echo "shm            /dev/shm     tmpfs  defaults        0     0" >>etc/fstab
  chroot . sbin/mount shm >/dev/null 2>&1
fi

###############################################################################
# Note:
#  All of the below is commented out as we no longer create the pulse et al
#  users and groups, which are only used for the (not recommended) system
#  wide daemon setup.
#  The code below can be used to create the users/groups if you need/want them.
#
# Remove previous pulse, pulse-access and pulse-rt users/groups.
# This is needed because the previous ones were created with IDs >100.
# System level users/groups should have IDs <100.
#if grep "^pulse:[^:]*:103:" etc/passwd >/dev/null 2>&1; then
#  cat etc/passwd >etc/passwd.gsb
#  cat etc/passwd.gsb | grep -v "^pulse:[^:]*:103:" >etc/passwd
#  if [ $? -ne 0 ]; then
#    # Don't leave etc/password in an unknown state.
#    cat etc/passwd.gsb >etc/passwd
#    #     |--------|--------------------------------------------------|
#    echo "WARNING: Failed to remove old pulse user."
#  fi
#  rm etc/passwd.old
#fi
#if grep "^pulse:[^:]*:94:" etc/group >/dev/null 2>&1; then
#  cat etc/group >etc/group.gsb
#  cat etc/group.gsb | grep -v "^pulse:[^:]*:94:" >etc/group
#  if [ $? -ne 0 ]; then
#    # Don't leave etc/group in an unknown state.
#    cat etc/group.gsb >etc/group
#    #     |--------|--------------------------------------------------|
#    echo "WARNING: Failed to remove old pulse group."
#  fi
#  rm etc/group.old
#fi
#if grep "^pulse-rt:[^:]*:104:" etc/group >/dev/null 2>&1; then
#  cat etc/group >etc/group.gsb
#  cat etc/group.gsb | grep -v "^pulse-rt:[^:]*:104:" >etc/group
#  if [ $? -ne 0 ]; then
#    # Don't leave etc/group in an unknown state.
#    cat etc/group.gsb >etc/group
#    #     |--------|--------------------------------------------------|
#    echo "WARNING: Failed to remove old pulse-rt group."
#  fi
#  rm etc/group.old
#fi
#if grep "^pulse-access:[^:]*:105:" etc/group >/dev/null 2>&1; then
#  cat etc/group >etc/group.gsb
#  cat etc/group.gsb | grep -v "^pulse-access:[^:]*:105:" >etc/group
#  if [ $? -ne 0 ]; then
#    # Don't leave etc/group in an unknown state.
#    cat etc/group.gsb >etc/group
#    #     |--------|--------------------------------------------------|
#    echo "WARNING: Failed to remove old pulse-access group."
#  fi
#  rm etc/group.old
#fi
#
# If the pulse, pulse-access and pulse-rt groups don't exist, add them
#if ! grep "^pulse:" etc/group >/dev/null 2>&1; then
#  echo "pulse:x:43:" >>etc/group
#fi
#if ! grep "^pulse:" etc/gshadow >/dev/null 2>&1; then
#  echo "pulse:*::" >>etc/gshadow
#fi
#if ! grep "^pulse-access:" etc/group >/dev/null 2>&1; then
#  echo "pulse-access:x:44:" >>etc/group
#fi
#if ! grep "^pulse-access:" etc/gshadow >/dev/null 2>&1; then
#  echo "pulse-access:*::" >>etc/gshadow
#fi
#if ! grep "^pulse-rt:" etc/group >/dev/null 2>&1; then
#  echo "pulse-rt:x:45:" >>etc/group
#fi
#if ! grep "^pulse-rt:" etc/gshadow >/dev/null 2>&1; then
#  echo "pulse-rt:*::" >>etc/gshadow
#fi
#
# If the pulse user doesn't exist, add it
#if ! grep "^pulse:" etc/passwd >/dev/null 2>&1; then
#  echo "pulse:x:43:43:pulse:/var/run/pulse:/bin/false" >>etc/passwd
#fi
#if grep "^pulse:" etc/shadow >/dev/null 2>&1; then
#  echo "pulse:*:9797:0:::::" >>etc/shadow
#fi
