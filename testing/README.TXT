TESTING! TESTING! TESTING!
--------------------------

The packages in testing/ are designed for preview only.

---

  GNOME 2.31 Shell

GNOME Shell is the defining technology of the GNOME 3 desktop user experience.
It provides core interface functions like switching to windows and launching
applications.  The GNOME Shell is currently in active development and while
many planned features are not yet implemented it is stable enough for everyday
use. A stable version of GNOME Shell will be released as an integral part of
GNOME 3 in September 2010. 

GNOME Shell acts as a compositing manager for the desktop, and displays both
application windows and other objects in a Clutter scene graph. Much of the
code of the shell is written in Javascript but uses Clutter and GNOME platform
libraries via GObject Introspection and JavaScript bindings for GNOME.

---

  Installing GSB GNOME Shell for Slackware 

You will need to install all the packages in the testing/ directory, either by
downloading the packages individually and then installing them using
installpkg, or else by adding the testing/ repository to your
/etc/slapt-get/slapt-getrc.  Make sure to update afters and then install
gnome-shell.  

You will need to have the mozilla-firefox package installed from the official
Slackware repositories.  

You will need to add:

     /usr/lib/firefox

   to your /etc/ld.so.conf and rerun ldconfig.  This is so the gjs and mutter
can find the JavaScript library mozjs in the mozilla-firefox package.

---

Running GNOME Shell

   Because this is still in preview, we are not offering startup scripts for
GNOME Shell yet.  For now, the easiest way to try out gnome-shell is by simply
logging in to your GNOME desktop and running the following from a terminal:

    $ gnome-shell --replace &

   It is of course trivial to work this into the /usr/bin/gnome-wm scripts, or
if users are really gutsy, then can change their gconf settings and set
gnome-shell as their default desktop. You may want to make note of the
following keybindings:

       System (Windows) key: Switch between overview and desktop
       Alt+F1: Switch between overview and desktop
       Alt+F2: Pop up command dialog
       Alt+Tab: Pop up window cycler
       Alt+Shift+Tab: Cycle in reverse direction in the window cycler
       Alt+`: Switch between windows of the same application in Alt+Tab
       Ctrl+Shift+Alt+R: Start and end screencast recording
       Ctrl+Alt+D: Show desktop and raise windows back
       Ctrl+Alt+Right/Left arrow: Switch between workspaces
       Ctrl+Alt+Shift+Right/Left arrow: Move the current window to a different workspace

   You can find fuller details at http://live.gnome.org/GnomeShell/CheatSheet

Good luck!

---
The GNOME SlackBuild Team



