# If the sabayon user doesn't exist, add it.
if ! grep "^sabayon:" etc/passwd 1>/dev/null 2>&1; then
  echo "sabayon:x:63:100:sabayon:/var/sabayon:/bin/false" >>etc/passwd
fi
if ! grep "^sabayon:" etc/shadow 1>/dev/null 2>&1; then
  echo "sabayon:*:9797:0:::::" >>etc/shadow
fi

# Needed for 'enforce mandatory' setting
if ! grep "gconf.path.mandatory" etc/gconf/2/local-madatory.path >/dev/null 2>&1; then
  echo "include \"\$(HOME)/.gconf.path.mandatory\"" >> etc/gconf/2/local-madatory.path ;
fi
if ! grep "gconf.path.defaults" etc/gconf/2/local-defaults.path >/dev/null 2>&1; then
  echo "include \"\$(HOME)/.gconf.path.defaults\"" >> etc/gconf/2/local-defaults.path ;
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# update hicolor icons
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor
