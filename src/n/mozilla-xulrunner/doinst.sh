# Clean up previous softlinks
if [ -r usr/@LIBDIR@/xulrunner ]; then
  chroot . rm -rf usr/@LIBDIR@/xulrunner ;
fi;
if [ -r usr/@LIBDIR@/xulrunner-devel ]; then
  chroot . rm -rf usr/@LIBDIR@/xulrunner-devel ;
fi;

# Make our softlinks
if [ -d usr/@LIBDIR@/xulrunner-@VERSION@ ]; then
  (cd usr/@LIBDIR@ ; ln -sf xulrunner-@VERSION@ xulrunner );
fi;
if [ -d usr/@LIBDIR@/xulrunner-devel-@VERSION@ ]; then
  (cd usr/@LIBDIR@ ; ln -sf xulrunner-devel-@VERSION@ xulrunner-devel );
fi;

# Set up java plugins for xulrunner if java installed
if [ ! -h usr/@LIBDIR@/mozilla/plugins/libjavaplugin_oji.so ]; then
  if [ -e usr/@LIBDIR@/java/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    mkdir -p usr/@LIBDIR@/mozilla/plugins ;
    ( cd usr/@LIBDIR@/mozilla/plugins ; ln -sf /usr/@LIBDIR@/java/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  elif [ -e usr/@LIBDIR@/java/jre/plugin/i386/ns7/libjavaplugin_oji.so ]; then
    ( cd usr/@LIBDIR@/mozilla/plugins ; ln -sf /usr/@LIBDIR@/java/jre/plugin/i386/ns7/libjavaplugin_oji.so libjavaplugin_oji.so )
  fi
fi

# Add xulrunner to ld.so.conf
if grep "xulrunner" etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/usr/@LIBDIR@/xulrunner" >> etc/ld.so.conf
fi
ldconfig -r . 
