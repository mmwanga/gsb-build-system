##
## Guile 1.8.1 has improper definition for SLIB.
## Copy over the slib3a4 guile init.

if [ -f usr/share/guile/1.8/ice-9/slib.scm ]; then
   mv -f usr/share/guile/1.8/ice-9/slib.scm usr/share/guile/1.8/ice-9/slib.scm.original ;
   cp -f usr/share/guile/1.8/ice-9/slib.scm.3a4-guile.1.8 usr/share/guile/1.8/ice-9/slib.scm ;
fi;

(
if [ -x usr/bin/guile-config -a -x usr/bin/guile ]; then
  GUILEDATA=$(usr/bin/guile-config info pkgdatadir)
  cd $GUILEDATA ;
  guile -c "(use-modules (ice-9 slib))" 2> /dev/null 1> /dev/null;
fi;
)
