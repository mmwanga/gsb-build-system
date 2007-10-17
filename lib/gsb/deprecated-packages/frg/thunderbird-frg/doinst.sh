
THUNDERBIRDDIR=usr/lib64/thunderbird
REGXPCOM=../../../$THUNDERBIRDDIR/regxpcom
REGCHROME=../../../$THUNDERBIRDDIR/regchrome
THUNDERBIRD=../../../$THUNDERBIRDDIR/thunderbird-bin

# Register the default extensions
( cd $THUNDERBIRDDIR && ./run-mozilla.sh $REGXPCOM && ./run-mozilla.sh $REGCHROME && ./run-mozilla.sh $THUNDERBIRD -register )
