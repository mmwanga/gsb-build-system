# Clean up previous softlinks
if [ -r usr/lib/xulrunner ]; then
  rm -rf usr/lib/xulrunner ;
fi;

# Make our softlink
if [ -d usr/lib/xulrunner-@VERSION@ ]; then
  (cd usr/lib ; ln -s xulrunner-@VERSION@ xulrunner );
fi;

# Clean up previous softlinks on x86_64 platforms
if [ -r usr/lib64/xulrunner ]; then
  rm -rf usr/lib64/xulrunner ;
fi ;

if [ -d usr/lib64/xulrunner-@VERSION@ ]; then
  (cd usr/lib64 ; ln -s xulrunner-@VERSION@ xulrunner );
fi;
