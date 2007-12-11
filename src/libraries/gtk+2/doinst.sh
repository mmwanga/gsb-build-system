# Refresh our libraries 
for dir in engines filesystems loaders ;
do
    libtool --finish --silent usr/lib*/gtk*/*/$dir ;
done;

## Create loaders in etc
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
   usr/bin/gdk-pixbuf-query-loaders > etc/gtk-2.0/gdk-pixbuf.loaders;
fi;
