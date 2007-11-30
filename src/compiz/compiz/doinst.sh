if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

echo "(Please wait, installing schemas.  This may take a while.)"
