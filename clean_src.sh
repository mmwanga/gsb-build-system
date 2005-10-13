#!/bin/sh

NOARCH="
gnome-audio
gnome-extra-themes
intltool
isocodes
"

for i in gnome office other
do
  find ./src/$i -name "*.SlackBuild" -exec perl -pi -e 's#^(BUILD=[0-9]*).*#$1#g' {} \;
  find ./src/$i -name "*.SlackBuild" |grep -v gnome-audio | grep -v gnome-extra-themes | grep -v intltool | grep -v iso-codes | xargs -n 1 perl -pi -e 's#^ARCH=.*$#ARCH\=\$\{ARCH\:-i486\}#g'
done



