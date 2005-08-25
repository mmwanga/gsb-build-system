if [ -L usr/lib/firefox ]; then
    for nsslib in libnspr4.so libnss3.so libplc4.so libplds4.so libsmime3.so libsoftokn3.so libssl3.so
      do
      if [ ! -f usr/lib/$nsslib ]; then
	  ( cd usr/lib ; rm -rf $nsslib )
	  ( cd usr/lib ; ln -sf firefox/$nsslib $nsslib )
      fi
    done
fi
