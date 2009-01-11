# Refresh our libraries 
for dir in engines filesystems loaders ;
do
    libtool --finish --silent usr/lib*/gtk*/*/$dir ;
done;

## Create loaders in etc
mkdir -p etc/gtk-2.0
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
   usr/bin/gdk-pixbuf-query-loaders > etc/gtk-2.0/gdk-pixbuf.loaders;
fi;
# Handle the incoming configuration files:
config() {
  for infile in $1; do
    NEW="$infile"
    OLD="`dirname $NEW`/`basename $NEW .new`"
    # If there's no config file by that name, mv it over:
    if [ ! -r $OLD ]; then
      if [ -f $NEW ]; then
        mv $NEW $OLD
      fi ;
    elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then
      # toss the redundant copy
      rm -f $NEW
    fi
    # Otherwise, we leave the .new copy for the admin to consider...
  done
}

# Prepare the new configuration files
for file in etc/profile.d/libgtk+.csh.new etc/profile.d/libgtk+.sh.new ; do
  if test -e $(dirname $file)/$(basename $file .new) ; then
    if [ ! -x $(dirname $file)/$(basename $file .new) ]; then
      chmod 644 $file
     else
      chmod 755 $file
    fi
  fi
  config $file
done


# Add gdk modules query update to start to rc.local
if ! grep "gdk-pixbuf-query-loaders" etc/rc.d/rc.local >/dev/null 2>&1; then
  cat <<EOF >>etc/rc.d/rc.local

# GNOME applications like this file kept updated:
if [ -x /usr/bin/gdk-pixbuf-query-loaders ]; then
  echo "Updating gdk-pixbuf-loaders:  /usr/bin/gdk-pixbuf-query-loaders &"
   /usr/bin/gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders &
fi;

EOF
fi
