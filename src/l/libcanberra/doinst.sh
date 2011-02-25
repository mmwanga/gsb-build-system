#!/bin/sh
# update gtk+2 modules
if [ -x usr/bin/update-gtk-immodules ]; then
  usr/bin/update-gtk-immodules
fi

# update gtk+3 modules
if [ -x usr/bin/update-gtk-immodules-3.0 ]; then
  usr/bin/update-gtk-immodules-3.0
fi
