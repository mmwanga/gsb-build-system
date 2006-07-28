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
			  'dir' => 'extras/apps/gaim',
			  'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gaim-encryption/',
			  'src' => 'tar.gz',
			  'var' => 'GAIMENC',
			 },
   'gnome-games-extra-data' => {
				'ver' => '2.14.0',
				'dir' => 'gnome/desktop/gnome-games',
				'url' => 'http://ftp.gnome.org/pub/GNOME/sources/gnome-games-extra-data/2.14/',
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
   'evolution' => {
                           'ver' => '2.6.2',
                           'dir' => 'extras/applets_extensions/mail-notification',
                           'url' => 'http://ftp.gnome.org/pub/GNOME/sources/evolution/2.6/',
                           'src' => 'tar.bz2',
                           'var' => 'EVO_VER',
                          },
    'pavucontrol'       => {
                          'ver' => '0.9.2',
                          'dir' => 'extras/apps/pulseaudio-tools',
                          'url' => 'http://0pointer.de/lennart/projects/pavucontrol/',
                          'src' => 'tar.gz',
                          'var' => 'PA_VU_CONTROL',
                         },
    'pavumeter'       => {
                          'ver' => '0.9.2',
                          'dir' => 'extras/apps/pulseaudio-tools',
                          'url' => 'http://0pointer.de/lennart/projects/pavumeter/',
                          'src' => 'tar.gz',
                          'var' => 'PA_VU_METER',
                         },
    'padevchooser'       => {
                          'ver' => '0.9.2',
                          'dir' => 'extras/apps/pulseaudio-tools',
                          'url' => 'http://0pointer.de/lennart/projects/padevchooser/',
                          'src' => 'tar.gz',
                          'var' => 'PA_DEV_CHOOSER',
                         },
    'paman'       => {
                          'ver' => '0.9.2',
                          'dir' => 'extras/apps/pulseaudio-tools',
                          'url' => 'http://0pointer.de/lennart/projects/paman/',
                          'src' => 'tar.gz',
                          'var' => 'PA_MAN',
                         },



  );


# iso-codes isn't a double tarball but its here temporarily because of how its named.
our %double_tarballs_url =
  (
   'iso-codes'                 => {
				   'ver' => '0.52',
				   'dir' => 'gnome/desktop_reqs/iso-codes',
				   'url' => 'http://http.us.debian.org/debian/pool/main/i/iso-codes/',
				   'tar' => 'iso-codes_0.52.orig.tar.gz',
				   'var' => 'VERSION',
				  },
   'nvu'                 => {
				   'ver' => '1.0',
				   'dir' => 'extras/apps/nvu',
				   'url' => 'http://cvs.nvu.com/download/',
				   'tar' => 'nvu-1.0-sources.tar.bz2',
				   'var' => 'VERSION',
				  },
  );
