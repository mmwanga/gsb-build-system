#!/bin/sh
 
# Copyright (c) 2007-2011 Steve Kennedy <steve (at) gnomeslackbuild.org>
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This expects to find a file libnotify-*.txz in the local directory that
# will contain a usable libnotify-0.5.2 shared library to satify the runtime
# requirements for a number of Slackware packages expecting to find the earlier
# versions of libnotify.

if ! ls libnotify-*-*-*.txz 1> /dev/null 2> /dev/null ; then
  echo "No Slackware libnotify txz package found."
  exit 1
fi

# Automatically determine the architecture we're building on:
if [ -z "$ARCH" ]; then
  case "$( uname -m )" in
    i?86) export ARCH=i486 ;;
    # Unless $ARCH is already set, use uname -m for all other archs:
       *) export ARCH=$( uname -m ) ;;
  esac
fi

PKGNAM=libnotify-solibs
VERSION=${VERSION:-$(echo libnotify-*-${ARCH}-*.txz | cut -f 2 -d -)}
ARCH=${ARCH:-$(echo libnotify-*-${ARCH}-*.txz | cut -f 3 -d -)}
BUILD=${BUILD:-$(echo libnotify-*-${ARCH}-*.txz | cut -f 4 -d - | cut -f 1 -d .)}
TAG=${TAG:-gsb}

if [ "$ARCH" = "x86_64" ]; then
  LIBDIRSUFFIX="64"
fi

CWD=$(pwd)
TMP=${TMP:-/tmp}
PKG=$TMP/package-$PKGNAM
rm -rf $PKG
mkdir -p $TMP $PKG

cd $PKG
mkdir tmp
( cd tmp
  explodepkg $CWD/libnotify-$VERSION-$ARCH-$BUILD.txz
  sh install/doinst.sh
)
mkdir -p $PKG/usr/lib${LIBDIRSUFFIX}
cp -a tmp/usr/lib${LIBDIRSUFFIX}/libnotify.so.* $PKG/usr/lib${LIBDIRSUFFIX}
rm -rf $PKG/tmp

mkdir -p $PKG/install
cat << EOF > $PKG/install/slack-desc
# HOW TO EDIT THIS FILE:
# The "handy ruler" below makes it easier to edit a package description.  Line
# up the first '|' above the ':' following the base package name, and the '|'
# on the right side marks the last column you can put a character in.  You must
# make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':'.

                |-----handy-ruler--------------------------------------------------|
libnotify-solibs: libnotify-solibs (notification runtime library)
libnotify-solibs: 
libnotify-solibs: This package contains older runtime libraries for notifications.
libnotify-solibs:
libnotify-solibs: Homepage: http://www.galago-project.org/news/index.php
libnotify-solibs:
libnotify-solibs:
libnotify-solibs:
libnotify-solibs:
libnotify-solibs:
libnotify-solibs:
EOF

cd $PKG
/sbin/makepkg -l y -c n $TMP/$PKGNAM-$VERSION-$ARCH-$BUILD$TAG.txz
