# Preserve new configuration files
install_file() {
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

install_file etc/rc.d/rc.postgresql.new
install_file etc/logrotate.d/postgresql.new

# If the postgres user/group don't exist, add them
if ! grep "^postgres:" etc/group >/dev/null 2>&1; then
  echo "postgres:x:28:" >>etc/group
fi
if ! grep "^postgres:" etc/gshadow >/dev/null 2>&1; then
  echo "postgres:*::" >>etc/gshadow
fi
if ! grep "^postgres:" etc/passwd >/dev/null 2>&1; then
  echo "postgres:x:28:28:postgres:/var/lib/pgsql:/bin/bash" >>etc/passwd
fi
if grep "^postgres:" etc/shadow >/dev/null 2>&1; then
  echo "postgres:*:9797:0:::::" >>etc/shadow
fi

# If rc.postgresql is executable, run it on startup
run=`grep ". /etc/rc.d/rc.postgresql" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then
cat << EOF >> etc/rc.d/rc.local

# To disable postgresql, chmod rc.postgresql to 644
if [ -x /etc/rc.d/rc.postgresql ]; then
  /etc/rc.d/rc.postgresql start
fi
EOF
fi

mkdir -p var/lib/pgsql/data

## default permissions
chroot . chown -R postgres:postgres /var/lib/pgsql
chmod 700 var/lib/pgsql
chmod 700 var/lib/pgsql/data

## database cluster
if [ ! -f var/lib/pgsql/data/PG_VERSION ]; then
    echo "Creating database cluster in var/lib/pgsql/data..."
    chroot . su postgres -c "initdb -D /var/lib/pgsql/data"
else
    echo "*** WARNING ***" >&2
    echo "  There is already a database cluster in var/lib/pgsql/data." >&2
    echo "  If you are upgrading from an older version of PostgreSQL" >&2
    echo "  you will have to 'dump' and 'restore' your database." >&2
    echo "  See PostgreSQL manual for more details." >&2
fi
