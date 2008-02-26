# If the sabayon user/group don't exist, add them:
if grep "^sabayon:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon:x:63:63:Sabayon user:/var/sabayon:/bin/false" >> etc/passwd
fi
if grep "^sabayon::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon::63:sabayon" >> etc/group
fi
if grep "^sabayon:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "sabayon:*:9797:0:::::" >> etc/shadow
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor
