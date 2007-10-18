if [ -x usr/bin/rarian-sk-rebuild ]; then
	echo -n "Updating rarian database..."
	usr/bin/rarian-sk-update -p var/lib/rarian --clean-index
	echo "done."
fi;
