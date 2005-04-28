#!/bin/sh

FRG=0.2.0
GNOME=2.10.0

ISO_NAME="frg-min-${FRG}-${GNOME}.iso"

FRG_FTP_ROOT=/home/storage/pub/frg/

/usr/bin/mkisofs \
    -R -J -o ${ISO_NAME} \
    -V "FRG ${FRG} Minimum" \
    -A "Freerock GNOME ${FRG}" \
    -x $FRG_FTP_ROOT/frg-$FRG/bindings \
    -x $FRG_FTP_ROOT/frg-$FRG/office \
    -x $FRG_FTP_ROOT/frg-$FRG/other \
    -x $FRG_FTP_ROOT/frg-$FRG/testing \
    -x $FRG_FTP_ROOT/frg-$FRG/themes \
    -x $FRG_FTP_ROOT/frg-$FRG/updates \
    -x $FRG_FTP_ROOT/frg-$FRG/patches \
    -x $FRG_FTP_ROOT/frg-$FRG/frg_full_dups_install.sh \
    -x $FRG_FTP_ROOT/frg-$FRG/frg_full_install.sh \
    -m $FRG_FTP_ROOT/frg-$FRG/dups/'gnumeric*' \
    -m $FRG_FTP_ROOT/frg-$FRG/dups/'drivel*' \
    -m $FRG_FTP_ROOT/frg-$FRG/dups/'gimp*' \
    -m $FRG_FTP_ROOT/frg-$FRG/alternatives/'drivel*' \
    -m $FRG_FTP_ROOT/frg-$FRG/alternatives/'gimp*' \
    -m $FRG_FTP_ROOT/frg-$FRG/alternatives/'sylpheed*' \
    $FRG_FTP_ROOT/frg-$FRG/


/usr/bin/md5sum \
    ${ISO_NAME} > \
    ${ISO_NAME}.md5
