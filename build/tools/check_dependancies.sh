#!/bin/bash
# Version: 1.0 check_dependancies.sh - Do not remove this line!
# Copyright (c) 2007, 2008:
#   Darren 'Tadgy' Austin <darren (at) gnomeslackbuild.org>, Coventry, UK.
# Licenced under the terms of the GNU General Public Licence version 3.
#
# This is a quick^H^H^H^Hslow assed dirty script to check binaries and 
# libraries for missing dependancies using ldd.  Only bins/libs with missing
# deps will be written to stderr (which you should probably redirect to a
# file when running this).  It will take quite a while on a full system.
#

echo "This will take a while..."

{ find $(mount -t ext2,ext3,reiserfs,jfs,xfs | awk '{printf "%s ", $3}') -type f -xdev | \
  egrep -iv "^/boot|^/etc|^/home|^/media|^/mnt|^/root|^/srv|^/tmp|^/usr/X11.*|^/usr/adm|^/usr/dict|^/usr/doc|^/usr/etc|^/usr/include|^/usr/info|^/usr/man|^/usr/share|^/usr/spool|^/usr/src|^/usr/tmp|^/usr/lib/firefox.*|^/usr/lib/java|^/usr/lib/jdk.*|^/usr/lib/jre.*|^/usr/lib/locale|^/usr/lib/mozilla|^/usr/lib/seamonkey.*|^/usr/lib/thunderbird.*|^/usr/local/doc|^/usr/local/etc|^/usr/local/include|^/usr/local/info|^/usr/local/man|^/usr/local/share|^/usr/local/src|^/var" | \
  xargs -r file | egrep ".*ELF.*(executable|shared object)" | cut -d: -f1 | \
  xargs -r ldd 2>/dev/null | egrep "^/|not found" | \
  egrep -B 1 "^[[:space:]]" | grep -v -- "--" ; } >&2
