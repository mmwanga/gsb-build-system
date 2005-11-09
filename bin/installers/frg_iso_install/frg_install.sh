#!/bin/sh
#
# FRG install script
# By default, prompts user for intervention
#
# TODO:
#

CWD=`pwd`
BASE=`dirname $0| sed "s#/.#/#"`

export FRGROOT="$CWD/$BASE"

FRG_VERSION=2.12.1
GNOME_VERSION=2.12.1

# Functions

# HELP FUNCTION
usage() {

printf "
$0 -install <arg> -prompts <arg>

    -i    choose which install to run. min or full
                 -i min  or  -i full

    -p    Option to disable prompting for packages that have
                 multiple types. Default or alternative packages
                 -p default  or  -p alt

    -r    Option to enable or disable the rc.d scripts that are installed with frg
                 -r on  or  -r off

    -h    Display usage info

"
}

# MAIN()

while getopts "i:p:r:h" options
 do
  case $options in
    "i" )
	  INSTALL="$OPTARG"
	  echo "INSTALL VAR: $INSTALL"
	  if [[ "$INSTALL" != "min" && "$INSTALL" != "full" ]]; then
	      echo "$INSTALL is an invalid argument for -i"
	      usage
	      exit 0
	  fi
	  if [ "$INSTALL" = "full" ]; then
	      export FRG_FULL="true"
	  fi
	  ;;
    "p" )
	  export PROMPTS="$OPTARG"
	  export NO_PROMPT="true"
	  echo "PROMPT VAR: $PROMPTS"
	  if [[ "$PROMPTS" != "default" && "$PROMPTS" != "alt" ]]; then
	      echo "$PROMPTS is an invalid argument for -p"
	      usage
	      exit 0
	  fi
	  ;;
    "r" )
	  export RCD="$OPTARG"
	  echo "RCD ENABLE: $RCD"
	  if [[ "$RCD" != "on" && "$RCD" != "off" ]]; then
	      echo "$RCD is an invalid argument for -r"
	      usage
	      exit 0
	  fi
	  ;;
    "h" )
	  usage
	  exit 0
	  ;;
    ? )
          usage
	  exit 0
	  ;;
    * )
	  usage
	  exit 0
	  ;;
  esac
done
shift $(($OPTIND -1))


printf "
********************************************************************************

Installing Freerock GNOME $FRG_VERSION

Featuring GNOME $GNOME_VERSION

"

# Select which type of install to run
if [[ "$INSTALL" != "min" && "$INSTALL" != "full" ]]; then

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
	    export FRG_FULL="true"
	    sh $FRGROOT/install_scripts/frg_full_install.sh
	    ;;
	*)
	    echo "Invalid Selection, aborting"
	    usage
	    exit 0
    esac
else 
    if [ $INSTALL = "min" ]; then
	sh $FRGROOT/install_scripts/frg_min_install.sh
    elif [ $INSTALL = "full" ]; then
	sh $FRGROOT/install_scripts/frg_full_install.sh
    else
	echo "Argument to -i: $INSTALL is not a valid install type"
	exit 0
    fi
fi


printf "
********************************************************************************

Installation of Freerock GNOME $FRG_VERSION Complete

Enjoy GNOME $GNOME_VERSION

"
