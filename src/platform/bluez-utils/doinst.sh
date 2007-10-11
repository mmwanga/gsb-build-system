# Version: 0.1.1
# Example doinst.sh for GSB.
# Remove/edit any parts that are not required for each package.

ldconfig -r .

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

for i in hcid.conf pin rfcomm.conf
do
    install_file etc/bluetooth/$i.new
    done
        
install_file etc/rc.d/rc.bluetooth.new

# if rc.local doesn't exist, create it
if [ ! -e etc/rc.d/rc.local ]; then
        echo "#!/bin/sh" > etc/rc.d/rc.local
        chmod 755 etc/rc.d/rc.local
fi

# if rc.bluetooth executable, run it on startup
run=`grep ". /etc/rc.d/rc.bluetooth" etc/rc.d/rc.local`
if [ "${run}" == "" ]; then
cat << EOF >> etc/rc.d/rc.local

# To disable bluetooth, chmod rc.bluetooth to 644
if [ -x /etc/rc.d/rc.bluetooth ]; then
  . /etc/rc.d/rc.bluetooth start
fi
EOF
fi
