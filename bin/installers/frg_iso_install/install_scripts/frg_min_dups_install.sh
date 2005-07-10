#/bin/sh
#
# Prompt to install packages that have multiple versions
#
# $Id$

LIBWNCK=2.10.2

METACITY=2.10.2

LIBRSVG=2.9.5
LIBRSVG_ALT=2.10.0

TOTEMVERSION=1.0.4
TOTEM_CVS=1.1.2


# Install LIBWNCK
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which libwnck to install 1 or 2\n"

    echo "
1) libwnck $LIBWNCK
2) libwnck $LIBWNCK (patched)
      patched to add blinking taskbar/titlebar
"

    printf "Selection: "
    read libwnck_selection
    echo ""
fi

if [ "$PROMPTS" = "default" ]; then
    libwnck_selection=1
fi

if [ "$PROMPTS" = "alt" ]; then
    libwnck_selection=2
fi

case "$libwnck_selection" in
'1')
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/libwnck-"$LIBWNCK"-*frg.tgz
	    ;;
'2')
	    upgradepkg --install-new $FRGROOT/extras/alternatives/libwnck-"$LIBWNCK"p-*frg.tgz
	    ;;
*)
	    echo "Invalid selection"
	    echo "Installing default libwnck"
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/libwnck-"$LIBWNCK"-*frg.tgz
esac

# Install Metacity
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which metacity to install 1 or 2\n"

    echo "
1) metacity $METACITY
2) metacity $METACITY (patched)
      patched to add functionality:
         - Blinking taskbar/titlebar
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


# Install LIBRSVG
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which librsvg to install 1 or 2\n"

    echo "
1) librsvg $LIBRSVG
2) librsvg $LIBRSVG_ALT (unreleased)
"

    printf "Selection: "
    read librsvg_selection
    echo ""
fi

if [ "$PROMPTS" = "default" ]; then
    librsvg_selection=1
fi

if [ "$PROMPTS" = "alt" ]; then
    librsvg_selection=2
fi

case "$librsvg_selection" in
'1')
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/librsvg-"$LIBRSVG"-*frg.tgz
	    ;;
'2')
	    upgradepkg --install-new $FRGROOT/testing/librsvg-"$LIBRSVG_ALT"-*frg.tgz
	    ;;
*)
	    echo "Invalid selection"
	    echo "Installing stable librsvg"
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/librsvg-"$LIBRSVG"-*frg.tgz
esac


# Install TOTEM
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which Totem to install 0, 1, 2 or 3\n"

    echo "
1) Totem $TOTEMVERSION with gstreamer backend
2) Totem $TOTEMVERSION with xine backend
3) Totem unstable $TOTEM_CVS with gstreamer backend
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
'3')
	upgradepkg --install-new $FRGROOT/testing/totem-"$TOTEM_CVS"-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable Totem with gstreamer backend"
	upgradepkg --install-new $FRGROOT/frgnome/desktop/totem-"$TOTEMVERSION"-*.tgz
esac
