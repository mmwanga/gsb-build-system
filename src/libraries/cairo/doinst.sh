## In the change that cairo is upgraded after gtk is installed,
## we'll need to refresh our loaders.
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
   mkdir -p etc/gtk-2.0
   usr/bin/gdk-pixbuf-query-loaders > etc/gtk-2.0/gdk-pixbuf.loaders;
fi;
