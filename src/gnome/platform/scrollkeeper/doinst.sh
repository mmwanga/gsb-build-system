#!/bin/sh

if [ -x usr/bin/scrollkeeper-rebuilddb ]; then
	echo -n "Creating scrollkeeper database..."
	usr/bin/scrollkeeper-rebuilddb -q -p var/lib/scrollkeeper
	echo "done."
fi;

if [ -x usr/bin/scrollkeeper-update ]; then
	usr/bin/scrollkeeper-update -p var/lib/scrollkeeper 1> /dev/null 2> /dev/null
fi
