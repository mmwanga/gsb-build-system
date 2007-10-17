
FIREFOXDIR=usr/lib/firefox-1.0.6
REGXPCOM=../../../$FIREFOXDIR/regxpcom
REGCHROME=../../../$FIREFOXDIR/regchrome
FIREFOX=../../../$FIREFOXDIR/firefox-bin

# Register the default extensions
( cd $FIREFOXDIR && ./run-mozilla.sh $REGXPCOM && ./run-mozilla.sh $REGCHROME && ./run-mozilla.sh $FIREFOX -register )
