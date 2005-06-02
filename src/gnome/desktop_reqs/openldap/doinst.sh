config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/rc.d/rc.openldap.new

for i in ldap slapd
do
	config etc/openldap/$i.conf.new
done

for i in corba core cosine inetorgperson java misc nis openldap
do
 	config etc/openldap/schema/$i.schema.new
done

# If the ldap user/group don't exist, add them:
if grep "^ldap:x:" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "ldap:x:80:80:ldap:/var/lib/openldap:" >> etc/passwd
fi
if grep "^ldap::" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "ldap::80:ldap" >> etc/group
fi
if grep "^ldap:" etc/shadow 1> /dev/null 2> /dev/null ; then
  true
else
  echo "ldap:*:9797:0:::::" >> etc/shadow
fi

bin/chown -R ldap.ldap var/lib/openldap etc/openldap

