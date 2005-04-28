#!/bin/sh
#
# FRG install script
# By default, prompts user for intervention
#
# TODO:
#   - command line args: --install={min,full} --prompts={default, alternative}

CWD=`pwd`
BASE=`dirname $0`

export FRGROOT="$CWD/$BASE"

echo $FRGROOT

FRG_VERSION=0.2.1
GNOME_VERSION=2.10.1

# Parse command line arguments


# Functions

# HELP FUNCTION
usage() {

printf "
$0 --install=<arg> --prompts=<arg>

    --install    choose which install to run. min or full
                 --install=min or --install=full

    --prompts    Option to disable prompting for packages that have
                 multiple types. Default or alternative packages
                 --prompts=default or --prompts=alt

"
}

# MAIN()

if [ "$HELP" = "true" ]; then
    usage
    exit 0
fi

printf "
********************************************************************************

Installing Freerock GNOME $FRG_VERSION

Featuring GNOME $GNOME_VERSION

"

# Select which type of install to run

if [ "$NO_PROMPT" != "true" ]; then

    printf "
Select which install you would like.

1) Minimal install - Basic packages for a functioning GNOME Desktop
2) Full install    - All Freerock GNOME packages 

"
 
    printf "Selection: "
    read install_type

    case "$install_type" in
	"1")
	    sh $FRGROOT/install_scripts/frg_min_install.sh
	    ;;
	"2")
	    sh $FRGROOT/install_scripts/frg_full_install.sh
	    ;;
	*)
	    echo "Invalid Selection, aborting"
	    exit 0
    esac
fi
