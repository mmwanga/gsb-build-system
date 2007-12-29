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
#	29/12/07	DA	Don't create package .txt files - this is now
#				done by the section SB's.  Re worked creating
#				other meta files too.
#

# The sub-directories to process.
SUBDIRS="packages"


# Generate a PACKAGES.TXT file.
function gen_packages_txt() {
  # $1 = The sub directory to process, or empty for current.

  echo -n "  -> Generating PACKAGES.TXT ... "
  ( cd ${1:-.}/
    echo -e "PACKAGES.TXT; $( date )\n\n" >>PACKAGES.TXT
    for FILE in $( find . -type f -name \*.tgz -printf "%f %p\n" | \
      sort -k1 -f | cut -d' ' -f2 )
    do
      SIZES="$( gunzip -l $FILE | tail -n 1 | tr -s ' ' )"
      echo "PACKAGE NAME:  $( echo $FILE | rev | cut -d/ -f1 | rev )" >>PACKAGES.TXT
      echo "PACKAGE LOCATION:  $( echo $FILE | rev | cut -d/ -f2- | rev )" >>PACKAGES.TXT
      echo "PACKAGE SIZE (compressed):  $(( $( echo \"$SIZES\" | cut -d' ' -f2 ) / 1024 )) K" >>PACKAGES.TXT
      echo "PACKAGE SIZE (uncompressed):  $(( $( echo \"$SIZES\" | cut -d' ' -f3 ) / 1024 )) K" >>PACKAGES.TXT
      echo "PACKAGE REQUIRED:  $( tar zxOf $FILE install/slack-required 2>/dev/null | tr '\n' ',' | sed -e 's/,$//' )" >>PACKAGES.TXT
      echo "PACKAGE CONFLICTS:  $( tar zxOf $FILE install/slack-conflicts 2>/dev/null | tr '\n' ',' | sed -e 's/,$//' )" >>PACKAGES.TXT
      echo "PACKAGE SUGGESTS:  $( tar zxOf $FILE install/slack-suggests 2>/dev/null | tr '\n' ' ' )" >>PACKAGES.TXT
      echo "PACKAGE DESCRIPTION:" >>PACKAGES.TXT
      tar xzOf $FILE install/slack-desc 2>/dev/null | grep -v "^#" | egrep "[[:alnum:]\+]+\:" >>PACKAGES.TXT
      echo >>PACKAGES.TXT
    done
    cat PACKAGES.TXT | gzip -9c >PACKAGES.TXT.gz
  )
  echo "done."
}

# Generate the CHECKSUMS.md5 file.
function gen_checksums_md5() {
  # $1 = The sub directory to process, or empty for current.

  echo -n "  -> Generating CHECKSUMS.md5 ... "
  ( cd ${1:-.}/
    echo "MD5                               Filename" >CHECKSUMS.md5
    find . -type f ! -name \*.md5 -exec md5sum {} \; | sort -k2 -f >>CHECKSUMS.md5
    cat CHECKSUMS.md5 | gzip -9c >CHECKSUMS.md5.gz
  )
  echo "done."
}

# Generate the FILELIST.TXT file.
function gen_filelist_txt() {
  # $1 = The sub directory to process, or empty for current.

  local OUTFILE=${1:-.}/FILELIST.TXT

  echo -n "  -> Generating FILELIST.TXT ... "
  ( cd ${1:-.}/
    echo -e "$( date )\n\n" >FILELIST.TXT
    find . ! -name FILELIST.TXT | sort | xargs ls -ld >>FILELIST.TXT
    cat FILELIST.TXT | gzip -9c >FILELIST.TXT.gz
  )
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
for DIR in $SUBDIRS
do
  echo "$( pwd )/$DIR"
  rm -f $DIR/CHECKSUMS.md5* $DIR/FILELIST.TXT* $DIR/PACKAGES.TXT*
  gen_packages_txt $DIR
  gen_checksums_md5 $DIR
  gen_filelist_txt $DIR
done

# Top level files.
echo "$( pwd )"
rm -f CHECKSUMS.md5* FILELIST.TXT* PACKAGES.TXT*
gen_packages_txt
gen_checksums_md5
gen_filelist_txt

echo
echo "Booyakasha!"
