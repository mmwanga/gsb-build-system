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
			  'ver' => '2.38',
			  'dir' => 'other/gaim',
			  'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gaim-encryption/',
			  'src' => 'tar.gz',
			  'var' => 'GAIMENC',
			 },
   'gnome-games-extra-data' => {
				'ver' => '2.12.0',
				'dir' => 'gnome/desktop/gnome-games',
				'url' => 'http://ftp.gnome.org/pub/GNOME/sources/gnome-games-extra-data/2.12/',
				'src' => 'tar.bz2',
				'var' => 'EXTRAVERSION',
			       },
   'divx4linux'       => {
			  'ver' => 'std-20030428',
			  'dir' => 'gnome/desktop_reqs/divx4linux',
			  'url' => 'http://download.divx.com/divx/',
			  'src' => 'tar.gz',
			  'var' => 'TVERSION',
			 },
  );


# iso-codes isn't a double tarball but its here temporarily because of how its named.
our %double_tarballs_url =
  (
   'clearlooks-metacity'       => {
				   'ver' => '0.6',
				   'dir' => 'gnome/themes/clearlooks',
				   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/clearlooks/',
				   'tar' => 'clearlooks-metacity-0.6.tar.gz',
				   'var' => 'MVERSION',
				  },
   'iso-codes'                 => {
				   'ver' => '0.47',
				   'dir' => 'gnome/desktop_reqs/iso-codes',
				   'url' => 'http://http.us.debian.org/debian/pool/main/i/iso-codes/',
				   'tar' => 'iso-codes_0.47.orig.tar.gz',
				   'var' => 'VERSION',
				  },
   'nvu'                 => {
				   'ver' => '1.0',
				   'dir' => 'other/nvu',
				   'url' => 'http://cvs.nvu.com/download/',
				   'tar' => 'nvu-1.0-sources.tar.bz2',
				   'var' => 'VERSION',
				  },
  );
