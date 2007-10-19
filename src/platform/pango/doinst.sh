## Create modules list in etc/pango
if [ -x usr/bin/pango-queryloaders ]; then
   usr/bin/pango-queryloaders > etc/pango/pango.modules;
fi;
