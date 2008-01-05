# Clean up previous softlinks
if [ -h usr/lib/firefox ]; then
  rm -fr usr/lib/firefox ;
fi;

# Clean up previous softlinks on x86_64 platforms
if [ -h usr/lib64/firefox ]; then
  rm -fr usr/lib/firefox ;
fi ;

# Set up java plugins for firefox
if [ ! -h usr/lib/firefox/plugins/libjavaplugin_oji.so ]; then
  if [ -e usr/lib/java/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    ( cd usr/lib/firefox/plugins ; ln -sf /usr/lib/java/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  elif [ -e usr/lib/java/jre/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    ( cd usr/lib/firefox/plugins ; ln -sf /usr/lib/java/jre/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  fi
fi

if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
