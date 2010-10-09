# Creat usbmux user
useradd -u 233 -g plugdev -d /dev/null -s /bin/false usbmux
chroot . /etc/rc.d/rc.udev reload
