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
our %office =
  (
   'abiword' => {
		 'url' => "http://www.abisource.com/downloads/abiword/2.2.5/source/",
		 'ver' => '2.2.5',
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
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/abiword/',
		   'ver' => '1.1.5',
		   'src' => 'tar.gz',
		  },
   'eps'       => {
		   'url' => 'http://www.inter7.com/eps/',
		   'ver' => '1.5',
		   'src' => 'tar.gz',
		  },
   'fribidi'   => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/fribidi/',
		   'ver' => '0.10.4',
		   'src' => 'tar.bz2',
		  },
   'libwmf'    => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/wvware/',
		   'ver' => '0.2.8.3',
		   'src' => 'tar.gz',
		  },
   'libwpd'    => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libwpd/',
		   'ver' => '0.8.0',
		   'src' => 'tar.gz',
		  },
   'ots'       => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libots/',
		   'ver' => '0.4.2',
		   'src' => 'tar.gz',
		  },
   'psiconv'   => {
		   'url' => 'http://www.frodol.dds.nl/psiconv/',
		   'ver' => '0.9.7',
		   'src' => 'tar.gz',
		  },
  );

our %office_gnome_libs =
  (
   'libgda'      => '1.2.1',
   'libgnomedb'  => '1.2.1',
   'libgdamm'    => '1.3.6',
  );

our %office_gnome =
  (
   'gnumeric'  => '1.4.3',
   'dia'       => '0.94',
   'glom'      => '0.8.18',
   'mergeant'  => '0.52',
   'planner'   => '0.13',
  );

#
# End Config Options
################################################################################
