package GSB::Fonts;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%fonts);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# Microsoft TrueType Core Fonts
our %fonts =
  (
   'andale32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'andale32.exe',
             'var' => 'VERSION',
                  },
   'arial32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'arial32.exe',
             'var' => 'VERSION',
                  },
   'arialb32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'arialb32.exe',
             'var' => 'VERSION',
                  },
   'comic32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'comic32.exe',
             'var' => 'VERSION',
                  },
   'courie32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'courie32.exe',
             'var' => 'VERSION',
                  },
   'georgi32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'georgi32.exe',
             'var' => 'VERSION',
                  },
   'impact32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'impact32.exe',
             'var' => 'VERSION',
                  },
   'times32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'times32.exe',
             'var' => 'VERSION',
                  },
   'trebuc32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'trebuc32.exe',
             'var' => 'VERSION',
                  },
   'verdan32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'verdan32.exe',
             'var' => 'VERSION',
                  },
   'webdin32'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/corefonts',
             'ver' => '1.0',
			 'dir' => 'themes/msttcorefonts',
			 'tar' => 'webdin32.exe',
             'var' => 'VERSION',
                  },
  );
