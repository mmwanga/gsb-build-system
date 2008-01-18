#!/bin/bash
# Copyright (c) 2007 Darren 'Tadgy' Austin <darren (at) gnomeslackbuild.org>
# Licenced under the terms of the GNU General Public Licence version 3.
#
# This script will check the validity of all slack-desc files found under the
# directory in which it is run.  Any slack-desc files which are out of spec
# will be reported (along with the offending error) to stdout.
#
# This script will check that...
#   ... the 'packagename' matches the package name (including case) taken from
#       the package directory the slack-desc was found in.
#   ... every 'packagename:' line has a space between the ':' and the text.
#   ... the first 'packagename:' line contains a long package description in
#       ( ... ) brackets.
#   ... every description line (excluding the 'packagename:' part) is less than
#       71 characters in length.
#   ... the number of lines begining 'packagename:' is exactly 11.
#       

IFS=$'\n'
for SLACK_DESC in $( find . -type f -name slack-desc )
do
  # This will fail if the slack-desc file happenes to be in the current
  # directory.  But, this is just an ugly-hack check, so buggerit :)
  PACKAGE_NAME=$( echo "$SLACK_DESC" | rev | cut -d/ -f2 | rev )

  declare -a ERRORS
  LINENUM=1
  PKGLINES=0

  for LINE in $( cat $SLACK_DESC )
  do
    # Ignore comments, blank lines, etc.
    echo "$LINE" | egrep "^#" >/dev/null 2>&1 && {
      # Line is a comment.
      LINENUM=$(( $LINENUM +1 ))
      continue
    }
    echo "$LINE" | egrep "^$" >/dev/null 2>&1 && {
      # Line is empty.
      LINENUM=$(( $LINENUM +1 ))
      continue
    }
    echo "$LINE" | grep "handy-ruler" >/dev/null 2>&1 && {
      # Line is the "handy-ruler".
      LINENUM=$(( $LINENUM +1 ))
      continue
    }

    # Check that the 'packagename:' part is correct.
    echo "$LINE" | egrep "^${PACKAGE_NAME//+/\+}:" >/dev/null 2>&1 || {
      if echo "$LINE" | egrep -iv "^${PACKAGE_NAME//+/\+}:" >/dev/null 2>&1
      then
        ERRORS[${#ERRORS[*]}]="Line ${LINENUM}: Does not begin '${PACKAGE_NAME}:' and isn't a comment/blank."
        LINENUM=$(( $LINENUM +1 ))
        continue
      else
        ERRORS[${#ERRORS[*]}]="Line ${LINENUM}: Incorrect case used for the '${PACKAGE_NAME}:' at begining of line."
      fi
    }

    # Looks like a description line...
    PKGLINES=$(( $PKGLINES +1 ))
    TEMPLINE="$( echo "$LINE" | cut -d: -f2- )"

    # Skip if the line is empty.
    [ -z "$TEMPLINE" ] && {
      LINENUM=$(( $LINENUM +1 ))
      continue
    }

    # Check for space between 'packagename:' and text.
    [ "${TEMPLINE:0:1}" != " " ] && {
      ERRORS[${#ERRORS[*]}]="Line ${LINENUM}: No space between '${PACKAGE_NAME}:' and text."
    }

    # Check for a long description if this is the first description line.
    [ $PKGLINES -eq 1 ] && {
      echo "$TEMPLINE" | egrep ".*\(.+\)" >/dev/null 2>&1 || {
        ERRORS[${#ERRORS[*]}]="Line ${LINENUM}: First description line does not have a package description in ()'s"
      }
    }

    # Check the length of the line.
    [ ${#TEMPLINE} -gt 72 ] && {
      ERRORS[${#ERRORS[*]}]="Line ${LINENUM}: Description line is greater than 72 characters long."
    }

    LINENUM=$(( $LINENUM +1 ))
  done

  # Check the number of description lines.
  [ $PKGLINES -ne 11 ] && {
    ERRORS[${#ERRORS[*]}]="There are $PKGLINES lines of description - must be exactly 11."
  }

  # Show the errors...
  [ ${#ERRORS[*]} -ne 0 ] && {
    echo "${SLACK_DESC}:"
    echo "${ERRORS[*]}"
    echo
  }

  unset ERRORS
done
