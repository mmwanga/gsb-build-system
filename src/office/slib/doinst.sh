# copy over the slib3b1 guile init.
if [ -f usr/share/guile/1.8/ice-9/slib.scm ]; then
   if [ ! -f usr/share/guile/1.8/ice-9/slib.scm.original ]; then
     mv -f usr/share/guile/1.8/ice-9/slib.scm usr/share/guile/1.8/ice-9/slib.scm.original ;
   fi;
fi;
# install our custom version
cp -f usr/share/guile/1.8/ice-9/slib.scm.3b1-guile.1.8 usr/share/guile/1.8/ice-9/slib.scm ;

# initialise slib
if [ -x usr/bin/guile-config -a -x usr/bin/guile ]; then
  GUILEDATA=$(usr/bin/guile-config info pkgdatadir)
  ( cd $GUILEDATA ; guile -c "(use-modules (ice-9 slib))" 2> /dev/null 1> /dev/null; )
fi;

# Create required slibcat file
if [ -x usr/bin/guile ]; then
  usr/bin/guile -c "(use-modules (ice-9 slib)) (require 'new-catalog)" 1> /dev/null 2> /dev/null
fi;

# Install new info files
if [ -x usr/bin/install-info ]; then
  usr/bin/install-info usr/info/slib.info.gz usr/info/dir >/dev/null 2>&1
fi
