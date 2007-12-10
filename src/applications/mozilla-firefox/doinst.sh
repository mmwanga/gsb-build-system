# Clean up previous softlinks
if [ -h usr/lib/firefox ]; then
  rm -fr usr/lib/firefox ;
fi;

# Clean up previous softlinks on x86_64 platforms
if [ -h usr/lib64/firefox ]; then
  rm -fr usr/lib/firefox ;
fi ;

if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
