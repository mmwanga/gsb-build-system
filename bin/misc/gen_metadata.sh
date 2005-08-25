#!/bin/bash
# gen_metadata.sh - Generate package meta data.
# Copyright (c) 2005 Darren 'Tadgy' Austin <darren@afterdark.org.uk>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
#

# If you have a package mirror site, specifying it here will result in the
# location being included in package metadata.
# DL_URL=http://your_remove_pkg_host.tld/packages/

# The extension to give the package meta files.
# Personally, I prefer the Slackware standard 'txt' extension, but change to
# 'meta' for the original FRG name convention.  --DA.
METAEXT="txt"

# The sub-directories to process.
SUBDIRS="extras frgnome patches testing"

# Generate package metadata.
function gen_pkg_meta() {
	# Arguments:	$1 = The sub directory to process.
	# Returns:	 0 = At least one metadata file was created.
	#		 1 = No files were created (everything up to date).

	RET=1
	for FILE in `find ./$1 -type f -name \*.tgz`
	do
		METAFILE=${FILE%tgz}$METAEXT
		if [ ! -e  $METAFILE ]
		then
			echo -n "${IND}Creating $METAFILE ... "
			# No metadata file exists for this package, so its new.
			echo "PACKAGE NAME:  `echo $FILE | rev | cut -d/ -f1 | rev`" >$METAFILE
			if [ -n "$DL_URL" ]
			then
				echo "PACKAGE MIRROR:  $DL_URL" >>$METAFILE
			fi
			echo "PACKAGE LOCATION:  `echo $FILE | rev | cut -d/ -f2- | rev`" >>$METAFILE
			SIZES="`gunzip -l $FILE | tail -1 | tr -s ' '`"
			echo "PACKAGE SIZE (compressed):  $(( `echo \"$SIZES\" | cut -d' ' -f2` / 1024 )) K" >>$METAFILE
			echo "PACKAGE SIZE (uncompressed):  $(( `echo \"$SIZES\" | cut -d' ' -f3` / 1024 )) K" >>$METAFILE
			echo "PACKAGE REQUIRED:  `tar zxOf $FILE install/slack-required 2>/dev/null | tr '\n' ',' | sed -e 's/,$//'`" >>$METAFILE
			echo "PACKAGE CONFLICTS:  `tar zxOf $FILE install/slack-conflicts 2>/dev/null | tr '\n' ',' | sed -e 's/,$//'`" >>$METAFILE
			echo "PACKAGE SUGGESTS:  `tar zxOf $FILE install/slack-suggests 2>/dev/null | tr '\n' ' ' `" >>$METAFILE
			echo "PACKAGE DESCRIPTION:" >>$METAFILE
			tar xzOf $FILE install/slack-desc 2>/dev/null | grep -v "^#" | egrep "[[:alnum:]\+]+\:" >>$METAFILE
			echo "Done."
			RET=0
		fi
	done
	return $RET
}

# Generate the PACKAGES.TXT file.
function gen_packages_txt() {
	# Arguments:	$1 = The sub directory to process.

	echo -n "${IND}Generating PACKAGES.TXT ... "
	echo -e "PACKAGES.TXT; `date`\n\n" >./$1/PACKAGES.TXT
	for FILE in `find ./$1 -type f -name \*.$METAEXT | rev | cut -d/ -f1 | rev | sort -f`
	do
		find ./$1 -type f -name $FILE -exec cat {} \; >>./$1/PACKAGES.TXT
		echo >>./$1/PACKAGES.TXT
	done
	cat ./$1/PACKAGES.TXT | gzip -9c >./$1/PACKAGES.TXT.gz
	echo "Done."
}

# Generate the FILE_LIST file.
function gen_file_list() {
	# Arguments:	$1 = The sub directory to process.

	echo -n "${IND}Generating FILE_LIST ... "
	echo -e "`date`\n\n" >./$1/FILE_LIST
	( cd ./$1 && find . | sort | xargs ls -ld >>./FILE_LIST )
	echo "Done."
}

# Generate the CHECKSUMS.md5 file.
function gen_checksums_md5() {
	# Arguments:	$1 = The sub directory to process.

	echo -n "${IND}Generating CHECKSUMS.md5 ... "
	echo "MD5 message digest                Filename" >./$1/CHECKSUMS.md5
	( cd ./$1 && find . -type f -name \*.tgz -exec md5sum {} \; >>./CHECKSUMS.md5 )
	cat ./$1/CHECKSUMS.md5 | gzip -9c >./$1/CHECKSUMS.md5.gz
	echo "Done."
}

# Generate the top level FILELIST.TXT file.
function gen_filelist_txt() {
	echo -n "${IND}Generating FILELIST.TXT ... "
	echo -e "`date`\n\n" >./FILELIST.TXT
	find . | sort | xargs ls -ld >>./FILELIST.TXT
	echo "Done."
}


for DIR in $SUBDIRS
do
	echo "Processing $DIR/"
	IND='  '

	# Create any required package matadata files in the sub-directory.
	gen_pkg_meta "$DIR"

	# Update the PACKAGES.TXT, FILE_LIST and CHECKSUMS.md5 in the
	# sub-directory only if any new metadata files were created.
	if [ $? = 0 ]
	then
		gen_packages_txt "$DIR"
		gen_file_list "$DIR"
		gen_checksums_md5 "$DIR"
		REGEN=1
	else
		echo "${IND}Nothing to update."
	fi
done

if [ "$REGEN" = "1" ]
then
	IND=''

	# Create the top level PACKAGES.TXT.
	gen_packages_txt

	# Create the top level FILELIST.TXT
	gen_filelist_txt

	# Update the top level CHECKSUMS.md5.
	gen_checksums_md5
fi

