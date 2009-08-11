# Set some defaults for panel applet
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type boolean --set /apps/service-discovery-applet/options/show_notifications true 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type boolean --set /apps/service-discovery-applet/options/show_local_services true 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type boolean --set /apps/service-discovery-applet/services/_daap._tcp true  1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type boolean --set /apps/service-discovery-applet/services/_pulse-server._tcp true 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type boolean --set /apps/service-discovery-applet/services/_smb._tcp true 1> /dev/null 2> /dev/null

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
