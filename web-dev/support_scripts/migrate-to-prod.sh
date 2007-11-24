#!/usr/bin/env bash

# syncs staging site to prod.

rsync -trPv --delete --exclude=.svn ./web-dev \
    $HOME/webs/gnomeslackbuild.org/
