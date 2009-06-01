# run libtool to finish off installation
chroot . libtool --finish --silent usr/lib*/pulse-*/modules/
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
    # We need to make sure to install our version of the file;
    # Move the old versions out of the way.
    if [ -f "$FILE" ];
    then
            mv "$FILE" "$FILE".old.$(date +%m%d%y);
    fi;
    # Install our new file.
    mv "$FILE.new" "$FILE"
  else
    rm -f "$FILE.new"
  fi
}

install_file etc/pulse/daemon.conf.new
install_file etc/pulse/client.conf.new
install_file etc/pulse/default.pa.new
install_file etc/pulse/system.pa.new
install_file etc/asound.conf.new

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

# If pulseaudio installed, prefer is to esd
if [ -f usr/bin/esdcompat ]; then
  # Move old esd out of the way
  if [ -f usr/bin/esd -a ! -f usr/bin/esound.pulsified ]; then
    chroot . mv -f usr/bin/esd usr/bin/esound.pulsified ;
  fi;
  # Make sure pulseaudio is default instead of esd
  chroot . ln -sf /usr/bin/esdcompat usr/bin/esd ;
fi; 

# If pulseaudio installed, prefer is to paplay
if [ -f usr/bin/paplay ]; then
  # Move old esdplay out of the way
  if [ -f usr/bin/esdplay -a ! -f usr/bin/esdplay.pulsified ]; then
    chroot . mv -f usr/bin/esdplay usr/bin/esdplay.pulsified ;
  fi ;
  # Make sure paplay is default instead of esdplay
  chroot . ln -sf /usr/bin/paplay usr/bin/esdplay ;
fi;
