#!/usr/bin/env bash

#  legacy - do not use.

USER=chipster_c

rsync -e ssh -trPv --delete --exclude=.svn/ --exclude=update_web.sh . \
    $USER@shell.sf.net:/home/groups/g/gs/gsb/htdocs

