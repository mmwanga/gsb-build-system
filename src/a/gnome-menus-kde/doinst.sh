# link oxygen icons for gnome
( cd usr/share/icons/gnome/16x16/apps ; ln -fs /usr/share/icons/oxygen/16x16/apps/kde.png )
( cd usr/share/icons/Tango/16x16/apps ; ln -fs /usr/share/icons/oxygen/16x16/apps/kde.png )
( cd usr/share/icons/hicolor/16x16/apps ; ln -fs /usr/share/icons/oxygen/16x16/apps/kde.png )
( cd usr/share/icons/gnome/16x16/apps ; ln -fs /usr/share/icons/oxygen/16x16/apps/akonadi.png )
( cd usr/share/icons/gnome/16x16/apps ; ln -fs /usr/share/icons/oxygen/16x16/apps/krdc.png )
( cd usr/share/icons/gnome/16x16/apps ; ln -fs /usr/share/icons/oxygen/16x16/apps/utilities-file-archiver.png )
( cd usr/share/icons/gnome/16x16/actions ; ln -fs /usr/share/icons/oxygen/16x16/actions/trash-empty.png )
( cd usr/share/icons/gnome/22x22/apps ; ln -fs /usr/share/icons/oxygen/22x22/apps/kde.png )
( cd usr/share/icons/Tango/22x22/apps ; ln -fs /usr/share/icons/oxygen/22x22/apps/kde.png )
( cd usr/share/icons/hicolor/22x22/apps ; ln -fs /usr/share/icons/oxygen/22x22/apps/kde.png )
( cd usr/share/icons/gnome/22x22/apps ; ln -fs /usr/share/icons/oxygen/22x22/apps/akonadi.png )
( cd usr/share/icons/gnome/22x22/apps ; ln -fs /usr/share/icons/oxygen/22x22/apps/krdc.png )
( cd usr/share/icons/gnome/22x22/apps ; ln -fs /usr/share/icons/oxygen/22x22/apps/utilities-file-archiver.png )
( cd usr/share/icons/gnome/22x22/actions ; ln -fs /usr/share/icons/oxygen/22x22/actions/trash-empty.png )
( cd usr/share/icons/gnome/32x32/apps ; ln -fs /usr/share/icons/oxygen/32x32/apps/kde.png )
( cd usr/share/icons/Tango/32x32/apps ; ln -fs /usr/share/icons/oxygen/32x32/apps/kde.png )
( cd usr/share/icons/hicolor/32x32/apps ; ln -fs /usr/share/icons/oxygen/32x32/apps/kde.png )
( cd usr/share/icons/gnome/32x32/apps ; ln -fs /usr/share/icons/oxygen/32x32/apps/akonadi.png )
( cd usr/share/icons/gnome/32x32/apps ; ln -fs /usr/share/icons/oxygen/32x32/apps/krdc.png )
( cd usr/share/icons/gnome/32x32/apps ; ln -fs /usr/share/icons/oxygen/32x32/apps/utilities-file-archiver.png )
( cd usr/share/icons/gnome/32x32/actions ; ln -fs /usr/share/icons/oxygen/32x32/actions/trash-empty.png )
mkdir -p usr/share/icons/{gnome,Tango}/48x48/{apps,actions} ;
( cd usr/share/icons/gnome/48x48/apps ; ln -fs /usr/share/icons/oxygen/48x48/apps/kde.png )
( cd usr/share/icons/Tango/48x48/apps ; ln -fs /usr/share/icons/oxygen/48x48/apps/kde.png )
( cd usr/share/icons/hicolor/48x48/apps ; ln -fs /usr/share/icons/oxygen/48x48/apps/kde.png )
( cd usr/share/icons/gnome/48x48/apps ; ln -fs /usr/share/icons/oxygen/48x48/apps/akonadi.png )
( cd usr/share/icons/gnome/48x48/apps ; ln -fs /usr/share/icons/oxygen/48x48/apps/krdc.png )
( cd usr/share/icons/gnome/48x48/apps ; ln -fs /usr/share/icons/oxygen/48x48/apps/utilities-file-archiver.png )
( cd usr/share/icons/gnome/48x48/actions ; ln -fs /usr/share/icons/oxygen/48x48/actions/trash-empty.png )
mkdir -p usr/share/icons/{gnome,Tango}/64x64/{apps,actions} ;
( cd usr/share/icons/gnome/64x64/apps ; ln -fs /usr/share/icons/oxygen/64x64/apps/kde.png )
( cd usr/share/icons/Tango/64x64/apps ; ln -fs /usr/share/icons/oxygen/64x64/apps/kde.png )
( cd usr/share/icons/hicolor/64x64/apps ; ln -fs /usr/share/icons/oxygen/64x64/apps/kde.png )
( cd usr/share/icons/gnome/64x64/apps ; ln -fs /usr/share/icons/oxygen/64x64/apps/akonadi.png )
( cd usr/share/icons/gnome/64x64/apps ; ln -fs /usr/share/icons/oxygen/64x64/apps/krdc.png )
( cd usr/share/icons/gnome/64x64/apps ; ln -fs /usr/share/icons/oxygen/64x64/apps/utilities-file-archiver.png )
( cd usr/share/icons/gnome/64x64/actions ; ln -fs /usr/share/icons/oxygen/64x64/actions/trash-empty.png )
mkdir -p usr/share/icons/{gnome,Tango}/128x128/{apps,actions} ;
( cd usr/share/icons/gnome/128x128/apps ; ln -fs /usr/share/icons/oxygen/128x128/apps/kde.png )
( cd usr/share/icons/Tango/128x128/apps ; ln -fs /usr/share/icons/oxygen/128x128/apps/kde.png )
( cd usr/share/icons/hicolor/128x128/apps ; ln -fs /usr/share/icons/oxygen/128x128/apps/kde.png )
( cd usr/share/icons/gnome/128x128/apps ; ln -fs /usr/share/icons/oxygen/128x128/apps/akonadi.png )
( cd usr/share/icons/gnome/128x128/apps ; ln -fs /usr/share/icons/oxygen/128x128/apps/krdc.png )
( cd usr/share/icons/gnome/128x128/apps ; ln -fs /usr/share/icons/oxygen/128x128/apps/utilities-file-archiver.png )
( cd usr/share/icons/gnome/128x128/actions ; ln -fs /usr/share/icons/oxygen/128x128/actions/trash-empty.png )

# Update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# icon cache update
for i in gnome hicolor Tango
do
  if [ -e usr/share/icons/$i/icon-theme.cache ]; then
    rm -f usr/share/icons/$i/icon-theme.cache
  fi
  usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i 1>/dev/null 2>/dev/null
done
