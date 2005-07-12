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

#    'pkgconfig'           => '0.18.0',

our %platform =
  (
   'at-spi'              => '1.6.4',
   'atk'                 => '1.10.1',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.36',
   'gail'                => '1.8.4',
   'gnome-icon-theme'    => '2.11.4',
   'gnome-keyring'       => '0.4.3',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.11.3',
   'intltool'            => '0.33',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.10.0',
   'libbonoboui'         => '2.10.0',
   'libglade'            => '2.5.1',
   'libgnome'            => '2.11.1',
   'libgnomecanvas'      => '2.10.2',
   'libgnomecups'        => '0.2.0',
   'libgnomeprint'       => '2.11.0',
   'libgnomeprintui'     => '2.11.0',
   'libgnomeui'          => '2.11.1',
   'libxml2'             => '2.6.19',
   'libxslt'             => '1.1.14',
   'pango'               => '1.9.0',

  );

our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.12.2',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.10.1',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.7.1',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.7.2',
		'name' => 'gtk+',
	       },
   'libidl' => {
		'ver'  => '0.8.5',
		'name' => 'libIDL',
	       },
  );

# these are packages from freedesktop.org
our %platform_reqs =
  (
   'cairo'               => {
			     'ver' => '0.4.0',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'dbus'                => {
			     'url' => 'http://dbus.freedesktop.org/releases/',
			     'ver' => '0.34',
			     'src' => 'tar.gz',
			    },
   'desktop-file-utils'  => {
			     'ver' => '0.10',
			     'url' => 'http://freedesktop.org/software/desktop-file-utils/releases/',
			     'src' => 'tar.gz',
			    },
   'gamin'               => {
			     'url' => 'http://www.gnome.org/~veillard/gamin/sources/',
			     'ver' => '0.1.1',
			     'src' => 'tar.gz',
			    },
   'glitz'               => {
			     'ver' => '0.4.3',
			     'url' => 'http://cairographics.org/snapshots/',
			     'src' => 'tar.gz',
			    },
   'hal'                 => {
			     'url' => 'http://freedesktop.org/~david/dist/',
			     'ver' => '0.5.2',
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
   'libpixman'           => {
			     'ver' => '0.1.5',
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
			     'ver' => '0.18.1',
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
   'bug-buddy'              => '2.10.0',
   'control-center'         => '2.11.5',
   'dasher'                 => '3.2.15',
   'eel'                    => '2.11.3',
   'eog'                    => '2.11.0',
   'epiphany'               => '1.7.1',
   'epiphany-extensions'    => '1.7.1',
   'evolution'              => '2.3.4',
   'evolution-data-server'  => '1.3.4',
   'evolution-exchange'     => '2.3.4',
   'evolution-webcal'       => '2.2.1',
   'file-roller'            => '2.11.2',
   'gcalctool'              => '5.5.42',
   'gconf-editor'           => '2.10.0',
   'gdm'                    => '2.8.0.1',
   'gedit'                  => '2.10.3',
   'ggv'                    => '2.11.0',
   'gnome-applets'          => '2.11.1',
   'gnome-backgrounds'      => '2.10.1',
   'gnome-desktop'          => '2.11.4',
   'gnome-doc-utils'        => '0.2.0',
   'gnome-games'            => '2.11.1',
   'gnome-keyring-manager'  => '2.11.1',
   'gnome-mag'              => '0.12.1',
   'gnome-media'            => '2.11.4',
   'gnome-menus'            => '2.10.2',
   'gnome-netstatus'        => '2.10.0',
   'gnome-nettool'          => '1.3.0',
   'gnome-panel'            => '2.11.4',
   'gnome-pilot'            => '2.0.13',
   'gnome-pilot-conduits'   => '2.0.13',
   'gnome-screensaver'      => '0.0.6',
   'gnome-session'          => '2.10.0',
   'gnome-speech'           => '0.3.7',
   'gnome-spell'            => '1.0.6',
   'gnome-system-monitor'   => '2.11.4',
   'gnome-system-tools'     => '1.3.0.1',
   'gnome-terminal'         => '2.11.1',
   'gnome-themes'           => '2.11.4',
   'gnome-user-share'       => '0.5',
   'gnome-utils'            => '2.11.1',
   'gnome-volume-manager'   => '1.3.2',
   'gnome2-user-docs'       => '2.8.1',
   'gnomemeeting'           => '1.2.1',
   'gnopernicus'            => '0.11.2',
   'gok'                    => '1.0.5',
   'goobox'                 => '0.9.91',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.6.3',
   'gtkhtml'                => '3.7.3',
   'gtksourceview'          => '1.2.0',
   'gucharmap'              => '1.4.3',
   'libcroco'               => '0.6.0',
   'libgail-gnome'          => '1.1.1',
   'libgsf'                 => '1.12.1',
   'libgtkhtml'             => '2.6.3',
   'libgtop'                => '2.11.1',
   'librsvg'                => '2.9.5',
   'libsoup'                => '2.2.3',
   'libwnck'                => '2.11.4',
   'libxklavier'            => '2.0',
   'metacity'               => '2.10.2',
   'nautilus'               => '2.11.3',
   'nautilus-cd-burner'     => '2.11.4',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.3',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.11.3',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.3.0',
   'totem'                  => '1.0.4',
   'vino'                   => '2.10.0',
   'vte'                    => '0.11.13',
   'yelp'                   => '2.10.0',
   'zenity'                 => '2.11.0',
  );

our %desktop_diff_naming =
  (
   'gal2'  => {
	       'ver'  => '2.5.3',
	       'name' => 'gal',
	      },
  );

our %desktop_other =
  (
   'gnome-games-extra-data' => {
				'ver' => '2.10.0',
				'dir' => 'gnome-games',
			       },
  );

our %desktop_nongnome =
  (
      'libgnomesu'   => {
			 'ver' => '1.0.0',
			 'url' => 'http://members.chello.nl/~h.lai/libgnomesu/',
			 'src' => 'tar.gz',
		        },
      'xscreensaver' => {
	                 'ver' => '4.22',
			 'url' => 'http://www.jwz.org/xscreensaver/',
			 'src' => 'tar.gz',
			},
  );

our %bindings_cxx =
  (
   'bakery'            => '2.3.15',
   'gconfmm'           => '2.10.0',
   'glibmm'            => '2.7.1',
   'gnome-vfsmm'       => '2.10.0',
   'gtkmm'             => '2.6.3',
   'libglademm'        => '2.6.0',
   'libgnomecanvasmm'  => '2.11.1',
   'libgnomemm'        => '2.10.0',
   'libgnomeuimm'      => '2.10.0',
   'libsigc++'         => '2.0.15',
   'libxml++'          => '2.10.0',
  );

#    'libgtkhtml-java'  => '2.6.0',
#    'libgtkmozembed-java' => '1.7.0',
#    'libvte-java' => '0.11.11',
our %bindings_java =
  (
   'libgconf-java'    => '2.11.4',
   'libglade-java'    => '2.11.4',
   'libgnome-java'    => '2.11.4',
   'libgtk-java'      => '2.6.2',

  );

our %bindings_python =
  (
   'gnome-python'         => '2.10.0',
   'gnome-python-extras'  => '2.10.2',
   'nautilus-python'      => '0.4.0',
   'pygtk'                => '2.6.2',
   'pyorbit'              => '2.0.1',
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
                      'ver' => '0.14',
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
			     'ver' => '1.082',
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
			     'ver' => '1.000',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gnome2-VFS'          => {
			     'ver' => '1.022',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtk2-perl/',
			     'src' => 'tar.gz',
			    },
   'Gtk2'                => {
			     'ver' => '1.082',
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
