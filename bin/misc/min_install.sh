#!/bin/sh

FRGROOT=`dirname $0`

# Install requirements
(
  cd $FRGROOT/requirements
  upgradepkg --install-new dbus*.tgz
  upgradepkg --install-new hal*.tgz

  upgradepkg --install-new \
      libcap*.tgz \
      libcroco*.tgz \
      libgsf*.tgz \
      openh323*.tgz \
      pwlib*.tgz \
      howl*.tgz \
      openldap*.tgz \
      cyrus-sasl*.tgz \
      hicolor-icon-theme*.tgz
)

# Install Gstreamer and media libs
(
  cd $FRGROOT/gstreamer
  upgradepkg --install-new libs/*.tgz
  upgradepkg --install-new gstreamer*.tgz
  upgradepkg --install-new gst-plugins*.tgz
)

# Install Platform
(
  cd $FRGROOT/platform
  upgradepkg --install-new *.tgz
)

# Install Desktop
(
  cd $FRGROOT/desktop
  upgradepkg --install-new scrollkeeper*.tgz
  upgradepkg --install-new *.tgz
)

/usr/bin/update-mime-database /usr/share/mime
