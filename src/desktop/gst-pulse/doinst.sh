# Set pulseaudio as default for gstreamer
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /system/gstreamer/0.10/default/audiosink pulsesink 1> /dev/null 2> /dev/null
usr/bin/gconftool-2 --direct --config-source=`usr/bin/gconftool-2 --get-default-source` --type string --set /system/gstreamer/0.10/default/audiosrc pulsesrc 1> /dev/null 2> /dev/null

# Restart gconfd-2 if running to reload new gconf settings
if ps acx | grep -q gconfd-2 ; then
        killall -HUP gconfd-2 ;
fi
