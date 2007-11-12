## Create loaders in etc
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
   usr/bin/gdk-pixbuf-query-loaders > etc/gtk-2.0/gdk-pixbuf.loaders;
fi;
