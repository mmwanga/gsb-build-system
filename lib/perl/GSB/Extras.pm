package GSB::Extras;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(
                    %extras
                    %extras_gnome
                   );
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


################################################################################
# Config Options for EXTRAS
#

# src/extras
our %extras_gnome =
  (
   'brasero'             => '0.6.1',
   'pessulus'            => '2.16.3',
   'sabayon'             => '2.20.1',
   'gnome-cups-manager'  => '0.31',
  );


# src/extras
our %extras =
  (
   'balsa'               => {
			     'ver' => '2.3.20',
			     'url' => 'http://balsa.gnome.org',
			     'src' => 'tar.bz2',
			    },
   'compiz'              => {
                 'ver' => '0.5.2',
                 'url' => 'http://xorg.freedesktop.org/archive/individual/app',
                 'src' => 'tar.gz',
                            },
   'deluge'              => {
                 'ver' => '0.5.6.2',
                 'url' => 'http://download.deluge-torrent.org/tarball/0.5.6.2',
                 'src' => 'tar.gz',
                            },
   'devede'              => {
                 'ver' => '3.3',
                 'url' => 'http://www.rastersoft.com/descargas',
                 'src' => 'tar.bz2',
                            },
   'dvdauthor'              => {
                 'ver' => '0.6.14',
                 'url' => 'http://downloads.sourceforge.net/dvdauthor',
                 'src' => 'tar.gz',
                            },
   'dvdrip'              => {
                 'ver' => '0.98.8',
                 'url' => 'http://www.exit1.org/dvdrip/dist',
                 'src' => 'tar.gz',
                            },
   'easytag'             => {
			     'ver' => '2.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/easytag',
			     'src' => 'tar.bz2',
			    },
   'gDesklets'           => {
			     'ver' => '0.35.4',
			     'url' => 'http://www.gdesklets.de/files/',
			     'src' => 'tar.bz2',
			    },
   'gimp'                => {
			     'ver' => '2.4.1',
			     'url' => 'ftp://ftp.gimp.org/pub/gimp/v2.4',
			     'src' => 'tar.bz2',
			    },
   'gnonlin'             => {
                 'ver' => '0.10.9',
                 'url' => 'http://gstreamer.freedesktop.org/src/gnonlin',
                 'src' => 'tar.bz2',
                            },
   'gparted'             => {
                 'ver' => '0.3.3',
                 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gparted',
                 'src' => 'tar.bz2',
                            },
   'grip'                => {
                 'ver' => '3.3.1',
                 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/grip',
                 'src' => 'tar.gz',
                            },
   'gtkam'               => {
			     'ver' => '0.1.14',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto',
			     'src' => 'tar.gz',
			    },
   'gtkpod'              => {
			     'ver' => '0.99.10',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtkpod',
			     'src' => 'tar.gz',
			    },
   'inkscape'            => {
			     'ver' => '0.45.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/inkscape',
			     'src' => 'tar.gz',
			    },
   'istanbul'            => {
			     'ver' => '0.2.1',
			     'url' => 'http://zaheer.merali.org',
			     'src' => 'tar.bz2',
			    },
   'jokosher'            => {
			     'ver' => '0.9',
			     'url' => 'http://www.jokosher.org/downloads/source',
			     'src' => 'tar.gz',
			    },
   'kino'                => {
			     'ver' => '1.1.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino',
			     'src' => 'tar.gz',
			    },
   'libesmtp'            => {
			     'ver' => '1.0.4',
			     'url' => 'http://www.stafford.uklinux.net/libesmtp',
			     'src' => 'tar.bz2',
			    },
   'liferea'             => {
			     'ver' => '1.4.5b',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/liferea',
			     'src' => 'tar.gz',
			    },
   'parted'             => {
			     'ver' => '1.8.8',
			     'url' => 'http://ftp.gnu.org/gnu/parted',
			     'src' => 'tar.bz2',
			    },
   'pstoedit'            => {
			     'ver' => '3.45',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/pstoedit',
			     'src' => 'tar.gz',
			    },
   'python-ldap'         => {
                 'ver' => '2.3.1',
                 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/python-ldap',
                 'src' => 'tar.gz',
                            },
   'streamripper'        => {
			     'ver' => '1.62.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/streamripper',
			     'src' => 'tar.gz',
			    },
   'sylpheed'            => {
			     'ver' => '2.4.7',
			     'url' => 'http://sylpheed.good-day.net/sylpheed/v2.4',
			     'src' => 'tar.bz2',
			    },
   'tre'            => {
			     'ver' => '0.7.5',
			     'url' => 'http://laurikari.net/tre',
			     'src' => 'tar.bz2',
			    },
   'vcdimager'            => {
			     'ver' => '0.7.23',
			     'url' => 'http://mirrors.kernel.org/gnu/vcdimager',
			     'src' => 'tar.gz',
			    },
  );


#
# End Config Options
################################################################################
