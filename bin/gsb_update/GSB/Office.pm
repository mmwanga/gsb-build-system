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
#our %office =
#  (
#   'abiword' => {
#		 'url' => "http://www.abisource.com/downloads/abiword/2.2.8/source/",
#		 'ver' => '2.2.8',
#		 'src' => 'tar.gz'
#		},
#  );

our %office_libs =
  (
   'aiksaurus' => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/aiksaurus/',
		   'ver' => '1.2.1',
		   'src' => 'tar.gz',
		  },
   'enchant'   => {
		   'url' => 'http://www.abisource.com/downloads/enchant/1.1.6/',
		   'ver' => '1.1.6',
		   'src' => 'tar.gz',
		  },
   'eps'       => {
		   'url' => 'http://www.inter7.com/eps/',
		   'ver' => '1.5',
		   'src' => 'tar.gz',
		  },
   'fribidi'   => {
		   'url' => 'http://fribidi.org/download/',
		   'ver' => '0.10.5',
		   'src' => 'tar.gz',
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
   'PyXML'     => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/pyxml/',
		   'ver' => '0.8.4',
		   'src' => 'tar.gz',
		  },
  );

our %office_gnome_libs =
  (
   'goffice'     => '0.0.3',
   'libgda'      => '1.3.91',
   'libgnomedb'  => '1.3.91',
   'libgdamm'    => '1.3.7',
   'present'     => '0.0.2',
  );

our %office_gnome =
  (
   'abiword'   => '2.3.5',
   'gnumeric'  => '1.5.3',
   'dia'       => '0.94',
   'glom'      => '0.9.0',
   'mergeant'  => '0.62',
   'planner'   => '0.13',
  );

#
# End Config Options
################################################################################
