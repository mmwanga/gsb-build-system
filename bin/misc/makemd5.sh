#!/bin/sh
rm CHECKSUMS.md5; find . -name '*.tgz' -exec md5sum {} >> CHECKSUMS.MD5 \;
