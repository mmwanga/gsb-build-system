#!/bin/sh
# Create gdk-pixbuf cache
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
  usr/bin/gdk-pixbuf-query-loaders --update-cache >/dev/null 2>&1
fi
