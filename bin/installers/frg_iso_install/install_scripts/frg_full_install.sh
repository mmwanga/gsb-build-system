#!/bin/sh

# Install minimum install
/bin/sh "$FRGROOT"/install_scripts/frg_min_install.sh

# Install Themes
(
  cd "$FRGROOT"/frgnome/themes
  upgradepkg --install-new *.tgz
)
  
# Install Language Bindings
(
  cd "$FRGROOT"/frgnome/bindings
  upgradepkg --install-new *.tgz
)

# Install Office
(
  cd "$FRGROOT"/extras/office
  upgradepkg --install-new *.tgz
)

# Install Other misc programs
(
  cd "$FRGROOT"/extras/other
  upgradepkg --install-new *.tgz
)

/bin/sh "$FRGROOT"/install_scripts/frg_min_dups_install.sh
/bin/sh "$FRGROOT"/install_scripts/frg_full_dups_install.sh
/bin/sh "$FRGROOT"/install_scripts/frg_post_install.sh
