These are our 'SlackBuild' scripts.  Because the source tarballs for 
GNOME and all its dependencies can take up hundreds of megabytes, we do 
not include them here in our source tree.  In our source/ directory, we 
include our build scripts, and any patches that we might apply to a  
tarball so you see exactly how we build GSB.  If you are interested in 
building GSB from scratch, please take a look at our 'BUILDING.TXT'

To look for a particular bit of source (let's say for 'nautilus'), 
first you would look for the full path:

[stevek@computy:~]$ which nautilus /usr/bin/nautilus

Then, you grep for the package it came from. Note that the leading '/' 
is removed:

[stevek@computy:~]$ grep usr/bin/nautilus /var/log/packages/* 
/var/log/packages/nautilus-2.30.1-i586-1gsb:usr/bin/nautilus 
/var/log/packages/nautilus-2.30.1-i586-1gsb:usr/bin/nautilus-connect-server 
/var/log/packages/nautilus-2.30.1-i586-1gsb:usr/bin/nautilus-autorun-software 
/var/log/packages/nautilus-2.30.1-i586-1gsb:usr/bin/nautilus-file-management-properties 
/var/log/packages/nautilus-cd-burner-2.30.1-i586-1gsb:usr/bin/nautilus-cd-burner 
/var/log/packages/nautilus-sendto-1.1.0-i586-1gsb:usr/bin/nautilus-sendto

From this, you can see that 'nautilus' came from the 
nautilus-2.30.1-i486-1gsb package. The source will be found in a 
corresponding subdirectory.  In this case, that would be 
./desktop/nautilus.

Have fun!

--- The GNOME SlackBuild Team --
