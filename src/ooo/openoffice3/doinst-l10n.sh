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
