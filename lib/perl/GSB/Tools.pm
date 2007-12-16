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
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/scons/',
             'ver' => '0.97',
			 'dir' => 'tools/scons',
			 'tar' => 'scons-0.97.tar.gz',
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
			 'ver' => '0.6c7',
			 'url' => 'http://pypi.python.org/packages/source/s/setuptools',
			 'dir' => 'tools/setuptools',
			 'tar' => 'setuptools-0.6c7.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
    'slapt-get'           => {
			 'ver' => '0.9.12c',
			 'url' => 'http://software.jaos.org/source/slapt-get/',
			 'dir' => 'tools/slapt-get',
			 'tar' => 'slapt-get-0.9.12c.tar.gz',
			 'src' => 'tar.gz',
             'var' => 'VERSION',
			     },
 );
