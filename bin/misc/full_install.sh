#!/bin/sh

FRGROOT=`dirname $0`

# Install minimum install
sh $FRGROOT/min_install.sh

# Install Themes
(
  cd $FRGROOT/themes
  upgradepkg --install-new *.tgz
)
  
# Install Language Bindings
(
  cd $FRGROOT/bindings
  upgradepkg --install-new *.tgz
)

# Install Office
(
  cd $FRGROOT/office
  upgradepkg --install-new *.tgz
)

# Install Other misc programs
(
  cd $FRGROOT/other
  upgradepkg --install-new *.tgz
)

/usr/bin/update-mime-database /usr/share/mime
