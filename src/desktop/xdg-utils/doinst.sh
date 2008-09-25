# Add some reasonable default values for xdg-open to /etc/mailcap,
# since this is where many programs look for this information:

if ! grep -q '# Sample xdg-open entries:' etc/mailcap ; then
  echo "# Sample xdg-open entries:" >> etc/mailcap
  echo >> etc/mailcap
fi
if ! grep -q 'audio/' etc/mailcap ; then
  echo 'audio/*; /usr/bin/xdg-open %s' >> etc/mailcap
  echo >> etc/mailcap
fi
if ! grep -q 'image/' etc/mailcap ; then
  echo 'image/*; /usr/bin/xdg-open %s' >> etc/mailcap
  echo >> etc/mailcap
fi
if ! grep -q 'application/msword' etc/mailcap ; then
  echo 'application/msword; /usr/bin/xdg-open %s' >> etc/mailcap
  echo >> etc/mailcap
fi
if ! grep -q 'application/pdf' etc/mailcap ; then
  echo 'application/pdf; /usr/bin/xdg-open %s' >> etc/mailcap
  echo >> etc/mailcap
fi
if ! grep -q 'application/postscript' etc/mailcap ; then
  echo 'application/postscript ; /usr/bin/xdg-open %s' >> etc/mailcap
  echo >> etc/mailcap
fi
if ! grep -q '#text/html' etc/mailcap ; then
  echo '#text/html; /usr/bin/xdg-open %s ; copiousoutput' >> etc/mailcap
  echo >> etc/mailcap
fi
