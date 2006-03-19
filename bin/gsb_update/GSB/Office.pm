package GSB::Office;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%office %office_libs %office_gnome_libs %office_gnome);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

# src tarballs in other locations

# not used anymore, abiword is on ftp.gnome.org also.
our %office =
  (
   'abiword' => {
		 'url' => "http://www.abisource.com/downloads/abiword/2.4.2/source/",
		 'ver' => '2.4.2',
		 'src' => 'tar.gz'
		},
  );

our %office_libs =
  (
   'aiksaurus' => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/aiksaurus/',
		   'ver' => '1.2.1',
		   'src' => 'tar.gz',
		  },
   'enchant'   => {
		   'url' => 'http://www.abisource.com/downloads/enchant/1.2.0/',
		   'ver' => '1.2.0',
		   'src' => 'tar.gz',
		  },
   'eps'       => {
		   'url' => 'http://www.inter7.com/eps/',
		   'ver' => '1.5',
		   'src' => 'tar.gz',
		  },
   'fribidi'   => {
		   'url' => 'http://fribidi.org/download/',
		   'ver' => '0.10.7',
		   'src' => 'tar.gz',
		  },
   'libwmf'    => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/wvware/',
		   'ver' => '0.2.8.4',
		   'src' => 'tar.gz',
		  },
   'libwpd'    => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libwpd/',
		   'ver' => '0.8.4',
		   'src' => 'tar.gz',
		  },
   'ots'       => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libots/',
		   'ver' => '0.4.2',
		   'src' => 'tar.gz',
		  },
   'psiconv'   => {
		   'url' => 'http://software.frodo.looijaard.name/psiconv/files/',
		   'ver' => '0.9.7',
		   'src' => 'tar.gz',
		  },
  );

our %office_gnome_libs =
  (
   'goffice'     => '0.2.0',
   'libgda'      => '1.9.100',
   'libgnomedb'  => '1.9.100',
   'libgdamm'    => '1.3.7',
   'present'     => '0.0.3',
  );

our %office_gnome =
  (
#   'abiword'   => '2.3.5',
   'gnumeric'  => '1.6.2',
   'dia'       => '0.94',
   'glom'      => '0.9.91',
   'mergeant'  => '0.62',
   'planner'   => '0.13',
  );

#
# End Config Options
################################################################################
