#!/usr/bin/env bash

# $Id$

clear

echo "removing existing thumbs ..."
echo ""
cd ./screenies
for i in $( ls thumb-* ); do
    rm -f $i
    echo "      deleted '$i'"
done
sleep 1

echo ""
echo "generating thumbnails from regular images (this may take a minute) ..."
echo ""

for i in $( ls *.png ); do
    echo "      Generating 'thumb-$i'"
    convert -geometry 100x100 $i thumb-$i
done

echo ""
echo "Adding screenshots and thumbnails into SVN"
svn --quiet add *.png

echo ""
echo "DONE!"
echo ""
echo ""

exit
