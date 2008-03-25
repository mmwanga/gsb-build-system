# Clean up previous softlinks
if [ -r usr/lib/firefox ]; then
  rm -rf usr/lib/firefox ;
fi;

if [ -d usr/lib/firefox-@VERSION@ ]; then
  (cd usr/lib ; ln -s firefox-@VERSION@ firefox );
fi;

# Clean up previous softlinks on x86_64 platforms
if [ -r usr/lib64/firefox ]; then
  rm -rf usr/lib64/firefox ;
fi ;

if [ -d usr/lib64/firefox-@VERSION@ ]; then
  (cd usr/lib64 ; ln -s firefox-@VERSION@ firefox );
fi;

# Set up java plugins for firefox
if [ ! -h usr/lib/firefox/plugins/libjavaplugin_oji.so ]; then
  if [ -e usr/lib/java/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    mkdir -p usr/lib/firefox-@VERSION@/plugins ;
    ( cd usr/lib/firefox-@VERSION@/plugins ; ln -sf /usr/lib/java/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  elif [ -e usr/lib/java/jre/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    ( cd usr/lib/firefox-@VERSION@/plugins ; ln -sf /usr/lib/java/jre/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  fi
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
