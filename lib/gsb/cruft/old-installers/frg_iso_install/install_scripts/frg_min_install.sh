#!/bin/sh

# Install FRG-Version
(
  cd "$FRGROOT"/frgnome
  
  upgradepkg --install-new frg-version-*.tgz
)

# Install Platform
(
  cd "$FRGROOT"/frgnome/platform

  removepkg libpixman
  upgradepkg --install-new pkgconfig%pkg-config-*.tgz
  upgradepkg --install-new dbus-*.tgz
  upgradepkg --install-new hal-*.tgz
  upgradepkg --install-new pango-*.tgz

  for i in *.tgz
  do
    PACK=`echo $i|cut -d - -f 1`
    if [ "$PACK" = "NOTHING_TO_CHECK_HERE" ]; then
	echo "Dupe package, skipping"
    else
	upgradepkg --install-new $i
    fi
  done
)

# Install Desktop requirements
(
  cd "$FRGROOT"/frgnome/desktop_reqs

  removepkg libmusepack
  upgradepkg --install-new openldap-*.tgz

  for i in *.tgz
  do
    PACK=`echo $i|cut -d - -f 1`
    if [ "$PACK" = "NOTHING_TO_CHECK_HERE" ]; then
	echo "Dupe package, skipping"
    else
	upgradepkg --install-new $i
    fi
  done

)

# Install Desktop
(
  cd "$FRGROOT"/frgnome/desktop

  upgradepkg --install-new scrollkeeper-*.tgz
  upgradepkg --install-new ximian-connector%evolution-exchange-*.tgz

  for i in *.tgz
  do
    PACK=`echo $i|cut -d - -f 1`
    if [[ "$PACK" = "metacity" || "$PACK" = "totem" ]]; then
	echo "Dupe package, skipping"
    else
	upgradepkg --install-new $i
    fi
  done
)

upgradepkg --reinstall "$FRGROOT"/frgnome/platform/libgnome-*.tgz

if [ "$FRG_FULL" != "true" ]; then
    /bin/sh "$FRGROOT"/install_scripts/frg_min_dups_install.sh
    /bin/sh "$FRGROOT"/install_scripts/frg_post_install.sh
fi

