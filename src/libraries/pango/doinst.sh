# Version: 1.0 - Do not remove this line!
# Example doinst.sh for GSB.
# Remove/edit any parts that are not required for each package.

# Update new libraries
ldconfig -r .

# Make sure to create modules list 
chroot . usr/bin/pango-querymodules > etc/pango/pango.modules