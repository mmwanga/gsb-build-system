NVUDIR=usr/lib/nvu-1.0
REGXPCOM=../../../$NVUDIR/regxpcom
REGCHROME=../../../$NVUDIR/regchrome
NVU=../../../$NVUDIR/nvu-bin

# Register the default extensions
( cd $NVUDIR && ./run-mozilla.sh $REGXPCOM && ./run-mozilla.sh $REGCHROME && ./run-mozilla.sh $NVU -register )

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi
