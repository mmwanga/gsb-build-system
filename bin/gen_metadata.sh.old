#!/bin/bash
# gen_metadata.sh - Generate package meta data.
# Copyright (c) 2005-2007 Darren 'Tadgy' Austin <darren@afterdark.org.uk>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# Changelog:
#	05/06/05	DA	Initial version.
#	12/06/05	DA	Fixed bug with the egrep regex which prevented
#				extracting descriptions which ended in +'s.
#	18/07/05	DA	Updated to create Slackware compliant meta
#				files, including PACKAGES.TXT, FILE_LIST,
#				FILELIST.TXT and CHECKSUMS.md5.  This should
#				allow tools such as swaret to use the frg repos.
#	28/07/05	DA	Fixed a bug where the 'PACKAGE LOCATION' was
#				not being set correctly, causing slapt-get to
#				look in the wrong place for packages.
#				Thanks to cacate0tl for the report.
#	28/07/05	DA	Create compressed versions of PACKAGES.TXT and
#				CHECKSUMS.md5 as well as the uncompressed ones.
#				Requested by malloc for slapt-get support.
#	10/12/07	SK	Updated for GSB.
#	14/12/07	DA	Major updates to structure for GSB.
#

# The sub-directories to process.
SUBDIRS="packages"


# Generate the package's .txt file.
function gen_pkg_txt() {
  # Arguments:		$1 = The sub directory to process.
  # Returns:		 0 = At least one .txt file was created.
  #			 1 = No files were created (everything up to date).

  local RET=1
  for FILE in $( find ./$1 -type f -name \*.tgz )
  do
    METAFILE=${FILE%tgz}txt
    [ ! -e  $METAFILE ] && {
      # No metadata file exists for this package, so its new.
      echo -n "    -> Creating $( basename $METAFILE ) ... "
      SIZES="$( gunzip -l $FILE | tail -n 1 | tr -s ' ' )"
      echo "PACKAGE NAME:  $( echo $FILE | rev | cut -d/ -f1 | rev )" >$METAFILE
      echo "PACKAGE LOCATION:  $( echo $FILE | rev | cut -d/ -f2- | rev )" >>$METAFILE
      echo "PACKAGE SIZE (compressed):  $(( $( echo \"$SIZES\" | cut -d' ' -f2 ) / 1024 )) K" >>$METAFILE
      echo "PACKAGE SIZE (uncompressed):  $(( $( echo \"$SIZES\" | cut -d' ' -f3 ) / 1024 )) K" >>$METAFILE
      echo "PACKAGE REQUIRED:  $( tar zxOf $FILE install/slack-required 2>/dev/null | tr '\n' ',' | sed -e 's/,$//' )" >>$METAFILE
      echo "PACKAGE CONFLICTS:  $( tar zxOf $FILE install/slack-conflicts 2>/dev/null | tr '\n' ',' | sed -e 's/,$//' )" >>$METAFILE
      echo "PACKAGE SUGGESTS:  $( tar zxOf $FILE install/slack-suggests 2>/dev/null | tr '\n' ' ' )" >>$METAFILE
      echo "PACKAGE DESCRIPTION:" >>$METAFILE
      tar xzOf $FILE install/slack-desc 2>/dev/null | grep -v "^#" | egrep "[[:alnum:]\+]+\:" >>$METAFILE
      echo "done."
      RET=0
    }
  done
  return $RET
}

# Generate a PACKAGES.TXT file.
function gen_packages_txt() {
  # Arguments:		$1 = The sub directory to process, or empty.

  echo -n "  -> Generating PACKAGES.TXT ... "
  echo -e "PACKAGES.TXT; $( date )\n\n" >./$1/PACKAGES.TXT
  for FILE in $( find ./$1 -type f -name \*.txt | rev | cut -d/ -f1 | rev | sort -f )
  do
    find ./$1 -type f -name $FILE -exec cat {} \; >>./$1/PACKAGES.TXT
    echo >>./$1/PACKAGES.TXT
  done
  cat ./$1/PACKAGES.TXT | gzip -9c >./$1/PACKAGES.TXT.gz
  echo "done."
}

# Generate the CHECKSUMS.md5 file.
function gen_checksums_md5() {
  # Arguments:		$1 = The sub directory to process, or empty.

  echo -n "  -> Generating CHECKSUMS.md5 ... "
  echo "MD5 message digest                Filename" >./$1/CHECKSUMS.md5
  ( cd ./$1 && find . -type f -exec md5sum {} \; | fgrep -v "./CHECKSUMS.md5" | sort -k 2 ) >>./$1/CHECKSUMS.md5
  cat ./$1/CHECKSUMS.md5 | gzip -9c >./$1/CHECKSUMS.md5.gz
  echo "done."
}

# Generate the FILELIST.TXT file.
function gen_filelist_txt() {
  # Arguments:		$1 = The sub directory to process, or empty.

  echo -n "  -> Generating FILELIST.TXT ... "
  echo -e "$( date )\n\n" >./$1/FILELIST.TXT
  ( cd ./$1 && find . | fgrep -v "./FILELIST.TXT" | sort | xargs ls -ld >>./FILELIST.TXT )
  cat ./$1/FILELIST.TXT | gzip -9c >./$1/FILELIST.TXT.gz
  echo "done."
}


# Sanity check.
for DIR in $SUBDIRS
do
  [ ! -d $DIR ] && {
    echo "${0}: No '$DIR' directory found."
    echo "  This script must be run from the root of the GSB tree - probably /tmp/gsb-tree"
    exit 1
  }
done

# Process sub-directories and sections.
NEWPACKAGES=0
for DIR in $SUBDIRS
do
  echo "$DIR/"
  for SECTION in $( find $DIR -type d -mindepth 1 -maxdepth 1 )
  do
    echo "  -> $( basename $SECTION )/"
    gen_pkg_txt $SECTION && NEWPACKAGES=1 || echo "    -> Up to date."
  done
  [ "$NEWPACKAGES" = "1" ] && {
    rm -f $DIR/CHECKSUMS.md5* $DIR/FILELIST.TXT* $DIR/PACKAGES.TXT*
    gen_packages_txt $DIR
    gen_checksums_md5 $DIR
    gen_filelist_txt $DIR
  } || {
    echo "  -> Up to date."
  }
done

# Top level files.
echo "/"
[ "$NEWPACKAGES" = "1" ] && {
  rm -f CHECKSUMS.md5* FILELIST.TXT* PACKAGES.TXT*
  gen_packages_txt
  gen_checksums_md5
  gen_filelist_txt
} || {
  echo "  -> Up to date."
}

echo
echo "Booyakasha!"
