#!/usr/bin/env bash

clear
sleep 1

echo ""
echo "Committing changes..."
echo ""
svn ci web-dev

sleep 1

echo ""
echo "Getting SVN HEAD"
echo ""
svn up web-dev

sleep 1

echo ""
echo "DONE!"
echo ""

