if ! [ -f usr/bin/uuencode ]
then
( cd usr/bin ; rm -rf uuencode )
( cd usr/bin ; ln -sf uuencode-gmime uuencode )
fi

if ! [ -f usr/bin/uudecode ]
then
( cd usr/bin ; rm -rf uudecode )
( cd usr/bin ; ln -sf uudecode-gmime uudecode )
fi

