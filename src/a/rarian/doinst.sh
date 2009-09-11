# Version: 1.0 - Do not remove this line!

# Update new libraries
ldconfig -r .

if [ -x usr/bin/rarian-sk-rebuild ]; then
  chroot . usr/bin/rarian-sk-update -p /var/lib/rarian --clean-index >/dev/null 2>&1
fi
