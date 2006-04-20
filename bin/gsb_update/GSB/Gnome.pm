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
   'at-spi'              => '1.7.7',
   'atk'                 => '1.11.4',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.36',
   'gail'                => '1.8.11',
   'gnome-keyring'       => '0.4.9',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.14.1',
   'intltool'            => '0.34.2',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.14.0',
   'libbonoboui'         => '2.14.0',
   'libglade'            => '2.5.1',
   'libgnome'            => '2.14.1',
   'libgnomecanvas'      => '2.14.0',
   'libgnomecups'        => '0.2.2',
   'libgnomeprint'       => '2.12.1',
   'libgnomeui'          => '2.14.1',
   'libxml2'             => '2.6.23',
   'libxslt'             => '1.1.15',
   'pango'               => '1.12.1',
   'pygobject'           => '2.10.1',
   'pygtk'               => '2.8.6',
   'pyorbit'             => '2.14.0',

  );

our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.14.0',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.14.0',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.10.2',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.8.17',
		'name' => 'gtk+',
	       },
   'libidl' => {
		'ver'  => '0.8.6',
		'name' => 'libIDL',
	       },
  );

# these are packages from freedesktop.org
our %platform_reqs =
  (
   'avahi'               => {
                             'ver' => '0.6.9',
                             'url' => 'http://www.avahi.org/download/',
                             'src' => 'tar.gz',
                            },
   'cairo'               => {
			     'ver' => '1.0.4',
			     'url' => 'http://cairographics.org/releases/',
			     'src' => 'tar.gz',
			    },
   'dbus'                => {
			     'url' => 'http://dbus.freedesktop.org/releases/',
			     'ver' => '0.61',
			     'src' => 'tar.gz',
			    },
   'desktop-file-utils'  => {
			     'ver' => '0.10',
			     'url' => 'http://freedesktop.org/software/desktop-file-utils/releases/',
			     'src' => 'tar.gz',
			    },
   'gamin'               => {
			     'url' => 'http://www.gnome.org/~veillard/gamin/sources/',
			     'ver' => '0.1.7',
			     'src' => 'tar.gz',
			    },
   'glitz'               => {
			     'ver' => '0.4.4',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'hal'                 => {
			     'url' => 'http://freedesktop.org/~david/dist/',
			     'ver' => '0.5.7',
			     'src' => 'tar.gz',
			    },
   'howl'                => {
			     'url' => 'http://www.porchdogsoft.com/download/',
			     'ver' => '1.0.0',
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
                             'ver' => '1.2.2',
                             'url' => 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/',
                             'src' => 'tar.gz',
                            },
   'libgpg-error'        => {
                             'ver' => '1.1',
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
			     'url' => 'http://freedesktop.org/~jrb/',
			     'ver' => '0.16',
			     'src' => 'tar.gz',
			    },
   'hicolor-icon-theme'  => {
			     'url' => 'http://icon-theme.freedesktop.org/releases/',
			     'ver' => '0.8',
			     'src' => 'tar.gz',
			    },

   'pycairo'             => {
                             'ver' => '1.0.2',
                             'url' => 'http://cairographics.org/releases/',
                             'src' => 'tar.gz',
                            },

   'pkg-config'          => {
			     'url' => 'http://pkgconfig.freedesktop.org/releases/',
			     'ver' => '0.20',
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
   'bug-buddy'              => '2.14.0',
   'control-center'         => '2.14.1',
   'dasher'                 => '4.0.2',
   'eel'                    => '2.14.1',
   'ekiga'                  => '2.0.1',
   'eog'                    => '2.14.1',
   'epiphany'               => '2.14.1',
   'epiphany-extensions'    => '2.14.1',
   'evince'                 => '0.5.2',
   'evolution'              => '2.6.0',
   'evolution-caldav'       => '2.3.99.3',
   'evolution-data-server'  => '1.6.1',
   'evolution-exchange'     => '2.6.1',
   'evolution-webcal'       => '2.5.90',
   'file-roller'            => '2.14.2',
   'gcalctool'              => '5.7.32',
   'gconf-editor'           => '2.14.0',
   'gdm'                    => '2.14.2',
   'gedit'                  => '2.14.2',
   'ggv'                    => '2.12.0',
   'gnome-applets'          => '2.14.1',
   'gnome-backgrounds'      => '2.14.1',
   'gnome-bluetooth'        => '0.7.0',
   'gnome-desktop'          => '2.14.1.1',
   'gnome-doc-utils'        => '0.6.0',
   'gnome-games'            => '2.14.1',
   'gnome-icon-theme'       => '2.14.2',
   'gnome-keyring-manager'  => '2.14.0',
   'gnome-mag'              => '0.12.4',
   'gnome-media'            => '2.14.0',
   'gnome-menus'            => '2.14.0',
   'gnome-netstatus'        => '2.12.0',
   'gnome-nettool'          => '2.14.1',
   'gnome-panel'            => '2.14.1',
   'gnome-phone-manager'    => '0.6',
   'gnome-pilot'            => '2.0.13',
   'gnome-pilot-conduits'   => '2.0.13',
   'gnome-screensaver'      => '2.14.1',
   'gnome-session'          => '2.14.1',
   'gnome-speech'           => '0.3.10',
   'gnome-spell'            => '1.0.7',
   'gnome-system-monitor'   => '2.14.1',
   'gnome-system-tools'     => '2.14.0',
   'gnome-terminal'         => '2.14.1',
   'gnome-themes'           => '2.14.0',
   'gnome-user-share'       => '0.9',
   'gnome-utils'            => '2.14.0',
   'gnome-volume-manager'   => '1.5.15',
   'gnome-user-docs'        => '2.14.2',
   'gnopernicus'            => '1.0.4',
   'gob2'                   => '2.0.14',
   'gok'                    => '1.0.7',
   'goobox'                 => '0.9.92',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.7.4',
   'gtkhtml'                => '3.10.1',
   'gtksourceview'          => '1.6.1',
   'gucharmap'              => '1.6.0',
   'libbtctl'               => '0.6.0',
   'libcroco'               => '0.6.1',
   'libgail-gnome'          => '1.1.3',
   'libgnomeprintui'        => '2.12.1',
   'libgsf'                 => '1.14.0',
   'libgtkhtml'             => '2.11.0',
   'libgtop'                => '2.14.1',
   'librsvg'                => '2.14.3',
   'libsoup'                => '2.2.92',
   'libwnck'                => '2.14.1',
   'metacity'               => '2.14.3',
   'nautilus'               => '2.14.1',
   'nautilus-cd-burner'     => '2.14.1',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.5',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.14.3',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.4.2',
   'totem'                  => '1.4.0',
   'vino'                   => '2.13.5',
   'vte'                    => '0.12.0',
   'yelp'                   => '2.14.1',
   'zenity'                 => '2.14.1',
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
   'libgnomesu'   => {
		      'ver' => '1.0.0',
		      'url' => 'http://members.chello.nl/~h.lai/libgnomesu/',
		      'src' => 'tar.gz',
		     },
   'alacarte'     => {
		      'ver' => '0.8',
		      'url' => 'http://dev.realistanew.com/alacarte/releases/0.8/',
		      'src' => 'tar.gz',
		     },
   'xscreensaver' => {
		      'ver' => '4.24',
		      'url' => 'http://www.jwz.org/xscreensaver/',
		      'src' => 'tar.gz',
		     },
   'libxklavier' => {
		      'ver' => '2.2',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gswitchit/',
 		      'src' => 'tar.gz',
		     },
  );

our %bindings_cxx =
  (
   'bakery'            => '2.4.0',
   'gconfmm'           => '2.14.0',
   'glibmm'            => '2.10.1',
   'gnome-vfsmm'       => '2.14.0',
   'gtkmm'             => '2.8.5',
   'libglademm'        => '2.6.2',
   'libgnomecanvasmm'  => '2.14.0',
   'libgnomemm'        => '2.14.0',
   'libgnomeuimm'      => '2.14.0',
   'libsigc++'         => '2.0.17',
   'libxml++'          => '2.14.0',
  );

#    'libgtkhtml-java'  => '2.6.0',
#    'libgtkmozembed-java' => '1.7.0',
#    'libvte-java' => '0.11.11',
our %bindings_java =
  (
   'libgconf-java'    => '2.12.2',
   'libglade-java'    => '2.12.3',
   'libgnome-java'    => '2.12.2',
   'libgtk-java'      => '2.8.4',

  );

our %bindings_python =
  (
   'gnome-python'         => '2.12.4',
   'gnome-python-desktop' => '2.14.0',
   'gnome-python-extras'  => '2.14.0',
   'nautilus-python'      => '0.4.3',
   'pyphany'              => '0.1.4',
  );

our %bindings_python_other =
    (
     'gst-python' => {
	              'ver' => '0.10.3',
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
