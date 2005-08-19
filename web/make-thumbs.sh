#!/usr/bin/env bash

#$Id:$

HTML_FILE="../common/screenshots_inc.html"

clear

echo "removing existing thumbs ..."
echo ""

cd ./screenies/thumbs
for i in $( ls thumb-* ); do
    rm -f $i
    echo "      deleted '$i'"
done

echo ""
echo "generating thumbnails from regular images (this may take a minute) ..."
echo ""

cd ../
echo "" > $HTML_FILE
for i in $( ls *.png ); do
    PAGE_ENTRY="  <a href=\"/screenies/$i\"><img src=
   \"/screenies/thumbs/thumb-$i\" alt=\"$i\"
    class=\"screenthumb\" title=\"$i\" /></a>
"
    echo "      Generating 'thumb-$i' and adding to HTML page..."
    convert -geometry 150x150 $i thumbs/thumb-$i
    echo "$PAGE_ENTRY" >> $HTML_FILE
done

echo ""
echo "Adding screenshots and thumbnails into SVN"

svn --quiet add thumbs/*.png *.png

echo ""
echo "DONE!"
echo ""
echo ""

exit
