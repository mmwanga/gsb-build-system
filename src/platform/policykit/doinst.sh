# Version: 1.0 - Do not remove this line!

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

install_file etc/PolicyKit/PolicyKit.conf.new
install_file /etc/dbus-1/system.d/org.freedesktop.PolicyKit.conf.new

# If the policykit group doesn't exist, add them
if ! grep "^polkituser:" etc/group >/dev/null 2>&1; then
  echo "polkituser:x:60:polkituser" >>etc/group
fi
if ! grep "^polkituser:" etc/gshadow >/dev/null 2>&1; then
  echo "polkituser:*::polkituser" >>etc/gshadow
fi

# If the polkituser user doesn't exist, add it
if ! grep "^polkituser:" etc/passwd >/dev/null 2>&1; then
  echo "polkituser:x:60:60:polkituser:/var/run/PolicyKit-public:/bin/false" >>etc/passwd
fi
if ! grep "^polkituser:" etc/shadow >/dev/null 2>&1; then
  echo "polkituser:*:9797:0:::::" >>etc/shadow
fi

# Allow hal to query the PolicyKit database to enforce privileges
if ! usr/bin/polkit-auth --user haldaemon --explicit | grep -q 'org.freedesktop.policykit.read'; then
   usr/bin/polkit-auth --user haldaemon --grant 'org.freedesktop.policykit.read'
fi
