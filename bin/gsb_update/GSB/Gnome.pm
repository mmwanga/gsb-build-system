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
   'at-spi'              => '1.18.0',
   'atk'                 => '1.18.0',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.37',
   'gail'                => '1.18.0',
   'gnome-keyring'       => '0.6.0',
   'gnome-mime-data'     => '2.4.3',
   'gnome-vfs'           => '2.18.0.1',
   'gnome-vfs-monikers'  => '2.15.3',
   'intltool'            => '0.35.5',
   'libart_lgpl'         => '2.3.19',
   'libbonobo'           => '2.18.0',
   'libbonoboui'         => '2.18.0',
   'libglade'            => '2.6.0',
   'libgnome'            => '2.18.0',
   'libgnomecanvas'      => '2.14.0',
   'libgnomecups'        => '0.2.2',
   'libgnomeprint'       => '2.12.1',
   'libgnomeui'          => '2.18.1',
   'libxml2'             => '2.6.27',
   'libxslt'             => '1.1.20',
   'pango'               => '1.16.1',
   'pygobject'           => '2.12.3',
   'pygtk'               => '2.10.4',
   'pyorbit'             => '2.14.2',
  );

our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.14.3',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.16.0',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.12.11',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.10.10',
		'name' => 'gtk+',
	       },
   'libidl' => {
		'ver'  => '0.8.8',
		'name' => 'libIDL',
	       },
  );

# these are packages from freedesktop.org
our %platform_reqs =
  (
   'avahi'               => {
                             'ver' => '0.6.17',
                             'url' => 'http://www.avahi.org/download/',
                             'src' => 'tar.gz',
                            },
   'cairo'               => {
			     'ver' => '1.4.0',
			     'url' => 'http://cairographics.org/releases/',
			     'src' => 'tar.gz',
			    },
   'dbus'                => {
			     'url' => 'http://dbus.freedesktop.org/releases/dbus/',
			     'ver' => '1.0.2',
			     'src' => 'tar.gz',
			    },
   'dbus-glib'           => {
                             'url' => 'http://dbus.freedesktop.org/releases/dbus-glib/',
                             'ver' => '0.73',
                             'src' => 'tar.gz',
                            },
   'dbus-python'         => {
                             'url' => 'http://dbus.freedesktop.org/releases/dbus-python',
                             'ver' => '0.80.2',
                             'src' => 'tar.gz',
                            },				  
   'desktop-file-utils'  => {
			     'ver' => '0.12',
			     'url' => 'http://freedesktop.org/software/desktop-file-utils/releases/',
			     'src' => 'tar.gz',
			    },
   'gamin'               => {
			     'url' => 'http://www.gnome.org/~veillard/gamin/sources/',
			     'ver' => '0.1.8',
			     'src' => 'tar.gz',
			    },
   'glitz'               => {
			     'ver' => '0.5.6',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'hal'                 => {
			     'url' => 'http://freedesktop.org/~david/dist/',
			     'ver' => '0.5.8.1',
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
                             'ver' => '1.2.4',
                             'url' => 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/',
                             'src' => 'tar.gz',
                            },
   'libgpg-error'        => {
                             'ver' => '1.5',
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
			     'ver' => '0.20',
			     'src' => 'tar.bz2',
			    },
   'hicolor-icon-theme'  => {
			     'url' => 'http://icon-theme.freedesktop.org/releases/',
			     'ver' => '0.10',
			     'src' => 'tar.gz',
			    },
   'pycairo'             => {
                             'ver' => '1.4.0',
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
			     'ver' => '0.9.5.1a',
			     'src' => 'tar.gz',
			    },
  );

our %desktop =
  (
   'alacarte'               => '0.11.3',
   'bug-buddy'              => '2.17.4',
   'control-center'         => '2.18.0',
   'dasher'                 => '4.4.0',
   'eel'                    => '2.18.0.1',
   'ekiga'                  => '2.0.7',
   'eog'                    => '2.18.0.1',
   'epiphany'               => '2.18.0',
   'epiphany-extensions'    => '2.18.0',
   'evince'                 => '0.8.0',
   'evolution'              => '2.10.0',
   'evolution-data-server'  => '1.10.0',
   'evolution-exchange'     => '2.10.0',
   'evolution-webcal'       => '2.9.92',
   'file-roller'            => '2.18.0',
   'gcalctool'              => '5.9.14',
   'gconf-editor'           => '2.17.0',
   'gdm'                    => '2.18.0',
   'gedit'                  => '2.18.0',
   'ggv'                    => '2.12.0',
   'gnome-applets'          => '2.18.0',
   'gnome-backgrounds'      => '2.16.2',
   'gnome-bluetooth'        => '0.8.0',
   'gnome-desktop'          => '2.18.0',
   'gnome-doc-utils'        => '0.10.1',
   'gnome-games'            => '2.18.0',
   'gnome-icon-theme'       => '2.18.0',
   'gnome-keyring-manager'  => '2.17.0',
   'gnome-mag'              => '0.14.3',
   'gnome-media'            => '2.18.0',
   'gnome-menus'            => '2.18.0',
   'gnome-netstatus'        => '2.12.1',
   'gnome-nettool'          => '2.17.4',
   'gnome-panel'            => '2.18.0',
   'gnome-phone-manager'    => '0.8',
   'gnome-pilot'            => '2.0.15',
   'gnome-pilot-conduits'   => '2.0.15',
   'gnome-screensaver'      => '2.18.0',
   'gnome-session'          => '2.18.0',
   'gnome-speech'           => '0.4.10',
   'gnome-spell'            => '1.0.7',
   'gnome-system-monitor'   => '2.18.0',
   'gnome-system-tools'     => '2.18.0',
   'gnome-terminal'         => '2.18.0',
   'gnome-themes'           => '2.18.0',
   'gnome-user-share'       => '0.9',
   'gnome-utils'            => '2.18.0',
   'gnome-volume-manager'   => '2.17.0',
   'gnome-user-docs'        => '2.18.0',
   'gnopernicus'            => '1.1.2',
   'gob2'                   => '2.0.14',
   'gok'                    => '1.2.3',
   'goobox'                 => '0.9.93',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.10.0',
   'gtkhtml'                => '3.14.0',
   'gtksourceview'          => '1.8.5',
   'gucharmap'              => '1.10.0',
   'libbtctl'               => '0.8.2',
   'libcroco'               => '0.6.1',
   'libgail-gnome'          => '1.18.0',
   'libgnomeprintui'        => '2.18.0',
   'libgsf'                 => '1.14.2',
   'libgtkhtml'             => '2.11.0',
   'libgtop'                => '2.14.8',
   'liboobs'                => '2.18.0',
   'librsvg'                => '2.16.1',
   'libsoup'                => '2.2.100',
   'libwnck'                => '2.18.0',
   'metacity'               => '2.18.0',
   'nautilus'               => '2.18.0.1',
   'nautilus-cd-burner'     => '2.18.0',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.8',
   'orca'                   => '2.18.0',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.16.3',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.9.90',
   'totem'                  => '2.18.0',
   'vino'                   => '2.18.0',
   'vte'                    => '0.16.0',
   'yelp'                   => '2.18.0',
   'zenity'                 => '2.18.0',
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
                      'ver' => '0.5',
                      'url' => 'http://people.freedesktop.org/~david/dist/',
                      'src' => 'tar.gz',
                     },
   'libgnomesu'   => {
		      'ver' => '1.0.0',
		      'url' => 'http://members.chello.nl/~h.lai/libgnomesu/',
		      'src' => 'tar.gz',
		     },
   'xscreensaver' => {
		      'ver' => '5.01',
		      'url' => 'http://www.jwz.org/xscreensaver/',
		      'src' => 'tar.gz',
		     },
   'libxklavier' => {
		      'ver' => '3.1',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gswitchit/',
 		      'src' => 'tar.gz',
		     },
  );

our %bindings_cxx =
  (
   'bakery'            => '2.4.1',
   'gconfmm'           => '2.18.0',
   'glibmm'            => '2.12.7',
   'gnome-vfsmm'       => '2.18.0',
   'gtkmm'             => '2.10.8',
   'libglademm'        => '2.6.3',
   'libgnomecanvasmm'  => '2.16.0',
   'libgnomemm'        => '2.18.0',
   'libgnomeuimm'      => '2.18.0',
   'libsigc++'         => '2.0.17',
   'libxml++'          => '2.18.0',
  );

our %bindings_cxx_other =
  (
   'cairomm' => {
                 'ver' => '1.2.4',
                 'url' => 'http://cairographics.org/releases/',
                 'src' => 'tar.gz',
                },
  );

#    'libgtkhtml-java'  => '2.6.0',
#    'libgtkmozembed-java' => '1.7.0',
#    'libvte-java' => '0.12.1',
our %bindings_java =
  (
   'glib-java'        => '0.4.2',
   'libgconf-java'    => '2.12.6',
   'libglade-java'    => '2.12.8',
   'libgnome-java'    => '2.12.7',
   'libgtk-java'      => '2.10.2',

  );

our %bindings_python =
  (
   'gnome-python'         => '2.18.0',
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
			     'ver' => '1.144',
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
			     'ver' => '1.040',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2-VFS'          => {
			     'ver' => '1.060',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gtk2'                => {
			     'ver' => '1.144',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gtk2-GladeXML'       => {
			     'ver' => '1.006',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
  );


#
# End Config Options
################################################################################
