#!/bin/sh

USER=freerock

rsync -e ssh -trPv --exclude=.svn/ --exclude=update_web.sh . $USER@shell.sf.net:/home/groups/g/gs/gsb/htdocs
