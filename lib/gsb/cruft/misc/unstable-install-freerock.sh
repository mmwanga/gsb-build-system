#!/bin/bash
#
# FreeRock GNOME frg-unstable installer for Slackware Linux
# by Davidson Paulo <davidsonpaulo@gmail.com>
# April 28, 2006
#
# This script is available under GNU GPL license version 2.0
# or newer

# Global variables
STORE="$HOME/bin/tgz/FreeRock_GNOME_2.14/"
MIRROR="http://slackware.rol.ru/frg/frg-unstable/"
LIST="list"

download_files () {
  # Download files and directories list
  wget -c $1 -O $2 || {
    echo "Erro: impossível baixar list de arquivos em $1"
    exit 3
  }

  # Apply a filter on list, leaving files only
  TEXT=`egrep -v '\- *$' $2 | \
       sed -n 's/^<IMG SRC.*<A/<A/;/<HTML>/,/<HR>/!p'`
  echo "$TEXT" > ${2}.files

  # Download files on list
  PREFIX="$1"
  wget -c -i ${2}.files -F --base $PREFIX
  download_directories $1 $2
}

download_directories () {
  # Apply a filter on list, leaving directories only
  DIRS=`egrep '\- *$' $LIST | \
          sed -n 's/^<IMG SRC.*<A/<A/;/Directory/!p' | \
          sed 's/^<A.*\">//;s/\/<.*$/\//'`
  echo "$DIRS" > ${2}.diretorios

  # Create subdirectories and download them
  if [ "$DIRS" ] ; then
    for SUBDIR in `cat ${2}.diretorios` ; do
      if [ ! -d $SUBDIR ] ; then
        mkdir $SUBDIR || {
          echo "Error: could not create directory ${PWD}${SUBDIR}"
          exit 1
        }
      fi
      cd $SUBDIR || {
        echo "Error: could not access directory ${PWD}${SUBDIR}"
        exit 2
      }
      
      URL=${1}${SUBDIR}
      download_files $URL $LIST
      cd ..
    done
  fi
}

check_sums () {
  while read LINE ; do
    PKG=`echo $LINE|awk '{ print $2 }'`
    PKG_NAME=`echo $PKG|rev|cut -d\/ -f1|rev`
    MD5SUM=$(md5sum $PKG|awk '{ print $1, $2 }')
    if [ "$MD5SUM" != "$LINE" ] ; then
      echo "Package $PKG_NAME corrupted. Downloading again..."
      SUFIXO=${PKG#./}
      URL=${MIRROR}${SUFIXO}
      wget $URL -O ${STORE}${SUFIXO}
    fi
  done
}

gnome_install () {
  for PKG in `find -name '*.tgz'` ; do
    PKG_NAME=`echo $PKG|rev|cut -d\/ -f1|rev`
    echo -en "Processing package $PKGNAME\t\t"
    upgradepkg --install-new $PKG &> /dev/null
    if [ $? = 0 ] ; then
      echo "[   OK   ]"
    else
      echo "[ FAILED ]"
    fi
  done

  echo -e "\nPackages installed. Configuring your system...\n"
  echo "Reseting schemas to default values (backgrounding)..."
  for SCHEMA in /etc/gconf/schemas/* ; do
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source`
    gconftool-2 --makefile-install-rule $SCHEMA > /dev/null
    echo -e "\nGConf configuration finished."
  done &

  echo "Creating GdkPixbuf loaders list..."
  gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders

  echo "Registering GTK input method modules..."
  gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
  
  echo "Updating GNOME icons cache..."
  for DIR in `ls -1 /usr/share/icons` ;  do
    if [ -e /usr/share/icons/$DIR/icon-theme.cache ]; then
      rm -f /usr/share/icons/$DIR/icon-theme.cache
    fi
    if [ -d /usr/share/icons/$DIR ]; then
      gtk-update-icon-cache -q --ignore-theme-index /usr/share/icons/$DIR
    fi
  done
  
  echo "Updating MIME types database..."
  update-mime-database /usr/share/mime

  echo "Updating desktop database..."
  update-desktop-database

  echo "Registering GST plugins..."
  gst-register

  if pgrep gconftool-2 > /dev/null ; then
    echo -n "Waiting GConf configuration finish..."
    while pgrep gconftool-2 > /dev/null ; do
      sleep 1
      echo -n "."
    done
  fi
}

# Create directory where packages will be stored
if [ ! -d $STORE ] ; then
  mkdir -p $STORE || {
    echo "Error: could not create directory $STORE."
    exit 1
  }
fi

# Access the directory
cd $STORE || {
  echo "Error: could not access directory $STORE."
  exit 2
}

# Download packages
URL=$MIRROR
LIST="list"
download_files $URL $LIST

# Check packages integrity and download those
# that are corrupted
echo
echo "Checking packages integrity. Please wait..."
echo

cd $STORE

for MD5_LIST in `find -name CHECKSUMS.md5` ; do
  SUBDIR=$(echo $MD5_LIST|rev|cut -d\/ -f2-|rev)
  cd ${STORE}${SUBDIR}
  awk '$2 ~ /^\.\// { print $1, $2 }' CHECKSUMS.md5 | check_sums
done

# Remove unnecessary temporary files used
echo -e "\nRemoving unnecessary temporary files...\n"
find -name 'list*' -exec rm -v {} \;

# Install packages
echo "Starting packages installation..."
su -c gnome_install

# Mensagem de conclusão
echo -e "\nInstallation finished!\n"
echo "Restart X (Ctrl + Alt + Backspace) and test your system"
echo "Bugs, sugestions and critics about this script, send an"
echo "email to Davidson Paulo <davidsonpaulo@gmail.com>"
echo -n "\nEnjoy!"
