#!/bin/bash
# This is a (temporary) quick and dirty script to install GSB packages
# for testing.  This will be replaced with a proper installer later.
#

SUBDIRS="	packages/tools
		packages/libraries
		packages/platform
		packages/desktop
		packages/applications
		packages/accessibility
		packages/bindings
		packages/office
		packages/mono
		packages/extras
		packages/themes
		packages/compiz		"

PRIORITY_PACKAGES=" ORBit2
                    GConf
                    libgnomeui   "
IFS=$'\n'
for PACKAGE in $PRIORITY_PACKAGES
do
  [ ! -d ./packages ] && {
    echo "${0}: Cannot find packages/ directory."
    exit 1
  }
  PKGINSTALL=$(find ./packages -name "$PACKAGE*.tgz")

  if [ -z $PKGINSTALL ]; then
    echo "${0}: Cannot find any $PACKAGE package."
    exit 1;
  else
    upgradepkg --install-new $PKGINSTALL ;
    [ $? -ne 0 ] && {
      echo "${0}: Error during installation."
      exit 1
    }
  fi;
done; 

IFS=$'\n'
for DIR in $SUBDIRS
do
  [ ! -d $DIR ] && {
    echo "${0}: No such directory: $DIR"
    exit 1
  }

  ( cd $DIR && upgradepkg --install-new *.tgz )

  [ $? -ne 0 ] && {
    echo "${0}: Error during installation."
    exit 1
  }
done

echo "${0}: Finished installing GSB."
echo "You will need to run 'xwmconfig' to set GNOME as your desktop."
