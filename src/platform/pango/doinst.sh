## Create modules list in etc/pango
if [ -x usr/bin/pango-querymodules ]; then
   usr/bin/pango-querymodules > etc/pango/pango.modules;
fi;
