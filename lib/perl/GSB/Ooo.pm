package GSB::Ooo;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%ooo_packages);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# Building tools
our %ooo_packages =
  (
   'ooo-build'    => {
             'ver' => '2.3.1.2',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://download.go-oo.org/OOG680/',
	     'tar' => 'ooo-build-2.3.1.2.tar.gz',
             'var' => 'VERSION',
                  },
   'mdbtools'    => {
             'ver' => '0.6pre1',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://download.go-oo.org/SRC680/',
	     'tar' => 'mdbtools-0.6pre1.tar.gz',
             'var' => 'VERSION',
                  },
   'oog680-core'    => {
             'ver' => 'm9',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/OOG680/',
	     'tar' => 'oog680-m9-core.tar.bz2',
             'var' => 'VERSION',
                  },
   'oog680-system'    => {
             'ver' => 'm9',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/OOG680/',
	     'tar' => 'oog680-m9-system.tar.bz2',
             'var' => 'VERSION',
                  },
   'extras'    => {
             'ver' => '2',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/SRC680/',
	     'tar' => 'extras-2.tar.bz2',
             'var' => 'VERSION',
                  },
   'biblio'    => {
             'ver' => '1',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/SRC680/',
	     'tar' => 'biblio.tar.bz2',
             'var' => 'VERSION',
                  },
   'lp_solve'    => {
             'ver' => '5.5.0.10',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/SRC680/',
	     'tar' => 'lp_solve_5.5.0.10_source.tar.gz',
             'var' => 'VERSION',
                  },
   'libwpd'    => {
             'ver' => '0.8.12',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://download.go-oo.org/libwpd',
	     'tar' => 'libwpd-0.8.12.tar.gz',
             'var' => 'VERSION',
                  },
   'libwps'    => {
             'ver' => '0.1.0',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/SRC680/',
	     'tar' => 'libwps-0.1.0.tar.gz',
             'var' => 'VERSION',
                  },
   'libwpg'    => {
             'ver' => '0.1.0',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/SRC680/',
	     'tar' => 'libwpg-0.1.0.tar.gz',
             'var' => 'VERSION',
                  },
   'oox'    => {
             'ver' => '2007-09-05',
	     'dir' => 'ooo/openoffice.org',
             'url' => 'http://go-oo.org/packages/SRC680/',
	     'tar' => 'oox.2007-09-05.tar.bz2',
             'var' => 'VERSION',
                  },
   'IO-Compress-Base'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/',
	     'tar' => 'IO-Compress-Base-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'Compress-Raw-Zlib'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/',
	     'tar' => 'Compress-Raw-Zlib-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'IO-Compress-Zlib'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/',
	     'tar' => 'IO-Compress-Zlib-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'Compress-Zlib'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/',
	     'tar' => 'Compress-Zlib-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'Archive-Zip'    => {
             'ver' => '1.23',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/',
	     'tar' => 'Archive-Zip-1.23.tar.gz',
             'var' => 'VERSION',
                  },
 );
