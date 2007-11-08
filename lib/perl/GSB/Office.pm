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

our %office =
  (
   'abiword' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.5.1/source/',
		 'ver' => '2.5.1',
		 'src' => 'tar.gz'
		},
   'gnucash' => {
                 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnucash/',
                 'ver' => '2.0.5',
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
   'aqbanking' => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/aqbanking/',
                   'ver' => '2.3.3',
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
   'g-wrap'       => {
                   'url' => 'http://savannah.nongnu.org/download/g-wrap/',
                   'ver' => '1.9.7',
                   'src' => 'tar.gz',
                  },
   'gwenhywfar'    => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gwenhywfar/',
                   'ver' => '2.6.2',
                   'src' => 'tar.gz',
                  },
   'ktoblzcheck' => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/ktoblzcheck/',
                   'ver' => '1.13',
                   'src' => 'tar.gz',
                  },
   'libchipcard2' => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libchipcard/',
                   'ver' => '2.1.9',
                   'src' => 'tar.gz',
                  },
   'libofx'    => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libofx/',
                   'ver' => '0.8.3',
                   'src' => 'tar.gz',
                  },
   'libwmf'    => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/wvware/',
		   'ver' => '0.2.8.4',
		   'src' => 'tar.gz',
		  },
   'libwpd'    => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libwpd/',
		   'ver' => '0.8.9',
		   'src' => 'tar.gz',
		  },
   'OpenSP'   => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/openjade/',
                   'ver' => '1.5.2',
                   'src' => 'tar.gz',
                  },
   'ots'       => {
		   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libots/',
		   'ver' => '0.4.2',
		   'src' => 'tar.gz',
		  },
   'psiconv'   => {
		   'url' => 'http://software.frodo.looijaard.name/psiconv/files/',
		   'ver' => '0.9.8',
		   'src' => 'tar.gz',
		  },
  );

our %office_gnome_libs =
  (
   'goffice'     => '0.4.3',
   'libgda'      => '3.1.1',
   'libgnomedb'  => '3.1.1',
   'libgdamm'    => '1.3.7',
   'present'     => '0.0.3',
  );

our %office_gnome =
  (
   'gnumeric'  => '1.7.12',
   'dia'       => '0.96.1',
   'glom'      => '1.6.1',
   'mergeant'  => '0.66',
   'planner'   => '0.14.2',
  );

#
# End Config Options
################################################################################
