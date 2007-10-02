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
MIRROR="ftp.gnome.org/pub/gnome/sources"
VERSION=`grep VERSION\:- $SLACKBUILD | cut -f2 -d\- | cut -f1 -d\}`
MAINVERSION=`echo $VERSION | cut -f1,2 -d.`

wget -c ftp://$MIRROR/$PACKAGENAME/$MAINVERSION/$PACKAGENAME-$VERSION.tar.bz2
wget -c ftp://$MIRROR/$PACKAGENAME/$MAINVERSION/$PACKAGENAME-$VERSION.md5sum

cat $PACKAGENAME-$VERSION.md5sum | grep bz2 | md5sum -c -
if [ $? -ne 0 ]; then
	echo "WARNNIG: md5 failed."
fi;
