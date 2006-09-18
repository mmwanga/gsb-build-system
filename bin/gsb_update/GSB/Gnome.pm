package GSB::Gnome;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%platform
                    %platform_diff_naming
                    %platform_reqs
                    %desktop
                    %desktop_diff_naming
                    %desktop_other
                    %desktop_nongnome
                    %bindings_cxx
                    %bindings_cxx_other
                    %bindings_java
                    %bindings_python
                    %bindings_python_other
                    %bindings_perl);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

our %platform =
  (
   'at-spi'              => '1.7.11',
   'atk'                 => '1.12.2',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.36',
   'gail'                => '1.9.2',
   'gnome-keyring'       => '0.6.0',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.16.0',
   'gnome-vfs-monikers'  => '2.15.3',
   'intltool'            => '0.35.0',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.16.0',
   'libbonoboui'         => '2.16.0',
   'libglade'            => '2.6.0',
   'libgnome'            => '2.16.0',
   'libgnomecanvas'      => '2.14.0',
   'libgnomecups'        => '0.2.2',
   'libgnomeprint'       => '2.12.1',
   'libgnomeui'          => '2.16.0',
   'libxml2'             => '2.6.26',
   'libxslt'             => '1.1.17',
   'pango'               => '1.14.4',
   'pygobject'           => '2.12.1',
   'pygtk'               => '2.10.1',
   'pyorbit'             => '2.14.1',
  );

our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.14.3',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.14.0',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.12.3',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.10.3',
		'name' => 'gtk+',
	       },
   'libidl' => {
		'ver'  => '0.8.7',
		'name' => 'libIDL',
	       },
  );

# these are packages from freedesktop.org
our %platform_reqs =
  (
   'avahi'               => {
                             'ver' => '0.6.14',
                             'url' => 'http://www.avahi.org/download/',
                             'src' => 'tar.gz',
                            },
   'cairo'               => {
			     'ver' => '1.2.4',
			     'url' => 'http://cairographics.org/releases/',
			     'src' => 'tar.gz',
			    },
   'dbus'                => {
			     'url' => 'http://dbus.freedesktop.org/releases/',
			     'ver' => '0.93',
			     'src' => 'tar.gz',
			    },
   'dbus-glib'           => {
                             'url' => 'http://dbus.freedesktop.org/releases/dbus-glib/',
                             'ver' => '0.71',
                             'src' => 'tar.gz',
                            },
   'dbus-python'         => {
                             'url' => 'http://dbus.freedesktop.org/releases/dbus-python',
                             'ver' => '0.71',
                             'src' => 'tar.gz',
                            },				  
   'desktop-file-utils'  => {
			     'ver' => '0.11',
			     'url' => 'http://freedesktop.org/software/desktop-file-utils/releases/',
			     'src' => 'tar.gz',
			    },
   'gamin'               => {
			     'url' => 'http://www.gnome.org/~veillard/gamin/sources/',
			     'ver' => '0.1.7',
			     'src' => 'tar.gz',
			    },
   'glitz'               => {
			     'ver' => '0.5.6',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'hal'                 => {
			     'url' => 'http://freedesktop.org/~david/dist/',
			     'ver' => '0.5.8',
			     'src' => 'tar.gz',
			    },
   'libdaemon'           => {
                             'ver' => '0.10',
                             'url' => 'http://0pointer.de/lennart/projects/libdaemon/',
                             'src' => 'tar.gz',
                            },
   'libcap'              => {
			     'url' => 'http://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/',
			     'ver' => '1.10',
			     'src' => 'tar.gz',
			    },
   'libgcrypt'           => {
                             'ver' => '1.2.3',
                             'url' => 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/',
                             'src' => 'tar.gz',
                            },
   'libgpg-error'        => {
                             'ver' => '1.3',
                             'url' => 'ftp://ftp.gnupg.org/gcrypt/libgpg-error/',
                             'src' => 'tar.gz',
                            },
   'libpixman'           => {
			     'ver' => '0.1.6',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'libsvg'              => {
                             'ver' => '0.1.4',
                             'url' => 'http://cairographics.org/snapshots/',
                             'src' => 'tar.gz',
                            },
   'libsvg-cairo'        => {
                             'ver' => '0.1.6',
                             'url' => 'http://cairographics.org/snapshots/',
                             'src' => 'tar.gz',
                            },
   'shared-mime-info'    => {
			     'url' => 'http://freedesktop.org/~hadess/',
			     'ver' => '0.18',
			     'src' => 'tar.gz',
			    },
   'hicolor-icon-theme'  => {
			     'url' => 'http://icon-theme.freedesktop.org/releases/',
			     'ver' => '0.9',
			     'src' => 'tar.gz',
			    },
   'pycairo'             => {
                             'ver' => '1.2.2',
                             'url' => 'http://cairographics.org/releases/',
                             'src' => 'tar.gz',
                            },
   'pkg-config'          => {
			     'url' => 'http://pkgconfig.freedesktop.org/releases/',
			     'ver' => '0.21',
			     'src' => 'tar.gz',
			    },
   'Pyrex'               => {
			     'url' => 'http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/',
			     'ver' => '0.9.3.1',
			     'src' => 'tar.gz',
			    },
  );

our %desktop =
  (
   'alacarte'               => '0.10.0',
   'bug-buddy'              => '2.16.0',
   'control-center'         => '2.16.0',
   'dasher'                 => '4.2.0',
   'eel'                    => '2.16.0',
   'ekiga'                  => '2.0.3',
   'eog'                    => '2.16.0.1',
   'epiphany'               => '2.16.0',
   'epiphany-extensions'    => '2.16.0',
   'evince'                 => '0.6.0',
   'evolution'              => '2.8.0',
   'evolution-data-server'  => '1.8.0',
   'evolution-exchange'     => '2.8.0',
   'evolution-webcal'       => '2.8.0',
   'file-roller'            => '2.16.0',
   'gcalctool'              => '5.8.24',
   'gconf-editor'           => '2.16.0',
   'gdm'                    => '2.16.0',
   'gedit'                  => '2.16.0',
   'ggv'                    => '2.12.0',
   'gnome-applets'          => '2.16.0.1',
   'gnome-backgrounds'      => '2.15.92',
   'gnome-bluetooth'        => '0.7.0',
   'gnome-desktop'          => '2.16.0',
   'gnome-doc-utils'        => '0.8.0',
   'gnome-games'            => '2.16.0',
   'gnome-icon-theme'       => '2.16.0.1',
   'gnome-keyring-manager'  => '2.16.0',
   'gnome-mag'              => '0.13.1',
   'gnome-media'            => '2.16.1',
   'gnome-menus'            => '2.16.0',
   'gnome-netstatus'        => '2.12.0',
   'gnome-nettool'          => '2.16.0',
   'gnome-panel'            => '2.16.0',
   'gnome-phone-manager'    => '0.6',
   'gnome-pilot'            => '2.0.14',
   'gnome-pilot-conduits'   => '2.0.14',
   'gnome-screensaver'      => '2.16.0',
   'gnome-session'          => '2.16.0',
   'gnome-speech'           => '0.4.5',
   'gnome-spell'            => '1.0.7',
   'gnome-system-monitor'   => '2.16.0',
   'gnome-system-tools'     => '2.15.4',
   'gnome-terminal'         => '2.16.0',
   'gnome-themes'           => '2.16.0',
   'gnome-user-share'       => '0.9',
   'gnome-utils'            => '2.16.0',
   'gnome-volume-manager'   => '2.15.0',
   'gnome-user-docs'        => '2.16.0',
   'gnopernicus'            => '1.1.2',
   'gob2'                   => '2.0.14',
   'gok'                    => '1.2.0',
   'goobox'                 => '0.9.93',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.8.0',
   'gtkhtml'                => '3.12.0',
   'gtksourceview'          => '1.8.0',
   'gucharmap'              => '1.8.0',
   'libbtctl'               => '0.6.0',
   'libcroco'               => '0.6.1',
   'libgail-gnome'          => '1.1.3',
   'libgnomeprintui'        => '2.12.1',
   'libgsf'                 => '1.14.1',
   'libgtkhtml'             => '2.11.0',
   'libgtop'                => '2.14.4',
   'liboobs'                => '0.4.0',
   'librsvg'                => '2.16.0',
   'libsoup'                => '2.2.96',
   'libwnck'                => '2.16.0',
   'metacity'               => '2.16.1',
   'nautilus'               => '2.16.0',
   'nautilus-cd-burner'     => '2.16.0',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.5',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.16.0',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.9.5.1',
   'totem'                  => '2.16.1',
   'vino'                   => '2.13.5',
   'vte'                    => '0.14.0',
   'yelp'                   => '2.16.0',
   'zenity'                 => '2.16.0',
   );

our %desktop_diff_naming =
  (
   'gal2'  => {
              'ver'  => '2.5.3',
              'name' => 'gal',
              },
   );

our %desktop_nongnome =
  (
   'gnome-mount'  => { 
                      'ver' => '0.4',
                      'url' => 'http://people.freedesktop.org/~david/dist/',
                      'src' => 'tar.gz',
                     },
   'libgnomesu'   => {
		      'ver' => '1.0.0',
		      'url' => 'http://members.chello.nl/~h.lai/libgnomesu/',
		      'src' => 'tar.gz',
		     },
   'xscreensaver' => {
		      'ver' => '5.00',
		      'url' => 'http://www.jwz.org/xscreensaver/',
		      'src' => 'tar.gz',
		     },
   'libxklavier' => {
		      'ver' => '3.0',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gswitchit/',
 		      'src' => 'tar.gz',
		     },
  );

our %bindings_cxx =
  (
   'bakery'            => '2.4.0',
   'gconfmm'           => '2.16.0',
   'glibmm'            => '2.12.0',
   'gnome-vfsmm'       => '2.16.0',
   'gtkmm'             => '2.10.1',
   'libglademm'        => '2.6.3',
   'libgnomecanvasmm'  => '2.16.0',
   'libgnomemm'        => '2.16.0',
   'libgnomeuimm'      => '2.16.0',
   'libsigc++'         => '2.0.17',
   'libxml++'          => '2.14.0',
  );

our %bindings_cxx_other =
  (
   'cairomm' => {
                 'ver' => '1.2.2',
                 'url' => 'http://cairographics.org/releases/',
                 'src' => 'tar.gz',
                },
  );

#    'libgtkhtml-java'  => '2.6.0',
#    'libgtkmozembed-java' => '1.7.0',
#    'libvte-java' => '0.12.1',
our %bindings_java =
  (
   'libgconf-java'    => '2.12.4',
   'libglade-java'    => '2.12.5',
   'libgnome-java'    => '2.12.4',
   'libgtk-java'      => '2.8.5',

  );

our %bindings_python =
  (
   'gnome-python'         => '2.16.0',
   'gnome-python-desktop' => '2.16.0',
   'gnome-python-extras'  => '2.14.2',
   'nautilus-python'      => '0.4.3',
   'pyphany'              => '0.1.4',
  );

our %bindings_python_other =
    (
     'gst-python' => {
	              'ver' => '0.10.5',
		      'url' => 'http://gstreamer.freedesktop.org/src/gst-python/',
		      'src' => 'tar.bz2',
		     },
     'pyxdg'      => {
                      'ver' => '0.15',
		      'url' => 'http://www.freedesktop.org/~lanius/',
		      'src' => 'tar.gz',
		     },
     );


our %bindings_perl =
  (
   'ExtUtils-Depends'    => {
			     'ver' => '0.205',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'ExtUtils-PkgConfig'  => {
			     'ver' => '1.07',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Glib'                => {
			     'ver' => '1.120',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2'              => {
			     'ver' => '1.040',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2-Canvas'       => {
			     'ver' => '1.002',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2-GConf'        => {
			     'ver' => '1.021',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2-VFS'          => {
			     'ver' => '1.060',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gtk2'                => {
			     'ver' => '1.120',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gtk2-GladeXML'       => {
			     'ver' => '1.005',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
  );


#
# End Config Options
################################################################################
