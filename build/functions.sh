#!/bin/bash

# Functions library :: for the GNOME SlackBuild build script
# <http://www.gnomeslackbuild.org>

# echogreen will echo $@ in green color
# $1 = text
echogreen()
{
   echo -ne "[0;32m""$@""[0;39m"
}

control_c()
{
  rm -fr /tmp/waiting
  echo 
  echo "* Exiting buildgsb."
  exit $?
}
 
# header
# $1 = text to show
header()
{
   echo "[0;1m""$@""[0;0m"
}

# Send info to changelog
changelog()
{
   CHANGELOG=${CHANGELOG:-/tmp/Changelog.txt}
   echo "$@" 2>/dev/null >> $CHANGELOG
}
# Check for installed package
function check_installed() {
    ls -1 /var/log/packages | grep "^${1}-[^-]*-[^-]*-[^-]*$" >/dev/null 2>&1
    return $?
}

# Make a .txt after a package is built
function make_pkg_txt() {
  # $1 = Package file to process [required].

  [ -z "$1" ] || [ ! -e "$1" ] && return 1
  tar xOf $1 install/slack-desc 2>/dev/null | \
    grep -v "^#" | egrep "[[:alnum:]\+]+\:" >${1%.txz}.txt
  return $?
}

# Make an asc checksum of a package, requires input
function make_pkg_asc() {
  # $1 = Package file to process [required].
  [ -z "$1" ] || [ ! -e "$1" ] && return 1
  ( cd $( dirname $1 ) && gpg -b -a $( basename $1 ) )
  return $?
}

# See if we have a package in our build tree
function find_package_files() {
  # $1 = Directory to look for files in [required]
  # $2 = Package name or regex to match.  An empty string matches all.
  # $3 = Package version or regex to match.  An empty string matches all.
  # $4 = Package architecture or regex to match.  An empty string matches all.
  # $5 = Package build tag or regex to match.  An empty string matches all.
  # $6 = File extension or regex to match.  An empty string means no extension.
  # Note: Remember to escape any regex characters used in fixed strings.
  [ -z "$1" ] || [ ! -d "$1" ] && return 1
  find $1 -maxdepth 1 -mindepth 1 2>/dev/null | \
    egrep "^.*/(${2:-.*})(-${3:-[^-]*})(-${4:-[^-]*})(-${5:-[^-.]*})($6)$" 2>/dev/null
  return $?
}

# Generate a PACKAGES.TXT for a package tree
function make_packages_txt() {
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put PACKAGES.TXT in, or empty for current directory
  [ -z "$1" ] && return 1

  echo -n "Creating PACKAGES.TXT for ${1}: "
  touch /tmp/waiting ; spinning /tmp/waiting &

  { echo -e "PACKAGES.TXT; $( date )\n\n"
    for FILE in $( find ./$1 -name \*.txz \( -type f -o -type l \) \
      -printf "%f %p\n" | sort -k1 -f | cut -d' ' -f2 )
    do
      SIZE=$(du -bk $FILE | awk '{print $1}')
      USIZE=$(expr $(cat $FILE | xz -dc | wc -c) / 1024)
      echo "PACKAGE NAME:  $( echo $FILE | rev | cut -d/ -f1 | rev )"
      echo "PACKAGE LOCATION:  $( echo $FILE | rev | cut -d/ -f2- | rev )"
      echo "PACKAGE SIZE (compressed):  $SIZE K"
      echo "PACKAGE SIZE (uncompressed):  $USIZE K"
      echo "PACKAGE REQUIRED:  $( tar xOf $FILE --occurrence=1 install/slack-required 2>/dev/null | tr '\n' ',' | sed -e 's/,$//' )"
      echo "PACKAGE CONFLICTS:  $( tar xOf $FILE --occurrence=1 install/slack-conflicts 2>/dev/null | tr '\n' ',' | sed -e 's/,$//' )"
      echo "PACKAGE SUGGESTS:  $( tar xOf $FILE --occurrence=1 install/slack-suggests 2>/dev/null | tr '\n' ' ' )"
      echo "PACKAGE DESCRIPTION:"
      tar xOf $FILE --occurrence=1 install/slack-desc 2>/dev/null | grep -v "^#" | egrep "[[:alnum:]\+]+\:"
      echo 
    done } >${2:-.}/PACKAGES.TXT 2>/dev/null
  cat ${2:-.}/PACKAGES.TXT | gzip -9c >${2:-.}/PACKAGES.TXT.gz 2>/dev/null
  rm /tmp/waiting ;
  echo "done."
}

# Generate a FILELIST.TXT for a package tree
function make_filelist_txt() {
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put FILELIST.TXT in, or empty for current directory
  [ -z "$1" ] && return 1
  echo -n "Creating FILELIST.TXT for ${1}: "
  ( cd $1
    echo -e "FILELIST.TXT; $( date )\n\n"
    find . ! -wholename ./FILELIST.TXT ! -wholename ./FILELIST.TXT.gz \
      ! -wholename ./CHECKSUMS.md5 ! -wholename ./CHECKSUMS.md5.gz | \
      sort | xargs ls -ld ) >${2:-.}/FILELIST.TXT 2>/dev/null
  cat ${2:-.}/FILELIST.TXT | gzip -9c >${2:-.}/FILELIST.TXT.gz 2>/dev/null
  echo "done."
}

function make_checksums_md5() {
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put CHECKSUMS.md5 in, or empty for current directory
  [ -z "$1" ] && return 1
  echo -n "Creating CHECKSUMS.md5 for ${1}: "
  ( cd $1
    echo -e "CHECKSUMS.md5; $( date )\n\n"
    echo "MD5                               Filename"
    find . ! -wholename ./CHECKSUMS.md5 ! -wholename ./CHECKSUMS.md5.gz \
      \( -type f -o -type l \) -exec md5sum {} \; | \
      sort -k2 -f ) >${2:-.}/CHECKSUMS.md5 2>/dev/null
  rm -fr ${2:-.}/CHECKSUMS.md5.asc ; 
  echo "done."
  echo "Please sign ${2:-.}/CHECKSUMS.md5: "; echo
  gpg -b -a ${2:-.}/CHECKSUMS.md5
}

function make_manifest() {
  # This handy little piece is from http://www.inreto.de/slacker/, (c) tp(at)fonz.de.
  # We use it to produce the MANIFEST.bz2 file in imitation of Slackware.
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put MANIFEST.bz2 in, or empty for current directory

  [ -z "$1" ] && return 1

  echo -n "Creating MANIFEST.bz2 for ${1}: "
  manifest=.manifest
  rm -f $manifest
  pkglist=($(find ${1} -name \*.txz -type f | sort))
  for x in ${pkglist[*]}; do
      xx=${x#./}
      echo '++========================================' >>$manifest
      echo '||'                                         >>$manifest
      echo "||   Package:  $x"                          >>$manifest
      echo '||'                                         >>$manifest
      echo '++========================================' >>$manifest
      tar tvf $xx 2>/dev/null >>$manifest
  done
  bzip2 -c $manifest > ${2:-.}/MANIFEST.bz2
  rm -f $manifest ;
  echo "done."
}

function download_package() {
  # $1 is package name
  [ -z "$1" ] && return 1;
  [ ! -f ./$1.info ] && {
    echo "* Error: Can't find $1.info." ; return 1
  }
  # Read in package info file
  . ./$1.info || exit 1

  # Our environment
  MD5COUNT=1
  ATTEMPT="3"
  VALID=0

  for SOURCEPACKAGE in $DOWNLOAD ; 
  do
    FILENAME="$(echo $SOURCEPACKAGE | awk -F/ '{print $NF}')"
    [ -z $FILENAME ] && {
       echo "* Error: No file defined in info file." ; exit 1
    }
    # Download if source file missing.
    if [ ! -f $FILENAME ]; then
      echogreen "* "; echo "Downloading source file."
      wget -c $DOWNLOAD || {
        echo ; echo "* Error: Failed to complete download."
        exit 1
      }
    fi;

    # Switch up if more than one md5sum
    if [ "$(echo $MD5SUM | wc -c)" -gt 33 ]; then
      MD5CHECK=$(echo $MD5SUM | cut -f${MD5COUNT} -d" " ) ;
      MD5FILE=$(echo $MD5SUM | cut -f$(expr $MD5COUNT + 1) -d" " ) ;
      [ "${MD5FILE}" = "${FILENAME}" ] || {
        echo "Error: File md5sums out of order."
        exit 1
      }
      MD5COUNT=$(expr $MD5COUNT + 2)
    else
      # There is only one md5sum
      MD5CHECK=${MD5SUM}
    fi; 

    # We'll try three times to download the package file
    while [ $ATTEMPT -ne 0 ]; do
      # md5sum comparison
      [ "$(md5sum ${FILENAME} | cut -f1 -d\ )" = "${MD5CHECK}" ] && {
          # We have a good md5sum check
          echo "$FILENAME has a valid md5sum $MD5CHECK."
          VALID=1 ; break
      }
      # Try to redownload, perhaps a broken source file. 
      wget -c $DOWNLOAD 
      ATTEMPT=$[$ATTEMPT-1]
    done;

    # We couldn't get a decent copy of the source file
    [ "$VALID" = "0" ] && {
      echo ; echo "Couldn't retrieve $1." 
      header "* WARNING: $FILENAME has invalid md5sum!"
      echo "md5sum: $(md5sum ${FILENAME} | cut -f1 -d\ ) against info: $MD5CHECK"
      return 1;
    }
  done;
  return 0
} 

# Usage function
function usage() {
  cat << EOF
Usage: ${0##*/} [options]

Options:
  --help		Show this help screen.

  --list		List the packages which will be built in this section.

  --force		A package will not be built if a package of the same
			name is already installed, or any of the pre-requisite
			packages are not installed.  This option over-rides
			the checks and attempts a build (which will probably
			fail) anyway.

  --no-cleanup		By default, any source, temporary build and package
			directories will be deleted once the package is built.
			This option prevents those files from being removed.

  --no-patchesdir	When rebuilding packages which already exist in the
			main package directory, the default is to put the new
			packages in the patches directory.  Using this option
			completely disables the use of a patches directory.

  --no-skip		During the build process, packages that are up to date
			(ie, the package version and build numbers match the
			coresponding SlackBuild) will not be rebuilt.  This
			option forces packages to be rebuilt regardless of the
			version and build numbers.  This option doesn't affect
			the pre-build checks for installed packages (see the
			--force option).  This option implies --no-patchesdir.

  --no-prune		Normally, when a package is built and copied to the
			destination directory (whether it be the main package 
			directory or the patches directory), any previous
			package(s) of the same name in that directory are
			deleted - it is assumed the new package is to replace
			any which are already present.  This option prevents
			previous packages being deleted, possibly leaving more
			than one package of the same name (but with different
			version or build numbers) laying around.

  --no-metapackages	Do not create the slapt-get meta packages for each of
			the GSB sections, or the general purpose meta packages
			used for installation (eg, gsb-complete, gsb-libs).

  --publish      	Create the package's .txt and .asc meta files, and
                        create the FILELIST, CHECKSUMS, and MANIFEST, as well
                        as export the SlackBuild source into a publishable
                        tree. 

  --set=<set>           Build only a specific set.

  Options are passed down to the next level SlackBuild where appropriate.
EOF
}

# Creates a spinning bar, borrowed from slackpkg.
spinning() {
        local WAITFILE
        local SPININTERVAL
        local COUNT

        if [ "$SPIN" = "" ]; then
                SPIN=( "|" "/" "-" "\\" )
        fi
        COUNT=${#SPIN[@]}

        [ -n "$1" ] && WAITFILE=$1 || WAITFILE=/tmp/waitfile
        [ -n "$2" ] && SPININTERVAL=$2 || SPININTERVAL=0.1

        count=0
        tput civis
        while [ -e $WAITFILE ] ; do
                count=$(( count + 1 ))
                tput sc
                echo -n ${SPIN[$(( count % COUNT ))]}
                tput rc
                sleep $SPININTERVAL
        done
        tput cnorm
}

# This function shamelessly stolen from /sbin/installpkg
pkgbase() {
  PKGEXT=$(echo $1 | rev | cut -f 1 -d . | rev)
  case $PKGEXT in
  'tgz' )
    PKGRETURN=$(basename $1 .tgz)
    ;;
  'tbz' )
    PKGRETURN=$(basename $1 .tbz)
    ;;
  'tlz' )
    PKGRETURN=$(basename $1 .tlz)
    ;;
  'txz' )
    PKGRETURN=$(basename $1 .txz)
    ;;
  *)
    PKGRETURN=$(basename $1)
    ;;
  esac
  echo $PKGRETURN
}

# This function shamelessly stolen from /sbin/installpkg
package_name() {
  STRING=$(pkgbase $1)
  # Check for old style package name with one segment:
  if [ "$(echo $STRING | cut -f 1 -d -)" = "$(echo $STRING | cut -f 2 -d -)" ]; then
    echo $STRING
  else # has more than one dash delimited segment
    # Count number of segments:
    INDEX=1
    while [ ! "$(echo $STRING | cut -f $INDEX -d -)" = "" ]; do
      INDEX=$(expr $INDEX + 1)
    done
    INDEX=$(expr $INDEX - 1) # don't include the null value
    # If we don't have four segments, return the old-style (or out of spec) package name:
    if [ "$INDEX" = "2" -o "$INDEX" = "3" ]; then
      echo $STRING
    else # we have four or more segments, so we'll consider this a new-style name:
      NAME=$(expr $INDEX - 3)
      NAME="$(echo $STRING | cut -f 1-$NAME -d -)"
      echo $NAME
      # cruft for later ;)
      #VER=$(expr $INDEX - 2)
      #VER="$(echo $STRING | cut -f $VER -d -)"
      #ARCH=$(expr $INDEX - 1)
      #ARCH="$(echo $STRING | cut -f $ARCH -d -)"
      #BUILD="$(echo $STRING | cut -f $INDEX -d -)"
    fi
  fi
}

# Export source through svn to directory
export_source() {
  # $1 is svn source directory
  # $2 is exported destination
  [ -z "$1" -o -z "$2" ] && return 1;
  PKGDEST=$2
  # Clean up our destination for stale files
  rm -fr $PKGDEST/source ;
  if [ -x /usr/bin/svn ]; then
    echo -n "Exporting source: "
    svn export --ignore-externals --force $1 $PKGDEST/source 1>/dev/null 2>/dev/null || {
      echo ; echo "* Error: Failed to export source."
      return 1
    }
    # Clean up the export a bit
    find $PKGDEST/source \( -o -name ".buildlist" \
         -o -name ".setlist" \
         -o -name ".ignore" \
         -o -name ".info" \) \
         -maxdepth 2 -exec rm -rf {} \; || exit 1
  else
     echo "You need subversion in order to export the source."
     return 1
  fi;
  echo "done."
  make_filelist_txt $PKGDEST/source $PKGDEST/source &&
  make_checksums_md5 $PKGDEST/source $PKGDEST/source || exit 1
}
