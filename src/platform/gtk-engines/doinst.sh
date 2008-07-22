# Version: 1.0 - Do not remove this line!

# libtoolize the installation
for dir in engines filesystems loaders
do
  libtool --finish --silent usr/lib*/gtk*/*/$dir
done

# Update new libraries
ldconfig -r .
