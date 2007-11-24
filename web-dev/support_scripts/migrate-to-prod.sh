#!/usr/bin/env bash

# syncs staging site to prod.

rsync -trPv --delete --exclude=.svn ./web \
    $HOME/webs/gnomeslackbuild.org/
