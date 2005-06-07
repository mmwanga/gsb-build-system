#/bin/sh
#
# Prompt to install packages that have multiple versions
#
# $Id$

GNUMERIC_VERSION=1.4.3
GNUMERIC_ALT=1.5.0

DRIVEL_VERSION=1.2.4
DRIVEL_ALT=1.3.2

GIMP_VERSION=2.2.6


# Install GNUMERIC

if [ "$NO_PROMPT" != "true" ]; then

    printf "*********************************

Select which Gnumeric (spreadsheet) to install\n"

    echo "
0) Do not install
1) Gnumeric 1.4.3 (stable version)
2) Gnumeric 1.5.0 (unstable version)
"

    printf "Selection: "
    read gnumeric_selection
    echo ""
fi

if [ "$DEFAULT" = "true" ]; then
    gnumeric_selection=1
fi

if [ "$ALT" = "true" ]; then
    gnumeric_selection=2
fi

case "$gnumeric_selection" in
'0')
	echo "Gnumeric Not installed"
	;;
'1')
	upgradepkg --install-new $FRGROOT/extras/office/gnumeric-"$GNUMERIC_VERSION"-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/extras/testing/gnumeric-"$GNUMERIC_ALT"-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable Gnumeric"
	upgradepkg --install-new $FRGROOT/extras/office/gnumeric-"$GNUMERIC_VERSION"-*frg.tgz
esac


# Install Drivel

if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which Drivel (blog client) to install\n"

    echo "
0) Do not install
1) Drivel 1.2.4 (stable version)
2) Drivel 1.3.2 (development version)
"

    printf "Selection: "
    read drivel_selection
    echo ""
fi

if [ "$DEFAULT" = "true" ]; then
    drivel_selection=1
fi

if [ "$ALT" = "true" ]; then
    drivel_selection=2
fi

case "$drivel_selection" in
'0')
	echo "Drivel Not installed"
	;;
'1')
	upgradepkg --install-new $FRGROOT/extras/other/drivel-"$DRIVEL_VERSION"-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/extras/alternatives/drivel-"$DRIVEL_ALT"-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable Drivel"
	upgradepkg --install-new $FRGROOT/extras/other/drivel-"$DRIVEL_VERSION"-*frg.tgz
esac

# Install GIMP

if [ "$NO_PROMPT" != "true" ]; then
    printf "*********************************

Select which GIMP to install\n"

    echo "
0) Do not install
1) GIMP $GIMP_VERSION 
2) GIMP $GIMP_VERSION with pygimp installed
"

    printf "Selection: "
    read gimp_selection
    echo ""
fi

if [ "$DEFAULT" = "true" ]; then
    gimp_selection=1
fi

if [ "$ALT" = "true" ]; then
    gimp_selection=2
fi

case "$gimp_selection" in
'0')
	echo "Gimp Not installed"
	;;
'1')
	upgradepkg --install-new $FRGROOT/extra/other/gimp-"$GIMP_VERSION"-*frg.tgz
	;;
'2')
	upgradepkg --install-new $FRGROOT/extra/alt/gimp-"$GIMP_VERSION"python-*frg.tgz
	;;
*)
	echo "Invalid selection"
	echo "Installing stable GIMP"
	upgradepkg --install-new $FRGROOT/extra/other/gimp-"$GIMP_VERSION"-*frg.tgz
esac

