config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redund
ant
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/fam.conf.new

editconf="usr/bin/perl usr/lib/fam/editconf.perl"
echo "Adding fam to rpc..."
$editconf rpc add 391002 "sgi_fam         391002"
echo "Adding fam to inetd.conf..."
$editconf inetd.conf add '\b(fam|FAM)\b' \
"# fam, the File Alteration Monitor, http://oss.sgi.com/projects/fam/" \
"sgi_fam/1-2 stream rpc/tcp wait root /usr/bin/fam fam"
echo "Restarting inetd..."
killall -HUP inetd

