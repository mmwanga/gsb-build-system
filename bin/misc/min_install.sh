#!/bin/sh

FRGROOT=`dirname $0`


# Install Platform
(
  cd $FRGROOT/platform
  upgradepkg --install-new *.tgz
  upgradepkg --reinstall shared-mime-info*.tgz
)

# Install Desktop requirements
(
  cd $FRGROOT/desktop_reqs
  upgradepkg --install-new dbus*.tgz
  upgradepkg --install-new hal*.tgz
  upgradepkg --install-new cyrus-sasl*.tgz
  upgradepkg --install-new openldap*.tgz

  upgradepkg --install-new *.tgz
)

# Install Desktop
(
  cd $FRGROOT/desktop
  upgradepkg --install-new scrollkeeper*.tgz
  upgradepkg --install-new *.tgz
)

/usr/bin/update-mime-database /usr/share/mime
