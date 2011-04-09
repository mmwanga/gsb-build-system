#!/bin/bash

# Functions library :: for the GNOME SlackBuild build script
# <http://www.gnomeslackbuild.org>

# echogreen will echo $@ in green color
# $1 = text
echogreen()
{
   echo -ne "[0;32m""$@""[0;39m"
}

error_out()
{
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
  touch $CHANGELOG
  # Stamp changelog if no date previously declared
  if [ -z "$(grep "$(date +"%a %b %_d")" $CHANGELOG )" ]; then
    echo "+--------------------------+" >> $CHANGELOG
    echo "$(date)" >> $CHANGELOG
  fi; 
  echo "$@" 2>/dev/null >> $CHANGELOG
  echogreen "* " ; echo "Updated ChangeLog."

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
    egrep -v "^#|^$" | egrep "[[:alnum:]\+]+\:" | tee ${1%.txz}.txt
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

  echo ;
  rm -fr ${2:-.}/PACKAGES.TXT*
  local TOTAL_SIZE=0
  local TOTAL_USIZE=0
  local COUNT=1
  local PACKAGE_FILES=$( find ./$1 -name \*.txz \( -type f -o -type l \) -printf "%f %p\n" | sort -k1 -f | cut -d' ' -f2 )
  local TOTAL_PACKAGE_FILES=$(echo $PACKAGE_FILES | wc -w )
  echo -ne "\rCreating PACKAGES.TXT for ${1}: $COUNT / $TOTAL_PACKAGE_FILES   "
  for FILE in $PACKAGE_FILES ;
    do
      echo -ne "\rCreating PACKAGES.TXT for ${1}: $COUNT / $TOTAL_PACKAGE_FILES   "
      COUNT=$(expr $COUNT + 1)
      SIZE=$(du -bk $FILE | awk '{print $1}')
      USIZE=$(expr $(cat $FILE | xz -dc | wc -c) / 1024)
      # Keep a running total for our PACKAGES.TXT
      TOTAL_SIZE=$(expr $TOTAL_SIZE + $SIZE )
      TOTAL_USIZE=$(expr $TOTAL_USIZE + $USIZE )
      # Grab package information
      rm -fr $TMP/install 
      tar -C $TMP -xf $FILE install || exit 1
      (echo "PACKAGE NAME:  $( echo $FILE | rev | cut -d/ -f1 | rev )" ; 
       echo "PACKAGE LOCATION:  $( echo $FILE | rev | cut -d/ -f2- | rev )" ; 
       echo "PACKAGE SIZE (compressed):  $SIZE K" ; 
       echo "PACKAGE SIZE (uncompressed):  $USIZE K" ; 
       echo "PACKAGE REQUIRED:  $( if [ -f $TMP/install/slack-required ]; then \
          cat $TMP/install/slack-required | tr '\n' ',' | sed -e 's/,$//' ; fi)" ;
	  echo "PACKAGE CONFLICTS:  $( if [ -f $TMP/install/slack-conflicts ]; then \
	  cat $TMP/install/slack-conflicts | tr '\n' ',' | sed -e 's/,$//' ; fi)" ;
	  echo "PACKAGE SUGGESTS:  $( if [ -f $TMP/install/slack-suggests ]; then \ 
	  cat $TMP/install/slack-suggests | tr '\n' ' ' ; fi )" ;
       echo "PACKAGE DESCRIPTION:" ;
       cat $TMP/install/slack-desc | grep -v "^#" | egrep "[[:alnum:]\+]+\:" ;
       echo) >>${2:-.}/PACKAGES.TXT.$$ 2>/dev/null
    done
    echo -e "\rCreating PACKAGES.TXT for ${1}: done.                   "

    # Create a PACKAGES.TXT header with totals.
    {
    echo 
    echo "PACKAGES.TXT;  $( date )"
    echo
    echo "This file provides details on the GNOME SlackBuild packages found"
    echo "in the ./$(basename $1)/ directory."
    echo
    echo "Total size of all packages (compressed):  $(expr $TOTAL_SIZE / 1024) MB"
    echo "Total size of all packages (uncompressed):  $(expr $TOTAL_USIZE / 1024) MB"
    echo
    echo
    } >${2:-.}/PACKAGES.TXT 2>/dev/null
    cat ${2:-.}/PACKAGES.TXT.$$ >> ${2:-.}/PACKAGES.TXT 2>/dev/null
    rm -fr ${2:-.}/PACKAGES.TXT.$$
}

# Generate a FILELIST.TXT for a package tree
function make_filelist_txt() {
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put FILELIST.TXT in, or empty for current directory
  # $3 = Different file name for FILELIST.TXT if desired, defaults to FILELIST.TXT
  # $4 = if $4 = "1", then at time stamp is made. 
  [ -z "$1" ] && return 1
  local FILELIST=${3:-FILELIST.TXT}
  local DATED=${4:-0}
  echo -n "Creating $FILELIST for $(basename ${1}): "

  rm -fr ${2:-.}/${FILELIST}*
  { ( cd $1
  if [ "$DATED" = "1" ]; then
    echo "$( date )"
  fi;
    echo ;
    echo "Here is the file list for this directory.  If you are using a"
    echo "mirror site and find missing or extra files in the disk"
    echo "subdirectories, please have the archive administrator refresh"
    echo "the mirror."
    echo ""
    find . ! -wholename ./FILELIST.TXT ! -wholename ./FILELIST.TXT.gz \
      ! -wholename ./CHECKSUMS.md5 ! -wholename ./CHECKSUMS.md5.gz | \
      sort | xargs ls -ld )} >${2:-.}/$FILELIST 2>/dev/null

  echo "done."
}

function make_checksums_md5() {
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put CHECKSUMS.md5 in, or empty for current directory
  [ -z "$1" ] && return 1
  echo -n "Creating CHECKSUMS.md5 for $(basename ${1}): "
  rm -fr ${2:-.}/CHECKSUMS.md5*

  # Our header
  cat <<EOT > ${2:-.}/CHECKSUMS.md5
If you want to test your files, use 'md5sum' and compare the values to
the ones listed here.

To test all these files, use this command:

md5sum -c CHECKSUMS.md5 | less

'md5sum' can be found in the GNU coreutils package on ftp.gnu.org in
/pub/gnu, or at any GNU mirror site.

MD5 message digest                Filename
EOT

  # Make checkums
  ( cd $1 
    find . ! -wholename ./CHECKSUMS.md5 ! -wholename ./CHECKSUMS.md5.gz \
      \( -type f -o -type l \) -exec md5sum {} \; | \
      sort -k2 -f ) >>${2:-.}/CHECKSUMS.md5 2>/dev/null
  echo "done."
  echo "Please sign $(basename $1)/CHECKSUMS.md5: "; echo
  gpg -b -a ${2:-.}/CHECKSUMS.md5 || exit 1
}

function make_manifest() {
  # This handy little piece is from http://www.inreto.de/slacker/, (c) tp(at)fonz.de.
  # We use it to produce the MANIFEST.bz2 file in imitation of Slackware.
  # $1 = Sub-directory to process [required]
  # $2 = Sub-directory to put MANIFEST.bz2 in, or empty for current directory

  [ -z "$1" ] && return 1

  echo -n "Creating MANIFEST.bz2 for ${1}: "
  rm -fr ${2:-.}/MANIFEST.bz2*
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
  if [ -s $manifest ] ; then
    bzip2 -c $manifest > ${2:-.}/MANIFEST.bz2 ;
  fi;
  rm -f $manifest ;
  echo "done."
}

function download_package() {
  # $1 is the $PKG name to download
  [ -z "$1" ] && return 1;
  [ ! -f ./$1.info ] && {
    echo "* Error: Can't find $1.info." ; return 1
  }
  # Read in package info file, quit if not found.
  . ./$1.info || return 1
  # Skip the package if no DOWNLOAD is present in the .info file.
  if [ -z "$DOWNLOAD" ] ; then
	  header "* Skipping the download of $1." 
	  return 0 
  fi;
  # Check for source file.
  i=0
  for CURRENT in ${DOWNLOAD};
  do
     FILENAME[i]="$(echo ${CURRENT} | awk -F/ '{print $NF}')"
     i=`expr 1 + $i`
  done
  [ -z $FILENAME ] && {
     echo "* Error: No source file defined in $1.info file." ; return 1
  }
  i=0
  for CURRENT in ${MD5SUM}
  do
     MD5SUMS[i]=${CURRENT}
     i=`expr 1 + $i`
  done
  i=0
  until [ $i -eq ${#MD5SUMS} ];
  do
     echo "${MD5SUMS[i]}  ${FILENAME[i]}" >> $TMP/md5sum.$1.$$
     i=`expr 1 + $i`
  done 
  local DOWNLOAD_ATTEMPT=0
  local VALID_MD5=0
  until [ $DOWNLOAD_ATTEMPT -eq 3 -o $VALID_MD5 -eq 1 ]; do
    # MD5SUM Comparison
    if [ -f $FILENAME ]; then
       md5sum -c $TMP/md5sum.$1.$$ 2>/dev/null 1>/dev/null && VALID_MD5=1;
    fi;
    if [ "${VALID_MD5}" = "0" ]; then
       # Download the source file
       wget ${WGET_OPTIONS} -c $DOWNLOAD || {
         echo ; echo "* Error: Failed to complete download."
         return 1
       }
    fi
    DOWNLOAD_ATTEMPT=$[$DOWNLOAD_ATTEMPT+1];
  done;
  rm $TMP/md5sum.$1.$$
  # We couldn't get a decent copy of the source file
  if [ "$VALID_MD5" = "0" ]; then
     header "* WARNING: $FILENAME has invalid md5sum!"
     return 1;
  else 
     echo "* $FILENAME has valid md5sum."
     return 0
  fi;
} 

# Usage function
function usage() {
  cat << EOF
Usage: ${0##*/} [options]

Options:
  --help		Show this help screen.

  --list		List the packages which will be built in this section.

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

  --publish      	Create the package's .txt and .asc meta files, and
                        create the FILELIST, CHECKSUMS, and MANIFEST, as well
                        as export the SlackBuild source into a publishable
                        tree. You will need to create a valid GPG-KEY. 

  --with-testing      	Normally the build script will remove all packages
                        found in the testing/ directory in order to prevent
		        unwanted dependencies, and skip building any 
			testing/ packages..  Use this switch to prevent the
                        build script from removing these packages, as well
			as building the testing/ packages.

  --confirm-installs   	Wait for an enter press before installing any packages.

  --download      	As the build progresses, fetch tarballs that aren't
                        found in the src/ tree.

  --download-only      	Fetch tarballs that aren't found in the src/ tree, 
                        but don't run a build.  This option is exclusive.

  --set=<set>      	Specifiy a particular set to build, like a,ap,d,c, 
                        etc. This option can be used in coordination with 
			--download-only to download only a selection of 
			packages.

  --package=<pkgname> 	Specifiy a particular package to build. This option
                        can also be used with the --download or 
			--download-only options to build a specific package.

  --skip-rebuilds      	Do not rebuild packages when asked to do so in the
    			buildlist.txt.

  Options are passed down to the next level SlackBuild where appropriate.
EOF
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
    fi
  fi
}

# Export source through svn to directory
export_source() {
  # $1 is svn source directory
  # $2 is exported destination
  [ -z "$1" -o -z "$2" ] && return 1;
  local EXPORTDEST=$2
  echo -n "Exporting source for "; echogreen "$(basename $EXPORTDEST)" ; echo -n ": " ;
  mkdir -p $EXPORTDEST || return 1

  if [ -x /usr/bin/rsync ]; then
    rsync -C -r $1/ $EXPORTDEST/source/ || {
    echo ; echo "* Error: Failed to export source."
    return 1
    }
    echo "Done export."

    # Clean up the export a bit
    find $EXPORTDEST/source \( -name ".buildlist" \
         -o -name ".setlist" \
         -o -name ".ignore" \
         -o -name "tagfile" \
         -o -name "rebuild.list" \
         -o -name "*.info" \) \
         -exec rm -rf {} \; || return 1
  else
     echo "You need rsync in order to export the source."
     return 1
  fi;

  make_filelist_txt $EXPORTDEST/source $EXPORTDEST/source "FILE_LIST" &&
  make_checksums_md5 $EXPORTDEST/source $EXPORTDEST/source || return 1
}
