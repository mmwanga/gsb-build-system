#!/bin/bash
# replaced_slackpacks.sh - Generate a list of Slackware packages replaced by
#			   Freerock GNOME packages.
# Copyright (c) 2006 Darren 'Tadgy' Austin <darren@afterdark.org.uk>
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

# Edit accordingly.
FRG_DIR=/home/storage/pub/frg/frg-current
SLACK_DIR=/home/storage/pub/slackware/ftp.slackware.com/slackware/slackware-10.2/slackware

rm -f /tmp/frgpacks /tmp/slackpacks

for FILE in `find $FRG_DIR -type f -name \*.tgz`
do
	basename "$FILE" | rev | cut -d- -f4- | rev >>/tmp/frgpacks
done
for FILE in `find $SLACK_DIR -type f -name \*.tgz`
do
	basename "$FILE" | rev | cut -d- -f4- | rev >>/tmp/slackpacks
done

IFS=$'\n'
for PACK in `cat /tmp/frgpacks`
do
	grep "^${PACK}$" /tmp/slackpacks
done
