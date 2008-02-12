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
