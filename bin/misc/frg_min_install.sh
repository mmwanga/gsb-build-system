#!/bin/sh

FRGROOT=`dirname $0`

# Install Platform
(
  cd "$FRGROOT"/frg/platform
  upgradepkg --install-new *.tgz
  upgradepkg --reinstall shared-mime-info*.tgz
)

# Install Desktop requirements
(
  cd "$FRGROOT"/frg/desktop_reqs
  upgradepkg --install-new dbus*.tgz
  upgradepkg --install-new hal*.tgz
  upgradepkg --install-new cyrus-sasl*.tgz
  upgradepkg --install-new openldap*.tgz

  upgradepkg --install-new *.tgz
)

# Install Desktop
(
  cd "$FRGROOT"/frg/desktop
  upgradepkg --install-new scrollkeeper*.tgz
  upgradepkg --install-new *.tgz
)

if [ "$FRG_FULL" != "true" ]; then
    /bin/sh $FRGROOT/frg_min_dups_install.sh
    /bin/sh $FRGROOT/frg_post_install.sh
fi

