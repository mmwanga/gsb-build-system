#/bin/sh
#
# Prompt to install packages that have multiple versions
#
# $Id$

FRGROOT=`dirname $0`

TOTEMVERSION=1.0.1

# Install LIBRSVG
printf "*********************************

Select which librsvg to install 1 or 2\n"

echo "
1) librsvg 2.9.5
2) librsvg 2.10.0 (unreleased)
"

printf "Selection: "
read librsvg_selection
echo ""

case "$librsvg_selection" in
'1')
	upgradepkg --install-new $FRGROOT/frg/dups/librsvg-2.9.5-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/frg/testing/librsvg-2.10.0-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable librsvg"
	upgradepkg --install-new $FRGROOT/frg/dups/librsvg-2.9.5-*frg.tgz
esac


# Install GNOME-MENUS
printf "*********************************

Select which gnome-menus to install 1 or 2\n"

echo "
1) gnome-menu 2.10.0
2) gnome-menu 2.10.0 (patched to work with unstable gnome-menu-editor)
"

printf "Selection: "
read gm_selection
echo ""

case "$gm_selection" in
'1')
	upgradepkg --install-new $FRGROOT/frg/dups/gnome-menus-2.10.0-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/frg/testing/gnome-menus-2.10.0p-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable gnome-menus"
	upgradepkg --install-new $FRGROOT/frg/dups/gnome-menus-2.10.0-*frg.tgz
esac


# Install TOTEM
printf "*********************************

Select which Totem to install 0, 1, 2 or 3\n"

echo "
1) Totem $TOTEMVERSION with gstreamer backend
2) Totem $TOTEMVERSION with xine backend
3) Totem cvs 1.1.0 with gstreamer backend
"

printf "Selection: "
read totem_selection
echo ""

case "$totem_selection" in
'1')
	upgradepkg --install-new $FRGROOT/frg/dups/totem-"$TOTEMVERSION"-*.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/frg/alternatives/totem-"$TOTEMVERSION"xine-*frg.tgz
	;;
'3')
	upgradepkg --install-new $FRGROOT/frg/testing/totem-1.1.0cvs-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable Totem with gstreamer backend"
	upgradepkg --install-new $FRGROOT/frg/dups/totem-"$TOTEMVERSION"-*.tgz
esac

# Install GNOME GAMES
printf "*********************************

Select which gnome-games to install\n"

echo "
0) Do not install gnome-games
1) gnome-games 2.10.0
2) gnome-games 2.10.0 (binaries are setgid games)
"

printf "Selection: "
read games_selection
echo ""

case "$games_selection" in
'0')
	echo "Gnome Games not installed"
	;;
'1')
	upgradepkg --install-new $FRGROOT/frg/dups/gnome-games-2.10.0-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/frg/alternatives/gnome-games-2.10.0sgid-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing default gnome-games"
	upgradepkg --install-new $FRGROOT/frg/dups/gnome-games-2.10.0-*frg.tgz
esac
