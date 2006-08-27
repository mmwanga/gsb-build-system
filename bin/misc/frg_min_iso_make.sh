#!/bin/sh

FRG=2.14.3

ISO_NAME="frg-min-${FRG}.iso"

FRG_ROOT=/home/storage/pub/frg/

/usr/bin/mkisofs \
    -R -J -o ${ISO_NAME} \
    -V "FRG ${FRG} Minimum" \
    -A "Freerock GNOME ${FRG}" \
    -x $FRG_ROOT/frg-$FRG/frgnome/bindings \
    -x $FRG_ROOT/frg-$FRG/extras/office \
    -x $FRG_ROOT/frg-$FRG/extras/applets_extensions \
    -x $FRG_ROOT/frg-$FRG/extras/apps \
    -x $FRG_ROOT/frg-$FRG/extras/gnome-apps \
    -x $FRG_ROOT/frg-$FRG/extras/libs \
    -x $FRG_ROOT/frg-$FRG/extras/mono \
    -x $FRG_ROOT/frg-$FRG/extras/ruby \
    -x $FRG_ROOT/frg-$FRG/testing \
    -x $FRG_ROOT/frg-$FRG/extras/themes \
    -x $FRG_ROOT/frg-$FRG/pasture \
    -x $FRG_ROOT/frg-$FRG/patches \
    -m $FRG_ROOT/frg-$FRG/extras/alternatives/apps \
    $FRG_ROOT/frg-$FRG/


/usr/bin/md5sum \
    ${ISO_NAME} > \
    ${ISO_NAME}.md5
