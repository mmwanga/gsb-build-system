function install_file() {
  # $1 = File to process

  FILE="$(dirname "$1")/$(basename "$1" .new)"
  if [ ! -e "$FILE" ]
  then
    mv "$FILE.new" "$FILE"
  elif [ "$(cat "$FILE" | md5sum)" != "$(cat "$FILE.new" | md5sum)" ]
  then
    #     |--------|--------------------------------------------------|
    echo "WARNING: $FILE has been customised."
    echo "         Examine the $FILE.new file"
    echo "         and integrate any changes into the custom file."
    echo
  else
    rm -f "$FILE.new"
  fi
}

install_file etc/rc.d/rc.postgresql.new
install_file etc/logrotate.d/postgresql.new

# Remove old postgres user+group.
# Somewhere in a previous install, this user/group could have been created
# with a U/GID of 26.  We want it at 28.
if grep "^postgres:[^:]*:26:" etc/passwd >/dev/null 2>&1; then
  cat etc/passwd >etc/passwd.gsb
  cat etc/passwd.gsb | grep -v "^postgres:[^:]*:26:" >etc/passwd
  if [ $? -ne 0 ]; then
    # Don't leave etc/password in an unknown state.
    cat etc/passwd.gsb >etc/passwd
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old postgres user."
  fi
  rm etc/passwd.gsb
fi
if grep "^postgres:[^:]*:26:" etc/group >/dev/null 2>&1; then
  cat etc/group >etc/group.gsb
  cat etc/group.gsb | grep -v "^postgres:[^:]*:26:" >etc/group
  if [ $? -ne 0 ]; then
    # Don't leave etc/group in an unknown state.
    cat etc/group.gsb >etc/group
    #     |--------|--------------------------------------------------|
    echo "WARNING: Failed to remove old postgres group."
  fi
  rm -f etc/group.gsb
fi

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
