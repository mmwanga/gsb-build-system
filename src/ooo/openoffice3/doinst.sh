# Preserve new configuration files
install_file() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

install_file etc/bash_completion.d/ooffice3.1.sh.new

# Install dictionary extensions for spellchecking
if [ -x "usr/lib@LIBDIRSUFFIX@/ooo-3.1/program/unopkg" ]; then
  UNOPKGTMP=$TMP/$$$$$$
  if [ -f "usr/lib@LIBDIRSUFFIX@/ooo-3.1/share/extension/install/dict-@LANG@.oxt" ]; then
    usr/lib@LIBDIRSUFFIX@/ooo-3.1/program/unopkg add --shared --shared \
        usr/lib@LIBDIRSUFFIX@/ooo-3.1/share/extension/install/dict-@LANG@.oxt \
        "-env:UserInstallation=file:///$UNOPKGTMP" 2>/dev/null 1>/dev/null
  fi;
  rm -rf $UNOPKGTMP
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database -q usr/share/applications
fi

# update mime database
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi

# update hicolor icon cache
if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
        rm -f usr/share/icons/hicolor/icon-theme.cache
fi
usr/bin/gtk-update-icon-cache -f -q usr/share/icons/hicolor
