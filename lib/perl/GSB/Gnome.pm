package GSB::Gnome;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%o_platform
                    %o_platform_diff_naming
                    %o_platform_reqs
                    %o_desktop
                    %o_desktop_diff_naming
                    %o_desktop_other
                    %o_desktop_nongnome
                    %o_bindings_cxx
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

our %o_platform =
  (
   'at-spi'              => '1.20.0',
   'atk'                 => '1.20.0',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.38',
   'gail'                => '1.20.0',
   'gnome-keyring'       => '2.20.0',
   'gnome-mime-data'     => '2.18.0',
   'gnome-vfs'           => '2.20.0',
   'gnome-vfs-monikers'  => '2.15.3',
   'intltool'            => '0.36.2',
   'libart_lgpl'         => '2.3.19',
   'libbonobo'           => '2.20.0',
   'libbonoboui'         => '2.20.0',
   'libglade'            => '2.6.2',
   'libgnome'            => '2.20.0',
   'libgnomecanvas'      => '2.20.0',
   'libgnomecups'        => '0.2.2',
   'libgnomeprint'       => '2.18.2',
   'libgnomeui'          => '2.20.0',
   'libxml2'             => '2.6.30',
   'libxslt'             => '1.1.22',
   'pango'               => '1.18.2',
   'pygobject'           => '2.14.0',
   'pygtk'               => '2.12.0',
   'pyorbit'             => '2.14.3',
  );

our %o_platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.14.9',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.20.0',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.14.1',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.12.0',
		'name' => 'gtk+',
	       },
   'libidl' => {
		'ver'  => '0.8.9',
		'name' => 'libIDL',
	       },
  );

# these are packages from freedesktop.org
our %o_platform_reqs =
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
   'icon-naming-utils' => {
	                 'url' => 'http://tango-project.org/releases/',
			 'ver' => '0.8.2',
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
   'XML-Simple'      => {
	                 'url' => 'http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/',
                         'ver' => '2.16',
                         'src' => 'tar.gz',
                        },
  );

our %o_desktop =
  (
   'alacarte'               => '0.11.3',
   'bug-buddy'              => '2.20.1',
   'gnome-control-center'   => '2.20.0.1',
   'dasher'                 => '4.6.0',
   'eel'                    => '2.20.0',
   'ekiga'                  => '2.0.11',
   'eog'                    => '2.20.0',
   'epiphany'               => '2.20.0',
   'epiphany-extensions'    => '2.20.0',
   'evince'                 => '2.20.0',
   'evolution'              => '2.12.0',
   'evolution-data-server'  => '1.12.0',
   'evolution-exchange'     => '2.12.0',
   'evolution-webcal'       => '2.12.0',
   'file-roller'            => '2.20.0',
   'gcalctool'              => '5.20.1',
   'gconf-editor'           => '2.20.0',
   'gdm'                    => '2.20.0',
   'gedit'                  => '2.20.1',
   'ggv'                    => '2.12.0',
   'gnome-applets'          => '2.20.0',
   'gnome-backgrounds'      => '2.20.0',
   'gnome-bluetooth'        => '0.9.1',
   'gnome-desktop'          => '2.20.0',
   'gnome-doc-utils'        => '0.12.0',
   'gnome-games'            => '2.20.0.1',
   'gnome-icon-theme'       => '2.20.0',
   'gnome-keyring-manager'  => '2.20.0',
   'gnome-mag'              => '0.14.10',
   'gnome-media'            => '2.20.1',
   'gnome-menus'            => '2.20.0',
   'gnome-netstatus'        => '2.12.1',
   'gnome-nettool'          => '2.20.0',
   'gnome-panel'            => '2.20.0.1',
   'gnome-phone-manager'    => '0.8',
   'gnome-pilot'            => '2.0.15',
   'gnome-pilot-conduits'   => '2.0.15',
   'gnome-screensaver'      => '2.20.0',
   'gnome-session'          => '2.20.0',
   'gnome-speech'           => '0.4.16',
   'gnome-spell'            => '1.0.7',
   'gnome-system-monitor'   => '2.20.0',
   'gnome-system-tools'     => '2.20.0',
   'gnome-terminal'         => '2.18.2',
   'gnome-themes'           => '2.20.0',
   'gnome-user-share'       => '0.11',
   'gnome-utils'            => '2.20.0.1',
   'gnome-volume-manager'   => '2.17.0',
   'gnome-user-docs'        => '2.20.0',
   'gnopernicus'            => '1.1.2',
   'gob2'                   => '2.0.14',
   'gok'                    => '1.3.4',
   'goobox'                 => '1.9.2',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.12.1',
   'gtkhtml'                => '3.16.0',
   'gtksourceview'          => '2.0.0',
   'gucharmap'              => '1.10.1',
   'libbtctl'               => '0.9.0',
   'libgail-gnome'          => '1.20.0',
   'libgnomekbd'            => '2.20.0',
   'libgnomeprintui'        => '2.18.1',
   'libgtkhtml'             => '2.11.0',
   'libgtop'                => '2.20.0',
   'liboobs'                => '2.20.0',
   'librsvg'                => '2.18.2',
   'libsoup'                => '2.2.101',
   'libwnck'                => '2.20.0',
   'libxklavier'            => '3.2',
   'metacity'               => '2.20.0',
   'nautilus'               => '2.20.0',
   'nautilus-cd-burner'     => '2.20.0',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.12',
   'orca'                   => '2.18.0',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.20.0',
   'startup-notification'   => '0.9',
   'system-tools-backends'  => '2.4.1',
   'totem'                  => '2.20.0',
   'vino'                   => '2.20.0',
   'vte'                    => '0.16.9',
   'yelp'                   => '2.20.0',
   'zenity'                 => '2.20.0',
   );

our %o_desktop_diff_naming =
  (
   'gal2'  => {
              'ver'  => '2.5.3',
              'name' => 'gal',
              },
   );

our %o_desktop_nongnome =
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
  );

our %o_bindings_cxx =
  (
   'bakery'            => '2.4.2',
   'gconfmm'           => '2.20.0',
   'glibmm'            => '2.14.1',
   'gnome-vfsmm'       => '2.20.0',
   'gtkmm'             => '2.12.1',
   'libglademm'        => '2.6.5',
   'libgnomecanvasmm'  => '2.20.0',
   'libgnomemm'        => '2.20.0',
   'libgnomeuimm'      => '2.20.0',
   'libxml++'          => '2.20.0',
  );

our %o_bindings_cxx_other =
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
our %o_bindings_java =
  (
   'glib-java'        => '0.4.2',
   'libgconf-java'    => '2.12.6',
   'libglade-java'    => '2.12.8',
   'libgnome-java'    => '2.12.7',
   'libgtk-java'      => '2.10.2',

  );

our %o_bindings_python =
  (
   'gnome-python-desktop' => '2.20.0',
   'gnome-python-extras'  => '2.14.3',
   'nautilus-python'      => '0.4.3',
   'pyphany'              => '0.1.4',
  );

our %o_bindings_python_other =
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


our %o_bindings_perl =
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
