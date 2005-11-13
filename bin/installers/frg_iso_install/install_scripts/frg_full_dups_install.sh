#/bin/sh
#
# Prompt to install packages that have multiple versions
#
# $Id$

SYLPHEED_VERSION=2.0.4
SYLPHEED_CLAWS_VERSION=1.9.12

# Install Sylpheed-claws

if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which Sylpheed to install\n"

    echo "
1) Sylpheed $SYLPHEED_VERSION 
2) Sylpheed-claws $SYLPHEED_CLAWS_VERSION (feature enhanced version of sylpheed)
"

    printf "Selection: "
    read sylpheed_selection
    echo ""
fi

if [ "$PROMPTS" = "default" ]; then
    sylpheed_selection=1
fi

if [ "$PROMPTS" = "alt" ]; then
    sylpheed_selection=2
fi

case "$sylpheed_selection" in
'1')
	upgradepkg --install-new $FRGROOT/extras/other/sylpheed-"$SYLPHEED_VERSION"-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/extras/alternatives/sylpheed-claws-"$SYLPHEED_CLAWS_VERSION"-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing default Sylpheed"
	upgradepkg --install-new $FRGROOT/extras/other/sylpheed-"$SYLPHEED_VERSION"-*frg.tgz
esac

