## Create modules list in etc/pango
if [ -x usr/bin/pango-querymodules ]; then
   mkdir -p etc/pango
   usr/bin/pango-querymodules > etc/pango/pango.modules;
fi;
