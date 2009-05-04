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
  ## Openoffice dependencies
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
   'IO-Compress-Base'    => {
             'ver' => '2.015',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'IO-Compress-Base-2.015.tar.gz',
             'var' => 'VERSION',
                  },
   'Compress-Raw-Zlib'    => {
             'ver' => '2.017',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'Compress-Raw-Zlib-2.017.tar.gz',
             'var' => 'VERSION',
                  },
   'IO-Compress-Zlib'    => {
             'ver' => '2.015',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'IO-Compress-Zlib-2.015.tar.gz',
             'var' => 'VERSION',
                  },
   'Compress-Zlib'    => {
             'ver' => '2.015',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/P/PM/PMQS',
	     'tar' => 'Compress-Zlib-2.015.tar.gz',
             'var' => 'VERSION',
                  },
   'Archive-Zip'    => {
             'ver' => '1.25',
	     'dir' => 'ooo/openoffice-perl',
             'url' => 'http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK',
	     'tar' => 'Archive-Zip-1.25.tar.gz',
             'var' => 'VERSION',
                  },
  ## Openoffice 3.0 files
  'mdbtools'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'mdbtools-0.6pre1.tar.gz',
             'var' => 'VERSION',
                  },
  'biblio'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'biblio.tar.bz2',
             'var' => 'VERSION',
                  },
  'extras'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'extras-3.tar.bz2',
             'var' => 'VERSION',
                  },
  'solver'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/DEV300',
             'tar' => 'scsolver.2008-10-30.tar.bz2',
             'var' => 'VERSION',
             },
  'libwpd'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/libwpd',
             'tar' => 'libwpd-0.8.14.tar.gz',
             'var' => 'VERSION',
             },
  'libwps'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'libwps-0.1.2.tar.gz',
             'var' => 'VERSION',
                  },
  'libwpg'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'libwpg-0.1.3.tar.gz',
             'var' => 'VERSION',
                  },
  'ooo-build'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo-build-3.0.1.3.tar.gz',
             'var' => 'VERSION',
                  },
  'ooo300-m15-ure'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-ure.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-sdk'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-sdk.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-base'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-base.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-calc'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-calc.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-l10n'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-l10n.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-writer'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-writer.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-impress'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-impress.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-artwork'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-artwork.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-filters'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-filters.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-testing'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-testing.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-bootstrap'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-bootstrap.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-libs_gui'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-libs_gui.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-libs_core'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-libs_core.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-libs_extern'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-libs_extern.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-components'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-components.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-postprocess'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-postprocess.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-libs_extern_sys'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-libs_extern_sys.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m15-extensions'    => {
             'ver' => '3.0.1.3',
             'dir' => 'ooo/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m15-extensions.tar.bz2',
             'var' => 'VERSION',
                  },

 );
