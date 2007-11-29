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
   'alacarte'               => '0.11.3',
   'deskbar-applet'         => '2.20.2',
   'ekiga'                  => '2.0.11',
   'eog'                    => '2.20.3',
   'epiphany'               => '2.20.2',
   'epiphany-extensions'    => '2.20.1',
   'evince'                 => '2.20.2',
   'evolution'              => '2.12.2',
   'evolution-exchange'     => '2.12.2',
   'evolution-webcal'       => '2.12.0',
   'file-roller'            => '2.20.2',
   'gcalctool'              => '5.20.2',
   'gdm'                    => '2.20.2',
   'gedit'                  => '2.20.4',
   'gedit-plugins'          => '2.20.0',
   'glibmm'                 => '2.14.2',
   'gnome-backgrounds'      => '2.20.0',
   'gnome-bluetooth'        => '0.9.1',
   'gnome-commander'        => '1.2.4',
   'gnome-games'            => '2.20.2',
   'gnome-media'            => '2.20.1',
   'gnome-netstatus'        => '2.12.1',
   'gnome-nettool'          => '2.20.0',
   'gnome-phone-manager'    => '0.30',
   'gnome-pilot'            => '2.0.15',
   'gnome-pilot-conduits'   => '2.0.15',
   'gnome-power-manager'    => '2.20.1',
   'gnome-python-desktop'   => '2.20.0',
   'gnome-spell'            => '1.0.8',
   'gnome-system-monitor'   => '2.20.1',
   'gnome-system-tools'     => '2.20.0',
   'gnome-user-docs'        => '2.20.1',
   'gnome-user-share'       => '0.11',
   'gnome-utils'            => '2.20.0.1',
   'gnome-volume-manager'   => '2.17.0',
   'gob2'                   => '2.0.15',
   'gthumb'                 => '2.10.7',
   'gtkmm'                  => '2.12.3',
   'nautilus-sendto'        => '0.12',
   'network-manager-applet' => '0.6.5',
   'pygtksourceview'        => '2.0.0',
   'rhythmbox'              => '0.11.3',
   'seahorse'               => '2.20.1',
   'sound-juicer'           => '2.20.1',
   'totem'                  => '2.20.1',
   'vino'                   => '2.20.1',
   'yelp'                   => '2.20.0',
   'zenity'                 => '2.20.1',
   );


our %applications =
  (
   'cairomm' => {
                 'ver' => '1.4.6',
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
                   'ver' => '0.6.22',
                   'url' => 'http://www.gnokii.org/download/gnokii/',
                   'src' => 'tar.bz2',
                  },
   'gnomebaker'   => {
		      'ver' => '0.6.2',
		      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnomebaker/',
		      'src' => 'tar.gz',
		      },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.2',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg/',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.5',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad/',
                           'src' => 'tar.bz2',
		       },
   'gst-python' => {
	              'ver' => '0.10.8',
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
			 'ver' => '0.6.1',
			 'src' => 'tar.gz',
			},
   'poppler-data'         => {
			 'url' => 'http://poppler.freedesktop.org/',
			 'ver' => '0.1.1',
			 'src' => 'tar.gz',
			},
   'pybackpack'         => {
			 'url' => 'http://andrewprice.me.uk/projects/pybackpack/download/',
			 'ver' => '0.5.1',
			 'src' => 'tar.gz',
			},
  );


#
# End Config Options
################################################################################
