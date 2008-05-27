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
             'url' => 'http://kent.dl.sourceforge.net/sourceforge/scons/',
             'ver' => '0.97',
			 'dir' => 'tools/scons',
			 'tar' => 'scons-0.97.tar.gz',
             'var' => 'VERSION',
                  },
   'boost-jam'    => {
             'url' => 'http://kent.dl.sourceforge.net/sourceforge/boost',
             'ver' => '3.1.16',
			 'dir' => 'tools/boost-jam',
			 'tar' => 'boost-jam-3.1.16.tgz',
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
			 'ver' => '0.6c8',
			 'url' => 'http://pypi.python.org/packages/source/s/setuptools',
			 'dir' => 'tools/setuptools',
			 'tar' => 'setuptools-0.6c8.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
    'slapt-get'           => {
			 'ver' => '0.9.12d',
			 'url' => 'http://software.jaos.org/source/slapt-get/',
			 'dir' => 'tools/slapt-get',
			 'tar' => 'slapt-get-0.9.12d.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
 );
