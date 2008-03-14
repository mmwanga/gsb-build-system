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
   'ekiga'                  => '2.0.12',
   'eog'                    => '2.22.0',
   'epiphany'               => '2.22.0',
   'epiphany-extensions'    => '2.22.0',
   'evince'                 => '2.22.0',
   'evolution'              => '2.22.0',
   'evolution-exchange'     => '2.22.0',
   'evolution-webcal'       => '2.21.92'
   'fast-user-switch-applet' => '2.22.0',
   'file-roller'            => '2.22.0',
   'gcalctool'              => '5.22.0',
   'gdm'                    => '2.20.4',
   'gedit'                  => '2.22.0',
   'gedit-plugins'          => '2.22.0',
   'glibmm'                 => '2.16.0',
   'gnome-backgrounds'      => '2.22.0',
   'gnome-bluetooth'        => '0.11.0',
   'gnome-commander'        => '1.2.5',
   'gnome-games'            => '2.22.0',
   'gnome-media'            => '2.22.0',
   'gnome-netstatus'        => '2.12.1',
   'gnome-nettool'          => '2.22.0',
   'gnome-phone-manager'    => '0.50',
   'gnome-pilot'            => '2.0.16',
   'gnome-pilot-conduits'   => '2.0.16',
   'gnome-power-manager'    => '2.22.0',
   'gnome-python-desktop'   => '2.22.0',
   'gnome-spell'            => '1.0.8',
   'gnome-system-monitor'   => '2.22.0',
   'gnome-system-tools'     => '2.22.0',
   'gnome-user-docs'        => '2.22.0',
   'gnome-user-share'       => '0.22',
   'gnome-utils'            => '2.20.0.1',
   'gnome-volume-manager'   => '2.22.1',
   'gob2'                   => '2.0.15',
   'gthumb'                 => '2.10.8',
   'gtkmm'                  => '2.12.5',
   'nautilus-sendto'        => '0.13.2',
   'pygtksourceview'        => '2.2.0',
   'rhythmbox'              => '0.11.4',
   'seahorse'               => '2.22.0',
   'sound-juicer'           => '2.22.0',
   'totem'                  => '2.22.0',
   'vino'                   => '2.22.0',
   'yelp'                   => '2.22.0',
   'zenity'                 => '2.22.0',
   );


our %applications =
  (
   'cairomm' => {
                 'ver' => '1.5.0',
                 'url' => 'http://cairographics.org/releases/',
                 'src' => 'tar.gz',
                },
   'enchant'   => {
		   'url' => 'http://www.abisource.com/downloads/enchant/1.3.0/',
		   'ver' => '1.3.0',
		   'src' => 'tar.gz',
		  },
   'gksu'      => {
                   'ver' => '2.0.0',
                   'url' => 'http://people.debian.org/~kov/gksu/',
                   'src' => 'tar.gz',
                  },
   'gnokii'    => {
                   'ver' => '0.6.23',
                   'url' => 'http://www.gnokii.org/download/gnokii/',
                   'src' => 'tar.bz2',
                  },
   'gnomebaker'   => {
		      'ver' => '0.6.2',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnomebaker/',
		      'src' => 'tar.gz',
		      },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.3',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg/',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.6',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad/',
                           'src' => 'tar.bz2',
		       },
   'gst-python' => {
	              'ver' => '0.10.10',
		      'url' => 'http://gstreamer.freedesktop.org/src/gst-python/',
		      'src' => 'tar.bz2',
		     },
   'libgksu'   => {
                   'ver' => '2.0.5',
                   'url' => 'http://people.debian.org/~kov/gksu/',
                   'src' => 'tar.gz',
                  },
   'poppler'         => {
			 'url' => 'http://poppler.freedesktop.org/',
			 'ver' => '0.6.4',
			 'src' => 'tar.gz',
			},
   'poppler-data'         => {
			 'url' => 'http://poppler.freedesktop.org/',
			 'ver' => '0.2.0',
			 'src' => 'tar.gz',
			},
   'pybackpack'         => {
			 'url' => 'http://andrewprice.me.uk/projects/pybackpack/download/',
			 'ver' => '0.5.4',
			 'src' => 'tar.gz',
			},
   'rdiff-backup'         => {
			 'url' => 'http://savannah.nongnu.org/download/rdiff-backup',
			 'ver' => '1.0.5',
			 'src' => 'tar.gz',
			},
   'librsync'         => {
			 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/librsync/',
			 'ver' => '0.9.7',
			 'src' => 'tar.gz',
			},
  );


#
# End Config Options
################################################################################
