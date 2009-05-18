package GSB::Tools;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%tools);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# Building tools
our %tools =
  (
   'scons'    => {
             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/scons/',
             'ver' => '1.2.0',
			 'dir' => 'tools/scons',
			 'tar' => 'scons-1.2.0.tar.gz',
             'var' => 'VERSION',
                  },
   'boost-jam'    => {
             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/boost',
             'ver' => '3.1.17',
			 'dir' => 'tools/boost-jam',
			 'tar' => 'boost-jam-3.1.17.tgz',
             'var' => 'VERSION',
                  },
   'cabextract'           => {
			 'ver' => '1.2',
			 'url' => 'http://www.cabextract.org.uk',
			 'dir' => 'tools/cabextract',
			 'tar' => 'cabextract-1.2.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
   'setuptools'           => {
			 'ver' => '0.6c9',
			 'url' => 'http://pypi.python.org/packages/source/s/setuptools',
			 'dir' => 'tools/setuptools',
			 'tar' => 'setuptools-0.6c9.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
    'slapt-get'           => {
			 'ver' => '0.10.1a',
			 'url' => 'http://software.jaos.org/source/slapt-get/',
			 'dir' => 'tools/slapt-get',
			 'tar' => 'slapt-get-0.10.1a.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
 );
