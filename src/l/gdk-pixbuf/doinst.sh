# Create gdk-pixbuf cache
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
  usr/bin/gdk-pixbuf-query-loaders > usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
fi
