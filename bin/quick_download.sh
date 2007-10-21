## (fidesratio)
## 
## Quick Script to Grab the source tarballs
## so I can test build scripts
## 
## ** NOT MEANT TO BE USED IN PRODUCTION
## FOR TESTING ONLY
##

SLACKBUILD=`ls ./*.SlackBuild`
PACKAGENAME=`basename $SLACKBUILD .SlackBuild`

MIRROR=$(grep ^$PACKAGENAME\, /home/stevek/devel/gsb/trunk/notes/gnome-2.20 | cut -d\, -f2)

if [ "$MIRROR" = "" ]; then
	MIRROR="ftp.gnome.org/pub/gnome/sources"
	VERSION=`grep VERSION= $SLACKBUILD | cut -f2 -d\=`
	MAINVERSION=`echo $VERSION | cut -f1,2 -d.`
	wget -c ftp://$MIRROR/$PACKAGENAME/$MAINVERSION/$PACKAGENAME-$VERSION.tar.bz2
	wget -c ftp://$MIRROR/$PACKAGENAME/$MAINVERSION/$PACKAGENAME-$VERSION.md5sum
	cat $PACKAGENAME-$VERSION.md5sum | grep bz2 | md5sum -c -
	if [ $? -ne 0 ]; then
		echo "WARNNIG: md5 failed."
	fi;
else
	VERSION=$(grep ^$PACKAGENAME\, /home/stevek/devel/gsb/trunk/notes/gnome-2.20 | cut -d\, -f3)
	FORMAT=$(grep ^$PACKAGENAME\, /home/stevek/devel/gsb/trunk/notes/gnome-2.20 | cut -d\, -f4)
	VERIFY=$(grep ^$PACKAGENAME\, /home/stevek/devel/gsb/trunk/notes/gnome-2.20 | cut -d\, -f5)
        echo version:$VERSION format:$FORMAT verify:$VERIFY
	wget -c ${MIRROR}${PACKAGENAME}\-${VERSION}.${FORMAT}
	if [ "$VERIFY" = "md5" ]; then
		wget -c ${MIRROR}${PACKAGENAME}\-${VERSION}.${FORMAT}.md5;
		cat ${PACKAGENAME}-${VERSION}.${FORMAT}.md5 | grep $FORMAT | md5sum -c -
		if [ $? -ne 0 ]; then
			echo "WARNNIG: md5 failed."
		fi;
	fi;	
fi;

