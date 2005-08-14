#!/usr/bin/env bash

# $Id$

clear

echo "removing existing thumbs ..."
echo ""

cd ./screenies/thumbs
for i in $( ls thumb-* ); do
    rm -f $i
    echo "      deleted '$i'"
done
sleep 1

echo ""
echo "generating thumbnails from regular images (this may take a minute) ..."
echo ""

cd ../
for i in $( ls *.png ); do
    echo "      Generating 'thumb-$i'"
    convert -geometry 150x150 $i thumbs/thumb-$i
done

echo ""
echo "Adding screenshots and thumbnails into SVN"

svn --quiet add thumbs/*.png

echo ""
echo "DONE!"
echo ""
echo ""

exit
