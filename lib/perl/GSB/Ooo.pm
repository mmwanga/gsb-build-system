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
  'apache-ant'    => {
             'ver' => '1.7.1',
	     'dir' => 'ooo/apache-ant',
             'url' => 'http://archive.apache.org/dist/ant/source/',
	     'tar' => 'apache-ant-1.7.1-src.tar.bz2',
             'var' => 'VERSION',
                  },
  'junit.jar'    => {
             'ver' => '1.7.1',
	     'dir' => 'ooo/apache-ant',
             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/junit',
	     'tar' => 'junit-4.5.jar',
             'var' => 'VERSION',
                  },
  'mdbtools'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://download.go-oo.org/SRC680',
	     'tar' => 'mdbtools-0.6pre1.tar.gz',
             'var' => 'VERSION',
                  },
   'ooh680-core'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/OOH680',
	     'tar' => 'ooh680-m17-core.tar.bz2',
             'var' => 'VERSION',
                  },
   'oog680-system'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/OOH680',
	     'tar' => 'ooh680-m17-system.tar.bz2',
             'var' => 'VERSION',
                  },
   'oog680-lang'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/OOH680',
	     'tar' => 'ooh680-m17-lang.tar.bz2',
             'var' => 'VERSION',
                  },
   'extras'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'extras-2.tar.bz2',
             'var' => 'VERSION',
                  },
   'biblio'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'biblio.tar.bz2',
             'var' => 'VERSION',
                  },
   'lp_solve'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'lp_solve_5.5.0.10_source.tar.gz',
             'var' => 'VERSION',
                  },
   'libwpd'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://download.go-oo.org/libwpd',
	     'tar' => 'libwpd-0.8.14.tar.gz',
             'var' => 'VERSION',
                  },
   'libwps'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'libwps-0.1.2.tar.gz',
             'var' => 'VERSION',
                  },
   'libwpg'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'libwpg-0.1.2.tar.gz',
             'var' => 'VERSION',
                  },
   'oox'    => {
             'ver' => '2008-02-29',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'oox.2008-02-29.tar.bz2',
             'var' => 'VERSION',
                  },
   'writerfilter'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://go-oo.org/packages/SRC680',
	     'tar' => 'writerfilter.2008-02-29.tar.bz2',
             'var' => 'VERSION',
                  },
   'IO-Compress-Base'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'IO-Compress-Base-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'Compress-Raw-Zlib'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'Compress-Raw-Zlib-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'IO-Compress-Zlib'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'IO-Compress-Zlib-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'Compress-Zlib'    => {
             'ver' => '2.008',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'Compress-Zlib-2.008.tar.gz',
             'var' => 'VERSION',
                  },
   'Archive-Zip'    => {
             'ver' => '1.23',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK',
	     'tar' => 'Archive-Zip-1.23.tar.gz',
             'var' => 'VERSION',
                  },
 'openclipart'    => {
             'ver' => '0.18',
	     'dir' => 'ooo/openclipart',
             'url' => 'http://openclipart.org/downloads/0.18',
	     'tar' => 'openclipart-0.18-svgonly.tar.bz2',
             'var' => 'VERSION',
                 },
  'ooo-build'    => {
             'ver' => '2.4.1.10',
	     'dir' => 'ooo/openoffice',
             'url' => 'http://download.go-oo.org/OOO300',
	     'tar' => 'ooo-build-2.4.1.10.tar.gz',
             'var' => 'VERSION',
                  },
 );
