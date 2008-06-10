# Version: 1.0 - Do not remove this line!

# FIXME: Tadgy: Not sure why this is included in here.
for dir in engines filesystems loaders
do
  libtool --finish --silent usr/lib*/gtk*/*/$dir
done

# Update new libraries
ldconfig -r .
