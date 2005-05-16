package GSB::DoubleTar;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%double_tarballs %double_tarballs_url);
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
			  'ver' => '2.37',
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


# iso-codes isn't a double tarball but its here temporarily
our %double_tarballs_url =
  (
   'clearlooks-metacity'       => {
				   'ver' => '0.5.2a',
				   'dir' => 'gnome/themes/clearlooks',
				   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/clearlooks/',
				   'tar' => 'clearlooks-metacity-0.5.2a.tar.gz',
				   'var' => 'MVERSION',
				  },
   'iso-codes'                 => {
				   'ver' => '0.46',
				   'dir' => 'office/libs/iso-codes',
				   'url' => 'http://http.us.debian.org/debian/pool/main/i/iso-codes/',
				   'tar' => 'iso-codes_0.46.orig.tar.gz',
				   'var' => 'VERSION',
				  },
  );
