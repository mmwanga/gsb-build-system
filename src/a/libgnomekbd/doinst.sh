# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# glib2 compile schema
if [ -x usr/bin/glib-compile-schemas ]; then
  usr/bin/glib-compile-schemas usr/share/glib-2.0/schemas
fi
