#!/bin/bash
# gen_metadata.sh - Generate package meta data, PACKAGES.TXT and CHECKSUMS.md5.
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

# If you have a package mirror site, specifying it here will result in the
# location being included in package metadata.
# DL_URL=http://your_remove_pkg_host.tld/packages/

# The extension to give the package meta files.
# Personally, I prefer the Slackware standard 'txt' extension, but change to
# 'meta' for the original FRG name convention.  --DA.
METAEXT="txt"

# Generate package metadata.
function gen_pkg_meta() {
	# Returns:	0 = At least one metadata file was created.
	#		1 = No files were created (everything up to date).

	RET=1
	for FILE in `find . -type f -name \*.tgz`
	do
		METAFILE=${FILE%tgz}$METAEXT
		if [ ! -e  $METAFILE ]
		then
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
			echo "Created $METAFILE"
			RET=0
		fi
	done
	return $RET
}

# Generate the CHECKSUMS.md5 file.
function gen_checksums_md5() {
	echo -n "Generating CHECKSUMS.md5... "
	echo -n >CHECKSUMS.md5
	find . -type f -name \*.tgz -exec md5sum {} \; >>CHECKSUMS.md5
	echo "Done."
}

# Generate the PACKAGES.TXT file.
function gen_packages_txt() {
	echo -n "Generating PACKAGES.TXT... "
	echo -n >PACKAGES.TXT
	for FILE in `find . -type f -name \*.$METAEXT | rev | cut -d/ -f1 | rev | sort -f`
	do
		find . -type f -name $FILE -exec cat {} \; >>PACKAGES.TXT
		echo >>PACKAGES.TXT
	done
	echo "Done."
}


# Check and create (if required) individual package metadata files.
gen_pkg_meta

# Only update CHECKSUMS.md5 and PACKAGES.TXT if some package metadata files
# were created.
if [ $? = 0 ]
then
	gen_checksums_md5
	gen_packages_txt
fi

