#!/usr/bin/env bash

# $Id:$

clear

echo "removing existing thumbs ..."
echo ""
cd ./screenies
rm -rf thumb*
sleep 1

echo ""
echo "generating thumbnails from regular images (this may take a minute) ..."
echo ""

for i in $( ls *.png ); do
    echo "      Generating thumb-$i"
    convert -geometry 100x100 $i thumb-$i
done

echo ""
echo "DONE!"
echo ""
echo ""

exit
