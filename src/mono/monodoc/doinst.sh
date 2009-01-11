# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

# Generate mono documentation index
if [ -x usr/bin/monodoc ]; then
  echo "Generating document index..."
  chroot . usr/bin/monodoc --make-index 1> /dev/null 2> /dev/null
  #chroot . usr/bin/monodoc --make-search-index 1> /dev/null 2> /dev/null
fi;
