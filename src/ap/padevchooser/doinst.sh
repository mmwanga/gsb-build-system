# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Set up devchooser
if [ -x usr/bin/gconftool-2 ]; then
 GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
   --set /apps/padevchooser/no_notify_on_startup true 1> /dev/null 2> /dev/null
 GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
   --set /apps/padevchooser/notify_on_server_discovery true 1> /dev/null 2> /dev/null
 GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
   --set /apps/padevchooser/notify_on_sink_discovery true 1> /dev/null 2> /dev/null
 GCONF_CONFIG_SOURCE="xml::etc/gconf/gconf.xml.defaults" usr/bin/gconftool-2 --direct --type boolean \
   --set /apps/padevchooser/notify_on_source_discovery true 1> /dev/null 2> /dev/null
fi;

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
