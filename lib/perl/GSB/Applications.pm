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
   'alacarte'                => '0.11.6',
   'brasero'                 => '0.8.3',
   'cheese'                  => '2.24.2',
   'deskbar-applet'          => '2.24.2',
   'conduit'                 => '0.3.15',
   'eog'                     => '2.24.2',
   'epiphany'                => '2.24.2.1',
   'epiphany-extensions'     => '2.24.1',
   'evolution'               => '2.24.2',
   'evolution-exchange'      => '2.24.2',
   'evolution-webcal'        => '2.24.0',
   'fast-user-switch-applet' => '2.24.0',
   'file-roller'             => '2.24.1',
   'gcalctool'               => '5.24.2',
   'gdm'                     => '2.20.9',
   'gedit'                   => '2.24.1',
   'gedit-plugins'           => '2.22.5',
   'gnome-bluetooth'         => '0.11.0',
   'gnome-commander'         => '1.2.7',
   'gnome-games'             => '2.24.2',
   'gnome-games-extra-data'  => '2.24.0',
   'gnome-netstatus'         => '2.12.2',
   'gnome-nettool'           => '2.22.1',
   'gnome-pilot'             => '2.0.17',
   'gnome-pilot-conduits'    => '2.0.17',
   'gnome-power-manager'     => '2.24.2',
   'gnome-scan'              => '0.6',
   'gnome-spell'             => '1.0.8',
   'gnome-system-monitor'    => '2.24.1',
   'gnome-user-docs'         => '2.24.2',
   'gnome-utils'             => '2.24.1',
   'goocanvas'               => '0.12',
   'goocanvasmm'             => '0.12.0',
   'pygoocanvas'             => '0.12.0',
   'gob2'                    => '2.0.15',
   'gthumb'                  => '2.10.10',
   'hamster-applet'          => '2.24.1',
   'nautilus-sendto'         => '1.1.0',
   'pygtksourceview'         => '2.4.0',
   'seahorse'                => '2.24.1',
   'seahorse-plugins'        => '2.24.1',
   'sound-juicer'            => '2.24.0',
   'totem'                   => '2.24.3',
   'vino'                    => '2.24.1',
   'vinagre'                 => '2.24.1',
   'yelp'                    => '2.24.0',
   'zenity'                  => '2.24.0',
   );


our %applications =
  (
   'bluez-gnome' => {
                 'ver' => '0.28',
		 'url' => 'http://bluez.sf.net/download',
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
   'gtk-vnc'   => {
		   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gtk-vnc',
		   'ver' => '0.3.8',
		   'src' => 'tar.gz',
		  },
   'libgksu'   => {
                   'ver' => '2.0.7',
                   'url' => 'http://people.debian.org/~kov/gksu',
                   'src' => 'tar.gz',
                  },
   'gksu'      => {
                   'ver' => '2.0.0',
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
                   'ver' => '0.9.5',
                   'url' => 'http://0pointer.de/lennart/projects/pavucontrol',
                   'src' => 'tar.gz',
                  },
   'python-dateutil'            => {
			   'ver' => '1.4.1',
			   'url' => 'http://labix.org/download/python-dateutil',
			   'src' => 'tar.gz',
			  },
   'pywebkitgtk'            => {
			   'ver' => '1.0.1',
			   'url' => 'http://pywebkitgtk.googlecode.com/files',
			   'src' => 'tar.gz',
			  },
   'simplejson'            => {
			   'ver' => '2.0.5',
			   'url' => 'http://pypi.python.org/packages/source/s/simplejson',
			   'src' => 'tar.gz',
			  },
   'vobject'            => {
			   'ver' => '0.7.1',
			   'url' => 'http://vobject.skyhouseconsulting.com',
			   'src' => 'tar.gz',
			  },
  );
#
# End Config Options
################################################################################
