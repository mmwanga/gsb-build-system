#!/bin/sh

# Install requirements
(
  cd requirements
  upgradepkg --install-new dbus*.tgz
  upgradepkg --install-new hal*.tgz

  upgradepkg --install-new \
      libcap*.tgz \
      libcroco*.tgz \
      libgsf*.tgz \
      openh323*.tgz \
      pwlib*.tgz
)

# Install Gstreamer and media libs
(
  cd gstreamer
  upgradepkg --install-new libs/*.tgz
  upgradepkg --install-new gstreamer*.tgz
  upgradepkg --install-new gst-plugins*.tgz
)

# Install Platform
(
  cd platform
  upgradepkg --install-new *.tgz
)

# Install Desktop
(
  cd desktop
  upgradepkg --install-new scrollkeeper*.tgz
  upgradepkg --install-new *.tgz
)

# Install Themes
(
  cd themes
  upgradepkg --install-new *.tgz
)
  
# Install Language Bindings
(
  cd bindings
  upgradepkg --install-new *.tgz
)

# Install Office
(
  cd office
  upgradepkg --install-new *.tgz
)

# Install Other misc programs
(
  cd other
  upgradepkg --install-new *.tgz
)
