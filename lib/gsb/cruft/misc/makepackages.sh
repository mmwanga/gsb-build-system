#!/bin/sh
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# any later version.
#
# This script generates PACKAGES.TXT and CHECKSUMS for packages,
# which can be used with programs such as slapt-get.

## Where the packages will be placed for download.
#DL_URL=http://your_remove_pkg_host.tld/packages/

function gen_packages_txt {
  echo '' > PACKAGES.TXT
  find . -type f -name '*.meta' -exec cat {} \; >> PACKAGES.TXT
  cat PACKAGES.TXT | gzip -9 -c - > PACKAGES.TXT.gz
 }

function gen_md5_checksums {
  echo '' > CHECKSUMS.md5
  find . -type f -name '*.tgz' -exec md5sum {} \; >> CHECKSUMS.md5
  cat CHECKSUMS.md5 | gzip -9 -c - > CHECKSUMS.md5.gz
}

function gen_meta {
  if [ ! -f $1 ]; then
    echo "File not found: $1"
    exit 1;
  fi
  if [ "`echo $1|grep -E '(.*{1,})\-(.*[\.\-].*[\.\-].*).tgz[ ]{0,}$'`" == "" ]; then
    return;
  fi
    NAME=$(echo $1|sed -re "s/(.*\/)(.*.tgz)$/\2/")
    LOCATION=$(echo $1|sed -re "s/(.*)\/(.*.tgz)$/\1/")
    SIZE=$( expr `gunzip -l $1 |tail -1|awk '{print $1}'` / 1024 )
    USIZE=$( expr `gunzip -l $1 |tail -1|awk '{print $2}'` / 1024 )
    REQUIRED=$(tar xzfO $1 install/slack-required 2>/dev/null|xargs -r -iZ echo -n "Z,"|sed -e "s/,$//")
    CONFLICTS=$(tar xzfO $1 install/slack-conflicts 2>/dev/null|xargs -r -iZ echo -n "Z,"|sed -e "s/,$//")
    SUGGESTS=$(tar xzfO $1 install/slack-suggests 2>/dev/null|xargs -r )
    METAFILE=${NAME%tgz}meta
    echo "PACKAGE NAME:  $NAME" > $LOCATION/$METAFILE
       if [ -n "$DL_URL" ]; then
         echo "PACKAGE MIRROR:  $DL_URL" >> $LOCATION/$METAFILE
       fi
    echo "PACKAGE LOCATION:  $LOCATION" >> $LOCATION/$METAFILE
    echo "PACKAGE SIZE (compressed):  $SIZE K" >> $LOCATION/$METAFILE
    echo "PACKAGE SIZE (uncompressed):  $USIZE K" >> $LOCATION/$METAFILE
    echo "PACKAGE REQUIRED:  $REQUIRED" >> $LOCATION/$METAFILE
    echo "PACKAGE CONFLICTS:  $CONFLICTS" >> $LOCATION/$METAFILE
    echo "PACKAGE SUGGESTS:  $SUGGESTS" >> $LOCATION/$METAFILE
    echo "PACKAGE DESCRIPTION:" >> $LOCATION/$METAFILE
    tar xzfO $1 install/slack-desc |grep -E '\w+\:'|grep -v '^#' >> $LOCATION/$METAFILE
    echo "" >> $LOCATION/$METAFILE
 }

case "$1" in
    pkg)
    if [ -n "$2" ]; then
	    gen_meta $2
    else
	    echo "$0 [pkg [file]|all|new|PACKAGESTXT|MD5]"
    fi
    ;;
    all)
    for pkg in `find . -type f -name '*.tgz' -print`
    do
       gen_meta $pkg
    done
    $0 PACKAGESTXT
    $0 MD5
    ;;
    new)
    for pkg in `find . -type f -name '*.tgz' -print`
    do
    if [ ! -f ${pkg%tgz}meta ]; then
      gen_meta $pkg
    fi
    done
    ;;
    PACKAGESTXT)
    gen_packages_txt
    ;;
    MD5)
    gen_md5_checksums
    ;;
    *)
    echo "$0 [pkg [file]|all|new|PACKAGESTXT|MD5]"
    ;;
esac
