# Remove the sabayon group if it exists.
# This is needed because a previous install may have added the sabayon group
# which isn't actually required if the sabayon user is made a member of
# group users.  It's just cruft to add this when not required.
if grep "^sabayon:" etc/group >/dev/null 2>&1; then
  cat etc/group >etc/group.gsb
  cat etc/group.gsb | grep -v "^sabayon:" >etc/group
  if [ $? -ne 0 ]; then
    # Don't leave etc/group in an unknown state.
    cat etc/group.gsb >etc/group
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old sabayon group."
  fi
  rm -f etc/group.gsb

  # Make sure the sabayon user doesn't have an invalid group id.
  chroot . /usr/sbin/usermod -g 100 sabayon
fi

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

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
	rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor
