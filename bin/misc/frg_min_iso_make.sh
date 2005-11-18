#!/bin/sh

FRG=2.12.1

ISO_NAME="frg-min-${FRG}.iso"

FRG_ROOT=/home/storage/pub/frg/

/usr/bin/mkisofs \
    -R -J -o ${ISO_NAME} \
    -V "FRG ${FRG} Minimum" \
    -A "Freerock GNOME ${FRG}" \
    -x $FRG_ROOT/frg-$FRG/frgnome/bindings \
    -x $FRG_ROOT/frg-$FRG/extras/office \
    -x $FRG_ROOT/frg-$FRG/extras/other \
    -x $FRG_ROOT/frg-$FRG/extras/mono \
    -x $FRG_ROOT/frg-$FRG/testing \
    -x $FRG_ROOT/frg-$FRG/extras/themes \
    -x $FRG_ROOT/frg-$FRG/pasture \
    -x $FRG_ROOT/frg-$FRG/patches \
    -x $FRG_ROOT/frg-$FRG/install_scripts/frg_full_dups_install.sh \
    -x $FRG_ROOT/frg-$FRG/install_scripts/frg_full_install.sh \
    -m $FRG_ROOT/frg-$FRG/extras/alternatives/'sylpheed*' \
    -m $FRG_ROOT/frg-$FRG/extras/alternatives/'gimp*' \
    $FRG_ROOT/frg-$FRG/


/usr/bin/md5sum \
    ${ISO_NAME} > \
    ${ISO_NAME}.md5
