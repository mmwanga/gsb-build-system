#!/bin/sh

FRGROOT=`dirname $0`

export FRG_FULL=true

# Install minimum install
/bin/sh $FRGROOT/min_install.sh

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

/bin/sh $FRGROOT/frg_min_dups_install.sh
/bin/sh $FRGROOT/frg_full_dups_install.sh
/bin/sh $FRGROOT/frg_post_install.sh
