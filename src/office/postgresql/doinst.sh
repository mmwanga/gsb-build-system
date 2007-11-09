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

# If rc.postgresql is executable, run it on startup
run=`grep ". /etc/rc.d/rc.postgresql" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then
cat << EOF >> etc/rc.d/rc.local

# To disable postgresql, chmod rc.postgresql to 644
if [ -x /etc/rc.d/rc.postgresql ]; then
  . /etc/rc.d/rc.postgresql start
fi
EOF
fi

## Our Variables
PG_HOME=/var/lib/pgsql
PG_USER=postgres
PG_USER_ID=26
PG_GROUP=postgres
PG_GROUP_ID=26

groupadd -g $PG_GROUP_ID $PG_GROUP
useradd -g $PG_GROUP -u $PG_USER_ID -d $PG_HOME -c PostgreSQL $PG_USER
mkdir -p $PG_HOME/data

## default permissions
chown -R $PG_USER:$PG_GROUP $PG_HOME
chmod 700 $PG_HOME
chmod 700 $PG_HOME/data

## database cluster
if [ ! -f $PG_HOME/data/PG_VERSION ]; then
    echo "Creating database cluster in $PG_HOME/data..."
    su $PG_USER -c "initdb -D $PG_HOME/data"
else
    echo "*** WARNING ***" >&2
    echo "  There is already a database cluster in $PG_HOME/data." >&2
    echo "  If you are upgrading from an older version of PostgreSQL" >&2
    echo "  you will have to 'dump' and 'restore' your database." >&2
    echo "  See PostgreSQL manual for more details." >&2
fi
