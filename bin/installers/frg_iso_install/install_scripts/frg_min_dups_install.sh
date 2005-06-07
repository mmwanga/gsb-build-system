#/bin/sh
#
# Prompt to install packages that have multiple versions
#
# $Id$

LIBRSVG=2.9.5
LIBRSVG_ALT=2.10.0

GNOME_GAMES=2.10.1

TOTEMVERSION=1.0.2
TOTEM_CVS=1.1.2

# Install LIBRSVG
if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which librsvg to install 1 or 2\n"

    echo "
1) librsvg 2.9.5
2) librsvg 2.10.0 (unreleased)
"

    printf "Selection: "
    read librsvg_selection
    echo ""
fi

if [ "$DEFAULT" = "true" ]; then
    librsvg_selection=1
fi

if [ "$ALT" = "true" ]; then
    librsvg_selection=2
fi

case "$librsvg_selection" in
'1')
	    upgradepkg --install-new $FRGROOT/frgnome/desktop/librsvg-"$LIBRSVG"-*frg.tgz
	    ;;
'2')
	    upgradepkg --install-new $FRGROOT/frgnome/testing/librsvg-"$LIBRSVG_ALT"-*frg.tgz
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
3) Totem cvs $TOTEM_CVS with gstreamer backend
"

    printf "Selection: "
    read totem_selection
    echo ""
fi

if [ "$DEFAULT" = "true" ]; then
    totem_selection=1
fi

if [ "$ALT" = "true" ]; then
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

# Install GNOME GAMES

if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which gnome-games to install\n"

    echo "
0) Do not install gnome-games
1) gnome-games $GNOME_GAMES
2) gnome-games $GNOME_GAMES (binaries are setgid games)
"

    printf "Selection: "
    read games_selection
    echo ""
fi

if [ "$DEFAULT" = "true" ]; then
    games_selection=1
fi

if [ "$ALT" = "true" ]; then
    games_selection=2
fi

case "$games_selection" in
'0')
	echo "Gnome Games not installed"
	;;
'1')
	upgradepkg --install-new $FRGROOT/frgnome/desktop/gnome-games-"$GNOME_GAMES"-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/extras/alternatives/gnome-games-"$GNOME_GAMES"sgid-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing default gnome-games"
	upgradepkg --install-new $FRGROOT/frgnome/desktop/gnome-games-"$GNOME_GAMES"-*frg.tgz
esac

