# Clean up previous softlinks
if [ -r usr/@LIBDIR@/firefox ]; then
  chroot . rm -rf usr/@LIBDIR@/firefox ;
fi;

# Make our softlinks
if [ -d usr/@LIBDIR@/firefox-@VERSION@ ]; then
  (cd usr/lib ; ln -sf firefox-@VERSION@ firefox );
fi;

# Set up java plugins for firefox if java installed
if [ ! -h usr/@LIBDIR@/mozilla/plugins/libjavaplugin_oji.so ]; then
  if [ -e usr/@LIBDIR@/java/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    mkdir -p usr/@LIBDIR@/mozilla/plugins ;
    ( cd usr/@LIBDIR@/mozilla/plugins ; ln -sf /usr/@LIBDIR@/java/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  elif [ -e usr/@LIBDIR@/java/jre/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    ( cd usr/@LIBDIR@/mozilla/plugins ; ln -sf /usr/@LIBDIR@/java/jre/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  fi
fi

if [ -x usr/bin/gconftool-2 ]; then
  # Set firefox as default GNOME chrome reader
  usr/bin/gconftool-2 --direct --config-source=$(usr/bin/gconftool-2 --get-default-source) --type string --set /desktop/gnome/url-handlers/chrome/command "/usr/bin/firefox \"%s\"" 1> /dev/null 2> /dev/null
fi;
