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
