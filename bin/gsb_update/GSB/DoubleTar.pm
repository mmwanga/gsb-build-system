package GSB::DoubleTar;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%double_tarballs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


our %double_tarballs =
  (
   'jpeg-mmx'         => {
			  'ver' => '0.1.5',
			  'dir' => 'gnome/desktop_reqs/libmovtar',
			  'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/',
			  'src' => 'tar.gz',
			  'var' => 'JPEGMMXV',
			 },
   'gaim-encryption'  => {
			  'ver' => '2.36',
			  'dir' => 'other/gaim',
			  'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gaim-encryption/',
			  'src' => 'tar.gz',
			  'var' => 'GAIMENC',
			 },

   'divx4linux'       => {
			  'ver' => 'std-20030428',
			  'dir' => 'gnome/desktop_reqs/divx4linux',
			  'url' => 'http://download.divx.com/divx/',
			  'src' => 'tar.gz',
			  'var' => 'TVERSION',
			 },
  );
