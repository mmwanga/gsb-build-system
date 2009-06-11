# Run this if we are on an installed system.  Otherwise it will be
# handled on first boot.
if [ -x /usr/bin/update-gtk-immodules-2.0 ]; then
  /usr/bin/update-gtk-immodules
fi
