DESKTOPFILE=usr/share/applications/gslapt.desktop
if [ -f $DESKTOPFILE ]; then
  if [ -x usr/bin/gnomesu ]; then
    sed -i.bak -re "s/(Exec=)(\/usr\/sbin\/gslapt)/\1gnomesu \2/" $DESKTOPFILE
  elif [ -x usr/bin/gksu ]; then
    sed -i.bak -re "s/(Exec=)(\/usr\/sbin\/gslapt)/\1gksu \2/" $DESKTOPFILE
  elif [ -x usr/bin/gksudo ]; then
    sed -i.bak -re "s/(Exec=)(\/usr\/sbin\/gslapt)/\1gksudo \2/" $DESKTOPFILE
  elif [ -x usr/bin/kdesu ]; then
    sed -i.bak -re "s/(Exec=)(\/usr\/sbin\/gslapt)/\1kdesu \2/" $DESKTOPFILE
  fi
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
