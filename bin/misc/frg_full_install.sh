#!/bin/sh

FRGROOT=`dirname $0`

export FRG_FULL=true

# Install minimum install
/bin/sh "$FRGROOT"/frg_min_install.sh

# Install Themes
(
  cd "$FRGROOT"/frg/themes
  upgradepkg --install-new *.tgz
)
  
# Install Language Bindings
(
  cd "$FRGROOT"/frg/bindings
  upgradepkg --install-new *.tgz
)

# Install Office
(
  cd "$FRGROOT"/frg/office
  upgradepkg --install-new *.tgz
)

# Install Other misc programs
(
  cd "$FRGROOT"/frg/other
  upgradepkg --install-new *.tgz
)

/bin/sh "$FRGROOT"/frg_min_dups_install.sh
/bin/sh "$FRGROOT"/frg_full_dups_install.sh
/bin/sh "$FRGROOT"/frg_post_install.sh
