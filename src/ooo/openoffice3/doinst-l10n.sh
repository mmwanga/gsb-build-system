# Install dictionary extensions for spellchecking
if [ -x "usr/lib@LIBDIRSUFFIX@/ooo-3.1/program/unopkg" ]; then
  UNOPKGTMP=$TMP/$$$$$$
  usr/lib@LIBDIRSUFFIX@/ooo-3.1/program/unopkg add --shared --shared \
      usr/lib@LIBDIRSUFFIX@/ooo-3.1/share/extension/install/dict-@LANG@.oxt \
      "-env:UserInstallation=file:///$UNOPKGTMP" ;
  rm -rf $UNOPKGTMP
fi
