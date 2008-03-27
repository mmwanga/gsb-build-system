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
   'deskbar-applet'         => '2.22.0.1',
   'cheese'                 => '2.22.0',
   'conduit'                => '0.3.9',
   'ekiga'                  => '2.0.12',
   'eog'                    => '2.22.0',
   'epiphany'               => '2.22.0',
   'epiphany-extensions'    => '2.22.0',
   'evince'                 => '2.22.0',
   'evolution'              => '2.22.0',
   'evolution-exchange'     => '2.22.0',
   'evolution-webcal'       => '2.21.92',
   'fast-user-switch-applet' => '2.22.0',
   'file-roller'            => '2.22.0',
   'gcalctool'              => '5.22.0',
   'gdm'                    => '2.20.4',
   'gedit'                  => '2.22.0',
   'gedit-plugins'          => '2.22.0',
   'gnome-backgrounds'      => '2.22.0',
   'gnome-bluetooth'        => '0.11.0',
   'gnome-commander'        => '1.2.5',
   'gnome-games'            => '2.22.0',
   'gnome-games-extra-data' => '2.22.0',
   'gnome-media'            => '2.22.0',
   'gnome-netstatus'        => '2.12.1',
   'gnome-nettool'          => '2.22.0',
   'gnome-phone-manager'    => '0.50',
   'gnome-pilot'            => '2.0.16',
   'gnome-pilot-conduits'   => '2.0.16',
   'gnome-power-manager'    => '2.22.0',
   'gnome-python-desktop'   => '2.22.0',
   'gnome-scan'             => '0.6',
   'gnome-spell'            => '1.0.8',
   'gnome-system-monitor'   => '2.22.0',
   'gnome-system-tools'     => '2.22.0',
   'gnome-user-docs'        => '2.22.0',
   'gnome-user-share'       => '0.22',
   'gnome-utils'            => '2.20.0.1',
   'gob2'                   => '2.0.15',
   'gthumb'                 => '2.10.8',
   'nautilus-sendto'        => '0.13.2',
   'pygtksourceview'        => '2.2.0',
   'rhythmbox'              => '0.11.5',
   'seahorse'               => '2.22.0',
   'sound-juicer'           => '2.22.0',
   'totem'                  => '2.22.0',
   'totem-pl-parser'        => '2.22.1',
   'vino'                   => '2.22.0',
   'yelp'                   => '2.22.0',
   'zenity'                 => '2.22.0',
   );


our %applications =
  (
   'bluez-gnome' => {
                 'ver' => '0.25',
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
		   'url' => 'http://www.abisource.com/downloads/enchant/1.3.0',
		   'ver' => '1.3.0',
		   'src' => 'tar.gz',
		  },
   'gnokii'    => {
                   'ver' => '0.6.23',
                   'url' => 'http://www.gnokii.org/download/gnokii',
                   'src' => 'tar.bz2',
                  },
   'gnomebaker'   => {
		      'ver' => '0.6.2',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnomebaker',
		      'src' => 'tar.gz',
		      },
   'goocanvas'   => {
		      'ver' => '0.9',
		      'url' => 'http://mesh.dl.sourceforge.net/sourceforge/goocanvas',
		      'src' => 'tar.gz',
		      },
   'pygoocanvas'   => {
		      'ver' => '0.9.0',
		      'url' => 'http://download2.berlios.de/pygoocanvas',
		      'src' => 'tar.gz',
		      },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.3',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.6',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad',
                           'src' => 'tar.bz2',
		       },
   'gst-python' => {
	              'ver' => '0.10.10',
		      'url' => 'http://gstreamer.freedesktop.org/src/gst-python',
		      'src' => 'tar.bz2',
		     },
   'vobject'            => {
			   'ver' => '0.6.0',
			   'url' => 'http://vobject.skyhouseconsulting.com',
			   'src' => 'tar.gz',
			  },
   'python-dateutil'            => {
			   'ver' => '1.4',
			   'url' => 'http://labix.org/download/python-dateutil',
			   'src' => 'tar.bz2',
			  },
   'libgksu'   => {
                   'ver' => '2.0.5',
                   'url' => 'http://people.debian.org/~kov/gksu',
                   'src' => 'tar.gz',
                  },
   'gksu'      => {
                   'ver' => '2.0.0',
                   'url' => 'http://people.debian.org/~kov/gksu',
                   'src' => 'tar.gz',
                  },
  );


#
# End Config Options
################################################################################
