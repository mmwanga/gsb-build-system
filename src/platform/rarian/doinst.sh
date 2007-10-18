if [ -x usr/bin/rarian-rebuilddb ]; then
	echo -n "Creating rarian database..."
	usr/bin/rarian-rebuilddb -q -p var/lib/rarian
	echo "done."
fi;

if [ -x usr/bin/rarian-update ]; then
	usr/bin/rarian-update -p var/lib/rarian 1> /dev/null 2> /dev/null
fi
