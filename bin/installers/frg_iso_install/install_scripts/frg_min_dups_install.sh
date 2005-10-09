#/bin/sh
#
# Prompt to install packages that have multiple versions
#
# $Id$

METACITY=2.12.0

TOTEMVERSION=1.2.0
TOTEM_CVS=1.2.0


# Install Metacity
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which metacity to install 1 or 2\n"

    echo "
1) metacity $METACITY
2) metacity $METACITY (patched)
      patched to add functionality:
         - window placement options
         - change click behavior
"

    printf "Selection: "
    read metacity_selection
    echo ""
fi

if [ "$PROMPTS" = "default" ]; then
    metacity_selection=1
fi

if [ "$PROMPTS" = "alt" ]; then
    metacity_selection=2
fi

case "$metacity_selection" in
'1')
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/metacity-"$METACITY"-*frg.tgz
	    ;;
'2')
	    upgradepkg --install-new $FRGROOT/extras/alternatives/metacity-"$METACITY"p-*frg.tgz
	    ;;
*)
	    echo "Invalid selection"
	    echo "Installing default metacity"
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/metacity-"$METACITY"-*frg.tgz
esac


# Install TOTEM
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which Totem to install 0, 1, 2 or 3\n"

    echo "
1) Totem $TOTEMVERSION with gstreamer backend
2) Totem $TOTEMVERSION with xine backend
"

    printf "Selection: "
    read totem_selection
    echo ""
fi

if [ "$PROMPTS" = "default" ]; then
    totem_selection=1
fi

if [ "$PROMPTS" = "alt" ]; then
    totem_selection=2
fi

case "$totem_selection" in
'1')
	upgradepkg --install-new $FRGROOT/frgnome/desktop/totem-"$TOTEMVERSION"-*.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/extras/alternatives/totem-"$TOTEMVERSION"xine-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable Totem with gstreamer backend"
	upgradepkg --install-new $FRGROOT/frgnome/desktop/totem-"$TOTEMVERSION"-*.tgz
esac
