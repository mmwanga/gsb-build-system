if [ -x usr/bin/rarian-sk-rebuild ]; then
	echo -n "Creating rarian database..."
	usr/bin/rarian-sk-rebuild -q -p var/lib/rarian
	echo "done."
fi;

if [ -x usr/bin/rarian-sk-update ]; then
	usr/bin/rarian-sk-update -p var/lib/rarian 1> /dev/null 2> /dev/null
fi
