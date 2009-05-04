package GSB::Applications;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%applications
		    %applications_gnome);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

our %applications_gnome =
  (
   'alacarte'                => '0.12.1',
   'brasero'                 => '2.26.1',
   'cheese'                  => '2.26.0',
   'deskbar-applet'          => '2.26.1',
   'conduit'                 => '0.3.15',
   'eog'                     => '2.26.1',
   'epiphany'                => '2.26.1',
   'epiphany-extensions'     => '2.26.1',
   'evolution'               => '2.26.1.1',
   'evolution-exchange'      => '2.26.1',
   'evolution-webcal'        => '2.26.0',
   'fast-user-switch-applet' => '2.24.0',
   'file-roller'             => '2.26.1',
   'gcalctool'               => '5.26.1',
   'gdm'                     => '2.20.10',
   'gedit'                   => '2.26.1',
   'gedit-plugins'           => '2.26.1',
   'gnome-bluetooth'         => '0.12.0',
   'gnome-commander'         => '1.2.7',
   'gnome-games'             => '2.26.1',
   'gnome-games-extra-data'  => '2.26.0',
   'gnome-netstatus'         => '2.26.0',
   'gnome-nettool'           => '2.26.1',
   'gnome-pilot'             => '2.0.17',
   'gnome-pilot-conduits'    => '2.0.17',
   'gnome-power-manager'     => '2.26.1',
   'gnome-scan'              => '0.6.2',
   'gnome-spell'             => '1.0.8',
   'gnome-system-monitor'    => '2.26.1',
   'gnome-user-docs'         => '2.26.1',
   'gnome-utils'             => '2.26.0',
   'goocanvas'               => '0.14',
   'goocanvasmm'             => '0.14.0',
   'pygoocanvas'             => '0.14.0',
   'gob2'                    => '2.0.15',
   'gthumb'                  => '2.10.11',
   'gtk-vnc'                 => '0.3.8',
   'hamster-applet'          => '2.26.0',
   'pygtksourceview'         => '2.6.0',
   'seahorse'                => '2.26.1',
   'seahorse-plugins'        => '2.26.1',
   'sound-juicer'            => '2.26.1',
   'totem'                   => '2.26.1',
   'vino'                    => '2.26.1',
   'vinagre'                 => '2.26.1',
   'yelp'                    => '2.26.0',
   );


our %applications =
  (
   'bluez-gnome' => {
                 'ver' => '1.8',
		 'url' => 'http://www.kernel.org/pub/linux/bluetooth',
                 'src' => 'tar.gz',
                },
  'evolution-rss' => {
		'ver' => '0.1.2',
		'url' => 'http://gnome.eu.org',
		'src' => 'tar.gz',
		},
   'libggz' => {
                 'ver' => '0.0.14.1',
                 'url' => 'http://mirrors.ibiblio.org/pub/mirrors/ggzgamingzone/ggz/0.0.14.1',
                 'src' => 'tar.gz',
                },
   'ggz-client-libs' => {
                 'ver' => '0.0.14.1',
                 'url' => 'http://mirrors.ibiblio.org/pub/mirrors/ggzgamingzone/ggz/0.0.14.1',
                 'src' => 'tar.gz',
                },
   'gdesklets'           => {
                             'ver' => '0.36',
                             'url' => 'http://gdesklets.de/files',
                             'src' => 'tar.bz2',
                            },
   'gtkam'  => { 
                      'ver' => '0.1.15',
                      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gphoto',
                      'src' => 'tar.bz2',
                     },
   'gnokii'    => {
                   'ver' => '0.6.27',
                   'url' => 'http://www.gnokii.org/download/gnokii',
                   'src' => 'tar.bz2',
                  },
   'gnomebaker'   => {
		      'ver' => '0.6.4',
		      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gnomebaker',
		      'src' => 'tar.gz',
		      },
   'gtkspell'            => {
			     'ver' => '2.0.14',
			     'url' => 'http://gtkspell.sourceforge.net/download/',
			     'src' => 'tar.gz',
			    },
   'libgksu'   => {
                   'ver' => '2.0.9',
                   'url' => 'http://people.debian.org/~kov/gksu',
                   'src' => 'tar.gz',
                  },
   'gksu'      => {
                   'ver' => '2.0.2',
                   'url' => 'http://people.debian.org/~kov/gksu',
                   'src' => 'tar.gz',
                  },
   'sensors-applet'  => { 
                      'ver' => '2.2.1',
                      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/sensors-applet',
                      'src' => 'tar.gz',
                     },
   'padevchooser'      => {
                   'ver' => '0.9.3',
                   'url' => 'http://0pointer.de/lennart/projects/padevchooser',
                   'src' => 'tar.gz',
                  },
   'paprefs'      => {
                   'ver' => '0.9.6',
                   'url' => 'http://0pointer.de/lennart/projects/paprefs',
                   'src' => 'tar.gz',
                  },
   'paman'      => {
                   'ver' => '0.9.4',
                   'url' => 'http://0pointer.de/lennart/projects/paman',
                   'src' => 'tar.gz',
                  },
   'pavumeter'      => {
                   'ver' => '0.9.3',
                   'url' => 'http://0pointer.de/lennart/projects/pavumeter',
                   'src' => 'tar.gz',
                  },
   'pavucontrol'      => {
                   'ver' => '0.9.8',
                   'url' => 'http://0pointer.de/lennart/projects/pavucontrol',
                   'src' => 'tar.gz',
                  },
   'python-dateutil'            => {
			   'ver' => '1.4.1',
			   'url' => 'http://labix.org/download/python-dateutil',
			   'src' => 'tar.gz',
			  },
   'pywebkitgtk'            => {
			   'ver' => '1.1.4',
			   'url' => 'http://pywebkitgtk.googlecode.com/files/',
			   'src' => 'tar.bz2',
			  },
   'simplejson'            => {
			   'ver' => '2.0.9',
			   'url' => 'http://pypi.python.org/packages/source/s/simplejson',
			   'src' => 'tar.gz',
			  },
   'vobject'            => {
			   'ver' => '0.8.1c',
			   'url' => 'http://vobject.skyhouseconsulting.com',
			   'src' => 'tar.gz',
			  },
  );
#
# End Config Options
################################################################################
