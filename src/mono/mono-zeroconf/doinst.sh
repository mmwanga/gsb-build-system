if [ -x usr/bin/monodoc ]; then
  echo "Generating monodoc search index."
  chroot . usr/bin/monodoc --make-index > /dev/null
fi
