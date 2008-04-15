#!/bin/sh
# Add evo-openldap to ld.so.conf
if grep "evo-openldap" etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/usr/libexec/evo-openldap/lib" >> etc/ld.so.conf
fi

ldconfig -r .
