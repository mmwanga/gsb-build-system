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
   'alacarte'               => '0.11.5',
   'deskbar-applet'         => '2.22.3.1',
   'cheese'                 => '2.22.3',
   'conduit'                => '0.3.13',
   'ekiga'                  => '2.0.12',
   'eog'                    => '2.22.3',
   'epiphany'               => '2.22.3',
   'epiphany-extensions'    => '2.22.2',
   'evince'                 => '2.22.2',
   'evolution'              => '2.22.3.1',
   'evolution-exchange'     => '2.22.3',
   'evolution-webcal'       => '2.21.92',
   'fast-user-switch-applet' => '2.22.0',
   'file-roller'            => '2.22.4',
   'gcalctool'              => '5.22.3',
   'gdm'                    => '2.20.7',
   'gedit'                  => '2.22.3',
   'gedit-plugins'          => '2.22.2',
   'gnome-backgrounds'      => '2.22.0',
   'gnome-bluetooth'        => '0.11.0',
   'gnome-commander'        => '1.2.7',
   'gnome-games'            => '2.22.3',
   'gnome-games-extra-data' => '2.22.0',
   'gnome-media'            => '2.22.0',
   'gnome-netstatus'        => '2.12.1',
   'gnome-nettool'          => '2.22.0',
   'gnome-phone-manager'    => '0.60',
   'gnome-pilot'            => '2.0.16',
   'gnome-pilot-conduits'   => '2.0.16',
   'gnome-power-manager'    => '2.22.1',
   'gnome-python-desktop'   => '2.22.0',
   'gnome-scan'             => '0.6',
   'gnome-spell'            => '1.0.8',
   'gnome-system-monitor'   => '2.22.3',
   'gnome-user-docs'        => '2.22.1',
   'gnome-user-share'       => '0.31',
   'gnome-utils'            => '2.20.0.1',
   'gob2'                   => '2.0.15',
   'gthumb'                 => '2.10.9',
   'nautilus-sendto'        => '0.14.0',
   'pygtksourceview'        => '2.2.0',
   'rhythmbox'              => '0.11.6',
   'seahorse'               => '2.22.3',
   'sound-juicer'           => '2.22.0',
   'totem'                  => '2.22.2',
   'totem-pl-parser'        => '2.22.3',
   'vino'                   => '2.22.2',
   'vinagre'                => '0.5.1',
   'yelp'                   => '2.22.1',
   'zenity'                 => '2.22.1',
   );


our %applications =
  (
   'bluez-gnome' => {
                 'ver' => '0.27',
		 'url' => 'http://bluez.sf.net/download',
                 'src' => 'tar.gz',
                },
   'libggz' => {
                 'ver' => '0.0.14.1',
                 'url' => 'http://ftp.belnet.be/mirrors/ftp.ggzgamingzone.org/ggz/0.0.14.1',
                 'src' => 'tar.gz',
                },
   'ggz-client-libs' => {
                 'ver' => '0.0.14.1',
                 'url' => 'http://ftp.belnet.be/mirrors/ftp.ggzgamingzone.org/ggz/0.0.14.1',
                 'src' => 'tar.gz',
                },
   'enchant'   => {
		   'url' => 'http://www.abisource.com/downloads/enchant/1.4.2',
		   'ver' => '1.4.2',
		   'src' => 'tar.gz',
		  },
   'gnokii'    => {
                   'ver' => '0.6.26',
                   'url' => 'http://www.gnokii.org/download/gnokii',
                   'src' => 'tar.bz2',
                  },
   'gnomebaker'   => {
		      'ver' => '0.6.4',
		      'url' => 'http://kent.dl.sourceforge.net/sourceforge/gnomebaker',
		      'src' => 'tar.gz',
		      },
   'goocanvas'   => {
		      'ver' => '0.10',
		      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/goocanvas',
		      'src' => 'tar.gz',
		      },
   'gtkspell'            => {
			     'ver' => '2.0.13',
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
			   'ver' => '0.6.6',
			   'url' => 'http://vobject.skyhouseconsulting.com',
			   'src' => 'tar.gz',
			  },
   'python-dateutil'            => {
			   'ver' => '1.4',
			   'url' => 'http://labix.org/download/python-dateutil',
			   'src' => 'tar.bz2',
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
