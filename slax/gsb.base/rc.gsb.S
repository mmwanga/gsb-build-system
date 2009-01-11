#!/usr/bin/bash
#
# rc.gsb.S      This is the startup/shutdown script for the the Slax GSB 
#               Module. It is designed to be run from runlevel 1 (Single 
#               User Mode) in order to setup and finalise all GSB packages 
#               on a persistent file system (only as run once), as well 
#               repeated on non-persistent file systems (like CDs)
#
# Author:       Steve Kennedy, <steve@gnomeslackbuild.org>
# Version:      @(#)/etc/init.d/rc.gsb.S  1.00  Sun Nov 16 12:17:18 GMT 2008
#

# Load Slax functions
. /usr/lib/liblinuxlive

# Grab version
if [ -f /etc/gsb.base-version ] ; then
 VERSION=$(cat /etc/gsb.base-version)
else
 VERSION="GSB"
fi;
   
# Our gsb_start function for SYSV runtime compat
gsb_start() {

# Let the user know what's happening
echo
header "Starting $VERSION."
echo 

# If rc.local doesn't exist, create it
if [ ! -e /etc/rc.d/rc.local ]; then
  echo "#!/bin/sh" > /etc/rc.d/rc.local
  chmod 755 /etc/rc.d/rc.local
fi

# If rc.local_shutdown doesn't exist, create it
if [ ! -e /etc/rc.d/rc.local_shutdown ]; then
  echo "#!/bin/sh" > /etc/rc.d/rc.local_shutdown
  chmod 755 /etc/rc.d/rc.local_shutdown
fi

# If the policykit group doesn't exist, add them
if ! grep "^polkituser:" /etc/group >/dev/null 2>&1; then
  echo "polkituser:x:60:polkituser" >> /etc/group
fi
if ! grep "^polkituser:" /etc/gshadow >/dev/null 2>&1; then
  echo "polkituser:*::polkituser" >> /etc/gshadow
fi
  
# If the polkituser user doesn't exist, add it
if ! grep "^polkituser:" /etc/passwd >/dev/null 2>&1; then
  echo "polkituser:x:60:60:polkituser:/var/run/PolicyKit-public:/bin/false" >>/etc/passwd
fi
if ! grep "^polkituser:" /etc/shadow >/dev/null 2>&1; then
  echo "polkituser:*:9797:0:::::" >>/etc/shadow
fi
  
# If the netdev and avahi groups don't exist, add them
if ! grep "^netdev:" /etc/group >/dev/null 2>&1; then
  echo "netdev:x:85:avahi" >> /etc/group
fi
if ! grep "^netdev:" /etc/gshadow >/dev/null 2>&1; then
  echo "netdev:*::avahi" >> /etc/gshadow
fi
if ! grep "^avahi:" /etc/group >/dev/null 2>&1; then
  echo "avahi:x:86:" >> /etc/group
fi
if ! grep "^avahi:" /etc/gshadow >/dev/null 2>&1; then
  echo "avahi:*::" >> /etc/gshadow
fi
# If the avahi user doesn't exist, add it
if ! grep "^avahi:" /etc/passwd >/dev/null 2>&1; then
  echo "avahi:x:86:86:avahi:/etc/avahi:/bin/false" >> /etc/passwd
fi
if ! grep "^avahi:" /etc/shadow >/dev/null 2>&1; then
  echo "avahi:*:9797:0:::::" >> /etc/shadow
fi
# Add service start to rc.local
if ! grep "/etc/rc.d/rc.avahidaemon" /etc/rc.d/rc.local >/dev/null 2>&1; then
  cat <<EOF >> /etc/rc.d/rc.local

# To disable avahi, chmod rc.avahidaemon and rc.avahidnsconfd to 644
if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  /etc/rc.d/rc.avahidaemon start
  /etc/rc.d/rc.avahidnsconfd start
fi
EOF
fi
  
# Add service shutdown to rc.local_shutdown
if ! grep "/etc/rc.d/rc.avahidaemon" /etc/rc.d/rc.local_shutdown >/dev/null 2>&1; then
  cat << EOF >> /etc/rc.d/rc.local_shutdown

if [ -x /etc/rc.d/rc.avahidaemon -a -x /etc/rc.d/rc.avahidnsconfd ]; then
  /etc/rc.d/rc.avahidaemon stop
  /etc/rc.d/rc.avahidnsconfd stop
fi
EOF
fi

# Add networkmanager service to rc.local if rc.networkmanager is executable, run it on startup
run=`grep ". /etc/rc.d/rc.networkmanager" /etc/rc.d/rc.local`
if [[ "${run}" == "" ]]; then
cat << EOF >> /etc/rc.d/rc.local

# To disable networkmanager, chmod rc.networkmanager to 644
if [ -x /etc/rc.d/rc.networkmanager ]; then
  . /etc/rc.d/rc.networkmanager start
fi
EOF
fi

# if rc.networkmanager is executable, stop on shutdown
run=`grep ". /etc/rc.d/rc.networkmanager" /etc/rc.d/rc.local_shutdown`
if [[ "${run}" == "" ]]; then
cat << EOF >> /etc/rc.d/rc.local_shutdown

# To disable networkmanager shutdown, chmod rc.networkmanager to 644
if [ -x /etc/rc.d/rc.networkmanager ]; then
  . /etc/rc.d/rc.networkmanager stop
fi
EOF
fi

# Add a shm mount in fstab if it doesn't exist for pulseaudio
if ! grep "^shm" /etc/fstab >/dev/null 2>&1; then
  echo "shm            /dev/shm     tmpfs  defaults        0     0" >> /etc/fstab
  /sbin/mount shm >/dev/null 2>&1
fi
# If the pulse group doesn't exist, add it;  pulse is required for user level 
if ! grep "^pulse:" /etc/group >/dev/null 2>&1; then
  echo "pulse:x:53:" >> /etc/group
fi
if ! grep "^pulse:" /etc/passwd >/dev/null 2>&1; then
  echo "pulse:x:53:53:pulse:/var/run/pulse:/bin/false" >> /etc/passwd
fi
if ! grep "^pulse:" /etc/gshadow >/dev/null 2>&1; then
  echo "pulse:*::" >>/etc/gshadow
fi
if ! grep "^pulse:" /etc/shadow >/dev/null 2>&1; then
  echo "pulse:*:9797:0:::::" >>/etc/shadow
fi
## If pulseaudio installed, prefer is to esd
if [ -f /usr/bin/esdcompat ]; then
  # Move old esd out of the way
  if [ -f /usr/bin/esd -a ! -f /usr/bin/esound.pulsified ]; then
    mv -f /usr/bin/esd /usr/bin/esound.pulsified ;
  fi;
  # Make sure pulseaudio is default instead of esd
  ln -sf /usr/bin/esdcompat /usr/bin/esd ;
fi;

## If pulseaudio installed, prefer is to paplay
if [ -f /usr/bin/paplay ]; then
  # Move old esdplay out of the way
  if [ -f /usr/bin/esdplay -a ! -f /usr/bin/esdplay.pulsified ]; then
    mv -f /usr/bin/esdplay /usr/bin/esdplay.pulsified ;
  fi ;
  # Make sure paplay is default instead of esdplay
  ln -sf /usr/bin/paplay /usr/bin/esdplay ;
fi;

# If the gdm user/group don't exist, add them:
if ! grep "^gdm:" /etc/group >/dev/null 2>&1; then
  echo "gdm:x:42:" >> /etc/group
fi
if ! grep "^gdm:" /etc/gshadow >/dev/null 2>&1; then
  echo "gdm:*::" >> /etc/gshadow
fi
if ! grep "^gdm:" /etc/passwd >/dev/null 2>&1; then
  echo "gdm:x:42:42:gdm:/etc/X11/gdm:/bin/bash" >> /etc/passwd
fi
if grep "^gdm:" /etc/shadow >/dev/null 2>&1; then
  echo "gdm:*:9797:0:::::" >> /etc/shadow
fi

# Setup proper mailcap entries for xdg-utils
if ! grep -q '# Sample xdg-open entries:' /etc/mailcap 1> /dev/null 2> /dev/null ; then
  echo "# Sample xdg-open entries:" >> /etc/mailcap
  echo >> /etc/mailcap
fi
if ! grep -q 'audio/' /etc/mailcap ; then
  echo 'audio/*; /usr/bin/xdg-open %s' >> /etc/mailcap
  echo >> /etc/mailcap
fi
if ! grep -q 'image/' /etc/mailcap ; then
  echo 'image/*; /usr/bin/xdg-open %s' >> /etc/mailcap
  echo >> /etc/mailcap
fi
if ! grep -q 'application/msword' /etc/mailcap ; then
  echo 'application/msword; /usr/bin/xdg-open %s' >> /etc/mailcap
  echo >> /etc/mailcap
fi
if ! grep -q 'application/pdf' /etc/mailcap ; then
  echo 'application/pdf; /usr/bin/xdg-open %s' >> /etc/mailcap
  echo >> /etc/mailcap
fi
if ! grep -q 'application/postscript' /etc/mailcap ; then
  echo 'application/postscript ; /usr/bin/xdg-open %s' >> /etc/mailcap
  echo >> /etc/mailcap
fi
if ! grep -q '#text/html' /etc/mailcap ; then
  echo '#text/html; /usr/bin/xdg-open %s ; copiousoutput' >> /etc/mailcap
  echo >> /etc/mailcap
fi  

# Add xulrunner to ld.so.conf
if ! grep "xulrunner" /etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  echo "/usr/lib/xulrunner" >> etc/ld.so.conf
fi

# Set up java plugins for xulrunner if java installed
if [ ! -h /usr/lib/mozilla/plugins/libjavaplugin_oji.so ]; then 
  if [ -e /usr/lib/java/plugin/i386/ns7/libjavaplugin_oji.so ]; then 
    mkdir -p usr/lib/mozilla/plugins ;
    ( cd /usr/lib/mozilla/plugins ; ln -sf /usr/lib/java/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  elif [ -e /usr/lib/java/jre/plugin/i386/ns7/libjavaplugin_oji.so ]; then 
    ( cd /usr/lib/mozilla/plugins ; ln -sf /usr/lib/java/jre/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  fi
fi

# Make sure our gdk loaders are up to date
if [ -x /usr/bin/gdk-pixbuf-query-loaders ]; then
   mkdir -p /etc/gtk-2.0
   /usr/bin/gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders;
fi; 

# Make sure our pango modules are up to date
/usr/bin/pango-querymodules > /etc/pango/pango.modules

# Update any existing icon cache files:
for theme_dir in gnome hicolor ; do
   if [ ! -f /usr/share/icons/${theme_dir}/icon-theme.cache ]; then
     echogreen "*" ; echo " Creating icon cache for ${theme_dir}."
     /usr/bin/gtk-update-icon-cache -t -f /usr/share/icons/${theme_dir} 1> /dev/null 2> /dev/null
   fi ;
done

# Update gnome desktop database
if [ -x /usr/bin/update-desktop-database ]; then
  echogreen "*" ; 
  echo " Updating Desktop database:  /usr/bin/update-desktop-database &"
  /usr/bin/update-desktop-database & 1> /dev/null 2> /dev/null
fi

# Update rarian help database
if [ -x /usr/bin/rarian-sk-update ]; then
  /usr/bin/rarian-sk-update & 1> /dev/null 2> /dev/null
fi

echo ;

}

gsb_stop() {
        exit 0  ;
}

case "$1" in
'start')
  gsb_start
  ;;
'stop')
  gsb_stop
  ;;
*)
  echo $"Usage: $0 {start|stop}"
    ;;
esac
