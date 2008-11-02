package GSB::Testing;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%testing);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


our %testing = 
  (
  'mdbtools'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'mdbtools-0.6pre1.tar.gz',
             'var' => 'VERSION',
                  },
  'biblio'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'biblio.tar.bz2',
             'var' => 'VERSION',
                  },
  'extras'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'extras-3.tar.bz2',
             'var' => 'VERSION',
                  },
  'solver'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'scsolver.2008-10-07.tar.bz2',
             'var' => 'VERSION',
                  },
  'libwpd'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'libwpd-0.8.14.tar.gz',
             'var' => 'VERSION',
                  },
  'libwps'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'libwps-0.1.2.tar.gz',
             'var' => 'VERSION',
                  },
  'libwpg'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/SRC680',
             'tar' => 'libwpg-0.1.3.tar.gz',
             'var' => 'VERSION',
                  },
  'ooo-build'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo-build-3.0.0.6.tar.gz',
             'var' => 'VERSION',
                  },
  'ooo300-m9-ure'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-ure.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-sdk'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-sdk.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-base'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-base.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-calc'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-calc.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-l10n'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-l10n.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-writer'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-writer.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-impress'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-impress.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-artwork'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-artwork.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-filters'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-filters.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-testing'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-testing.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-bootstrap'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-bootstrap.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-libs_gui'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-libs_gui.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-libs_core'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-libs_core.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-libs_extern'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-libs_extern.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-components'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-components.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-postprocess'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-postprocess.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-libs_extern_sys'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-libs_extern_sys.tar.bz2',
             'var' => 'VERSION',
                  },
  'ooo300-m9-extensions'    => {
             'ver' => '3.0.0.6',
             'dir' => 'testing/openoffice3',
             'url' => 'http://download.go-oo.org/OOO300/',
             'tar' => 'ooo300-m9-extensions.tar.bz2',
             'var' => 'VERSION',
                  },
  );
