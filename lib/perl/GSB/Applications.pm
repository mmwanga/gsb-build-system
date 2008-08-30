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
   'alacarte'                => '0.11.5',
   'brasero'                 => '0.8.1',
   'cheese'                  => '2.23.90',
   'deskbar-applet'          => '2.23.90',
   'conduit'                 => '0.3.13.1',
   'eog'                     => '2.23.90',
   'epiphany'                => '2.23.90',
   'epiphany-extensions'     => '2.22.2',
   'evolution'               => '2.23.90',
   'evolution-exchange'      => '2.23.90',
   'evolution-webcal'        => '2.21.92',
   'fast-user-switch-applet' => '2.22.0',
   'file-roller'             => '2.23.6',
   'gcalctool'               => '5.23.90',
   'gdm'                     => '2.20.7',
   'gedit'                   => '2.23.90',
   'gedit-plugins'           => '2.22.2',
   'gnome-bluetooth'         => '0.11.0',
   'gnome-commander'         => '1.2.7',
   'gnome-games'             => '2.23.90',
   'gnome-games-extra-data'  => '2.22.0',
   'gnome-media'             => '2.23.3',
   'gnome-netstatus'         => '2.12.1',
   'gnome-nettool'           => '2.22.0',
   'gnome-phone-manager'     => '0.60',
   'gnome-pilot'             => '2.0.16',
   'gnome-pilot-conduits'    => '2.0.16',
   'gnome-power-manager'     => '2.23.6',
   'gnome-python-desktop'    => '2.23.0',
   'gnome-scan'              => '0.6',
   'gnome-spell'             => '1.0.8',
   'gnome-system-monitor'    => '2.23.90',
   'gnome-user-docs'         => '2.22.1',
   'gnome-utils'             => '2.23.90',
   'gob2'                    => '2.0.15',
   'gthumb'                  => '2.10.9',
   'hamster-applet'          => '2.23.90',
   'nautilus-sendto'         => '0.14.0',
   'pygtksourceview'         => '2.2.0',
   'rhythmbox'               => '0.11.6',
   'seahorse'                => '2.23.90',
   'seahorse-plugins'        => '2.23.6',
   'sound-juicer'            => '2.23.2',
   'totem'                   => '2.23.4',
   'totem-pl-parser'         => '2.23.3',
   'vino'                    => '2.23.90',
   'vinagre'                 => '2.23.90',
   'yelp'                    => '2.23.2',
   'zenity'                  => '2.23.3.1',
   );


our %applications =
  (
   'bluez-gnome' => {
                 'ver' => '0.28',
		 'url' => 'http://bluez.sf.net/download',
                 'src' => 'tar.gz',
                },
   'sensors-applet'  => { 
                      'ver' => '2.2.1',
                      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/sensors-applet',
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
                   'ver' => '0.6.26',
                   'url' => 'http://www.gnokii.org/download/gnokii',
                   'src' => 'tar.bz2',
                  },
   'gnomebaker'   => {
		      'ver' => '0.6.4',
		      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gnomebaker',
		      'src' => 'tar.gz',
		      },
   'goocanvas'   => {
		      'ver' => '0.10',
		      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/goocanvas',
		      'src' => 'tar.gz',
		      },
   'gtkspell'            => {
			     'ver' => '2.0.14',
			     'url' => 'http://gtkspell.sourceforge.net/download/',
			     'src' => 'tar.gz',
			    },
   'gtk-vnc'   => {
		   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gtk-vnc',
		   'ver' => '0.3.6',
		   'src' => 'tar.gz',
		  },
   'pygoocanvas'   => {
		      'ver' => '0.10.0',
		      'url' => 'http://download2.berlios.de/pygoocanvas',
		      'src' => 'tar.gz',
		      },
   'vobject'            => {
			   'ver' => '0.7.1',
			   'url' => 'http://vobject.skyhouseconsulting.com',
			   'src' => 'tar.gz',
			  },
   'python-dateutil'            => {
			   'ver' => '1.4.1',
			   'url' => 'http://labix.org/download/python-dateutil',
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
  );
#
# End Config Options
################################################################################
