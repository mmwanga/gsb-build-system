#!/bin/sh

# Install minimum install
sh ./min_install.sh

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
