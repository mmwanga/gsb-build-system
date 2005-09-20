#!/bin/sh

# Install minimum install
/bin/sh "$FRGROOT"/install_scripts/frg_min_install.sh

# Install Themes
(
  cd "$FRGROOT"/extras/themes

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
  
# Install Language Bindings
(
  cd "$FRGROOT"/frgnome/bindings
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

# Install Office
(
  cd "$FRGROOT"/extras/office
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

# Install Other misc programs
(
  cd "$FRGROOT"/extras/other
  for i in *.tgz
  do
    PACK=`echo $i|cut -d - -f 1`
    if [ "$PACK" = "sylpheed" ]; then
	echo "Dupe package, skipping"
    else
	upgradepkg --install-new $i
    fi
  done
)

/bin/sh "$FRGROOT"/install_scripts/frg_min_dups_install.sh
/bin/sh "$FRGROOT"/install_scripts/frg_full_dups_install.sh
/bin/sh "$FRGROOT"/install_scripts/frg_post_install.sh
