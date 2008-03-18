# Refresh our libraries 
for dir in engines filesystems loaders ;
do
    libtool --finish --silent usr/lib*/gtk*/*/$dir ;
done;
