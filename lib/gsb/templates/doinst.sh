# Version: 1.0 GSB doinst.sh - Do not remove this line!
# Copyright (c) 2007, 2008:
#   Darren 'Tadgy' Austin <darren (at) gnomeslackbuild.org>, Coventry, UK.
#   Steve Kennedy <steve (at) gnomeslackbuild.org>, Exeter, UK.
# Licenced under the terms of the GNU General Public Licence version 3.
#

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

install_file FIXME/FIXME.new

# If the FIXME user/group don't exist, add them
if ! grep "^FIXME:" etc/group >/dev/null 2>&1; then
  echo "FIXME:x:GID:" >>etc/group
fi
if ! grep "^FIXME:" etc/gshadow >/dev/null 2>&1; then
  echo "FIXME:*::" >>etc/gshadow
fi
if ! grep "^FIXME:" etc/passwd >/dev/null 2>&1; then
  echo "FIXME:x:UID:GID:FIXME user:/FIXME/HOME/DIR:/bin/false" >>etc/passwd
fi
if grep "^FIXME:" etc/shadow >/dev/null 2>&1; then
  echo "FIXME:*:9797:0:::::" >>etc/shadow
fi

# If rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
  echo "#!/bin/sh" >etc/rc.d/rc.local
  chmod 755 etc/rc.d/rc.local
fi

# If rc.local_shutdown doesn't exist, create it
if [ ! -e etc/rc.d/rc.local_shutdown ]; then
  echo "#!/bin/sh" >etc/rc.d/rc.local_shutdown
  chmod 755 etc/rc.d/rc.local_shutdown
fi

# Add service start to rc.local
if ! grep "/etc/rc.d/rc.FIXME" etc/rc.d/rc.local >/dev/null 2>&1; then
  cat <EOF >>etc/rc.d/rc.local

# To disable FIXME, chmod rc.FIXME to 644
if [ -x /etc/rc.d/rc.FIXME ]; then
  /etc/rc.d/rc.FIXME start
fi
EOF
fi

# Add service shutdown to rc.local_shutdown
if ! grep "/etc/rc.d/rc.FIXME" etc/rc.d/rc.local_shutdown >/dev/null 2>&1; then
  cat <EOF >>etc/rc.d/rc.local_shutdown

if [ -x /etc/rc.d/rc.FIXME ]; then
  /etc/rc.d/rc.FIXME stop
fi
EOF
fi

# Install new info files
if [ -x usr/bin/install-info ]; then
  usr/bin/install-info usr/info/FIXME.info.gz usr/info/dir >/dev/null 2>&1
fi

# Update desktop database
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi

# Update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime/ >/dev/null 2>&1
fi

# Restart gconfd-2 to reload new settings
killall -HUP gconfd-2 >/dev/null 2>&1
