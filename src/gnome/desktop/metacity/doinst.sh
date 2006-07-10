export GCONF_CONFIG_SOURCE=`usr/bin/gconftool-2 --get-default-source`
usr/bin/gconftool-2 --makefile-install-rule etc/gconf/schemas/metacity.schemas > /dev/null 2>&1 
