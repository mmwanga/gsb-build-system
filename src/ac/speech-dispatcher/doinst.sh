# Install new info files
if [ -x usr/bin/install-info ]; then
  usr/bin/install-info usr/share/info/spd-say.info usr/info/dir >/dev/null 2>&1
  usr/bin/install-info usr/share/info/speech-dispatcher.info usr/info/dir >/dev/null 2>&1
  usr/bin/install-info usr/share/info/ssip.info usr/info/dir >/dev/null 2>&1
fi
