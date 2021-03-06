# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# Fix for weird white bar around menus and dock
usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set /apps/compiz/plugins/decoration/allscreens/options/shadow_match "2 \!dock"1> /dev/null 2> /dev/null
# set default plugin list
usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type list --set /apps/compiz/general/allscreens/options/active_plugins --list-type string "[core,workarounds,gnomecompat,dbus,resize,winrules,glib,svg,move,regex,decoration,png]" 1> /dev/null 2> /dev/null

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
