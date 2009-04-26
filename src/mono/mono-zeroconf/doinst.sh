if [ -x usr/bin/monodoc ]; then
  echo "Generating monodoc search index."
  chroot . usr/bin/monodoc --make-index 1> /dev/null 2> /dev/null
fi
