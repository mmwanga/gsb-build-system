package GSB::Desktop_Reqs;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%desktop_reqs %stupid_gnomemeeting_libs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Desktop Requirements Config Options
#


our %desktop_reqs =
  (

   'dhcdbd'          => {
			 'url' => 'http://dcantrel.fedorapeople.org/dhcdbd/',
			 'ver' => '3.0',
			 'src' => 'tar.bz2',
			},
   'heimdal'         => {
			 'url' => 'ftp://ftp.sunet.se/pub/unix/admin/mirror-pdc/heimdal/src/',
			 'ver' => '1.0.1',
			 'src' => 'tar.gz',
		        },
   'iso-codes'       => {
			 'url' => 'ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/',
			 'ver' => '1.5',
			 'src' => 'tar.bz2',
		        },
   'libcroco'        => {
                         'ver' => '0.6.1',
			 'url' => 'http://ftp.gnome.org/pub/GNOME/sources/libcroco/0.6/',
			 'src' => 'tar.bz2',
			},
   'libiptcdata'       => {
                           'ver' => '1.0.2',
                           'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libiptcdata',
                           'src' => 'tar.gz',
                          },
   'libnl'           => {
			   'ver' => '1.0-pre6',
			   'url' => 'http://people.suug.ch/~tgr/libnl/files/',
			   'src' => 'tar.gz',
			  },
   'libnotify'         => {
                             'ver' => '0.4.4',
                             'url' => 'http://galago-project.org/files/releases/source/libnotify/',
                             'src' => 'tar.gz',
			  },
   'libsexy'             => {
                             'ver' => '0.1.11',
                             'url' => 'http://releases.chipx86.com/libsexy/libsexy/',
                             'src' => 'tar.gz',
                            },
   'lua'             => {
			   'ver' => '5.1.2',
			   'url' => 'http://www.lua.org/ftp/',
			   'src' => 'tar.gz',
		        },
   'opal'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '2.2.11',
                         'src' => 'tar.gz',
                        },
   'pwlib'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '1.10.10',
                         'src' => 'tar.gz',
                        },
   'speex'            => {
                         'url' => 'http://downloads.us.xiph.org/releases/speex/',
                         'ver' => '1.2beta2',
                         'src' => 'tar.gz',
                        },

  );


#
# End Config Options
################################################################################
