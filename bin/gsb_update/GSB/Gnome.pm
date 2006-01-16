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
   'at-spi'              => '1.6.6',
   'atk'                 => '1.10.3',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.36',
   'gail'                => '1.8.8',
   'gnome-keyring'       => '0.4.6',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.13.3',
   'intltool'            => '0.34.1',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.13.0',
   'libbonoboui'         => '2.13.0',
   'libglade'            => '2.5.1',
   'libgnome'            => '2.13.4',
   'libgnomecanvas'      => '2.13.0',
   'libgnomecups'        => '0.2.2',
   'libgnomeprint'       => '2.12.1',
   'libgnomeui'          => '2.13.0',
   'libxml2'             => '2.6.23',
   'libxslt'             => '1.1.15',
   'pango'               => '1.11.1',

  );

our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.13.2',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.13.5',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.9.2',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.8.7',
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
   'cairo'               => {
			     'ver' => '1.0.2',
			     'url' => 'http://cairographics.org/releases/',
			     'src' => 'tar.gz',
			    },
   'dbus'                => {
			     'url' => 'http://dbus.freedesktop.org/releases/',
			     'ver' => '0.60',
			     'src' => 'tar.gz',
			    },
   'desktop-file-utils'  => {
			     'ver' => '0.10',
			     'url' => 'http://freedesktop.org/software/desktop-file-utils/releases/',
			     'src' => 'tar.gz',
			    },
   'gamin'               => {
			     'url' => 'http://www.gnome.org/~veillard/gamin/sources/',
			     'ver' => '0.1.5',
			     'src' => 'tar.gz',
			    },
   'glitz'               => {
			     'ver' => '0.4.4',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'hal'                 => {
			     'url' => 'http://freedesktop.org/~david/dist/',
			     'ver' => '0.5.5.1',
			     'src' => 'tar.gz',
			    },
   'howl'                => {
			     'url' => 'http://www.porchdogsoft.com/download/',
			     'ver' => '1.0.0',
			     'src' => 'tar.gz',
			    },
   'libcap'              => {
			     'url' => 'http://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/',
			     'ver' => '1.10',
			     'src' => 'tar.gz',
			    },
   'libgcrypt'           => {
                             'ver' => '1.2.1',
                             'url' => 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/',
                             'src' => 'tar.gz',
                            },
   'libgpg-error'        => {
                             'ver' => '1.0',
                             'url' => 'ftp://ftp.gnupg.org/gcrypt/libgpg-error/',
                             'src' => 'tar.gz',
                            },
   'libpixman'           => {
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
   'pkg-config'          => {
			     'url' => 'http://pkgconfig.freedesktop.org/releases/',
			     'ver' => '0.20',
			     'src' => 'tar.gz',
			    },
   'Pyrex'               => {
			     'url' => 'http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/',
			     'ver' => '0.9.3',
			     'src' => 'tar.gz',
			    },
  );

our %desktop =
  (
   'bug-buddy'              => '2.12.1',
   'control-center'         => '2.13.4',
   'dasher'                 => '3.2.18',
   'eel'                    => '2.13.3',
   'eog'                    => '2.13.4',
   'epiphany'               => '1.9.4',
   'epiphany-extensions'    => '1.9.4',
   'evince'                 => '0.4.0',
   'evolution'              => '2.5.4',
   'evolution-caldav'       => '2.3.99.3',
   'evolution-data-server'  => '1.5.4',
   'evolution-exchange'     => '2.5.4',
   'evolution-webcal'       => '2.4.1',
   'file-roller'            => '2.13.3',
   'gcalctool'              => '5.7.23',
   'gconf-editor'           => '2.12.0',
   'gdm'                    => '2.13.0.5',
   'gedit'                  => '2.13.2',
   'ggv'                    => '2.12.0',
   'gnome-applets'          => '2.13.1',
   'gnome-backgrounds'      => '2.12.2',
   'gnome-desktop'          => '2.13.4',
   'gnome-doc-utils'        => '0.5.2',
   'gnome-games'            => '2.13.4',
   'gnome-icon-theme'       => '2.13.4',
   'gnome-keyring-manager'  => '2.12.0',
   'gnome-mag'              => '0.12.2',
   'gnome-media'            => '2.12.0',
   'gnome-menus'            => '2.13.5',
   'gnome-netstatus'        => '2.12.0',
   'gnome-nettool'          => '1.4.1',
   'gnome-panel'            => '2.13.4',
   'gnome-pilot'            => '2.0.13',
   'gnome-pilot-conduits'   => '2.0.13',
   'gnome-screensaver'      => '0.0.24',
   'gnome-session'          => '2.13.4',
   'gnome-speech'           => '0.3.9',
   'gnome-spell'            => '1.0.6',
   'gnome-system-monitor'   => '2.13.4',
   'gnome-system-tools'     => '1.4.1',
   'gnome-terminal'         => '2.13.1',
   'gnome-themes'           => '2.13.2',
   'gnome-user-share'       => '0.9',
   'gnome-utils'            => '2.13.4',
   'gnome-volume-manager'   => '1.5.9',
   'gnome2-user-docs'       => '2.8.1',
   'gnomemeeting'           => '1.2.2',
   'gnopernicus'            => '1.0.0',
   'gok'                    => '1.0.5',
   'goobox'                 => '0.9.92',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.7.2',
   'gtkhtml'                => '3.9.4',
   'gtksourceview'          => '1.5.5',
   'gucharmap'              => '1.5.0',
   'libcroco'               => '0.6.0',
   'libgail-gnome'          => '1.1.2',
   'libgnomeprintui'        => '2.12.1',
   'libgsf'                 => '1.12.3',
   'libgtkhtml'             => '2.11.0',
   'libgtop'                => '2.13.2',
   'librsvg'                => '2.13.5',
   'libsoup'                => '2.2.7',
   'libwnck'                => '2.13.4',
   'metacity'               => '2.13.13',
   'nautilus'               => '2.13.3',
   'nautilus-cd-burner'     => '2.13.4',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.4',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.13.1',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.4.2',
   'totem'                  => '1.3.0',
   'vino'                   => '2.13.5',
   'vte'                    => '0.11.16',
   'yelp'                   => '2.13.2',
   'zenity'                 => '2.13.4',
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
   'smeg'         => {
		      'ver' => '0.7.5',
		      'url' => 'http://dev.realistanew.com/smeg/0.7.5/',
		      'src' => 'tar.gz',
		     },
   'xscreensaver' => {
		      'ver' => '4.22',
		      'url' => 'http://www.jwz.org/xscreensaver/',
		      'src' => 'tar.gz',
		     },
   'libxklavier' => {
		      'ver' => '2.1',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gswitchit/',
 		      'src' => 'tar.gz',
		     },
  );

our %bindings_cxx =
  (
   'bakery'            => '2.3.16',
   'gconfmm'           => '2.12.0',
   'glibmm'            => '2.8.1',
   'gnome-vfsmm'       => '2.12.0',
   'gtkmm'             => '2.8.1',
   'libglademm'        => '2.6.1',
   'libgnomecanvasmm'  => '2.12.0',
   'libgnomemm'        => '2.12.0',
   'libgnomeuimm'      => '2.12.0',
   'libsigc++'         => '2.0.17',
   'libxml++'          => '2.13.1',
  );

#    'libgtkhtml-java'  => '2.6.0',
#    'libgtkmozembed-java' => '1.7.0',
#    'libvte-java' => '0.11.11',
our %bindings_java =
  (
   'libgconf-java'    => '2.12.1',
   'libglade-java'    => '2.12.1',
   'libgnome-java'    => '2.12.1',
   'libgtk-java'      => '2.8.1',

  );

our %bindings_python =
  (
   'gnome-python'         => '2.12.1',
   'gnome-python-extras'  => '2.13.1',
   'nautilus-python'      => '0.4.0',
   'pygtk'                => '2.8.4',
   'pyorbit'              => '2.13.1',
   'pyphany'              => '0.1.4',
  );

our %bindings_python_other =
    (
     'gst-python' => {
	              'ver' => '0.8.2',
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
			     'ver' => '1.102',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2'              => {
			     'ver' => '1.023',
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
			     'ver' => '1.041',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gtk2'                => {
			     'ver' => '1.102',
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
