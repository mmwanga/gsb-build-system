package GSB::GStreamer;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%gstremer %gstreamer_libs);
our @EXPORT_OK = qw();
our $VERSION = 0.03;

################################################################################
# Config Options for GSTREAMER
#

our %gstreamer =
  (
   'gstreamer'         => '0.8.9',
   'gst-plugins'       => '0.8.7',
   'gst-ffmpeg'        => '0.8.3',
   'gst-monkeysaudio'  => '0.8.0',
  );

our %gstreamer_libs =
  (
   'a52dec'            => {
			   'ver' => '0.7.4',
			   'url' => 'http://liba52.sourceforge.net/files/',
			   'src' => 'tar.gz',
			  },
   'avifile'           => {
			   'ver' => '0.7-0.7.41',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/avifile/',
			   'src' => 'tar.gz',
			  },
   # do not want VERSION updated for divx4linux
   'divx4linux'        => {
			   'ver' => 'std-20030428',
			   'url' => 'http://download.divx.com/divx/',
			   'src' => 'tar.gz',
			  },
   'faac'              => {
			   'ver' => '1.24',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/faac/faac-1.24.tar.gz',
			   'src' => 'tar.gz',
			  },
   'faad2'             => {
			   'ver' => '2.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/faac/',
			   'src' => 'zip',
			  },
   'ffmpeg'            => {
			   'ver' => '0.4.9-pre1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/ffmpeg/',
			   'src' => 'tar.gz',
			  },
   'id3lib'            => {
			   'ver' => '3.8.3',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/id3lib/',
			   'src' => 'tar.gz',
			  },
   'lame'              => {
			   'ver' => '3.96.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/lame/',
			   'src' => 'tar,gz',
			  },
   'libavc1394'        => {
			   'ver' => '0.4.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libavc1394/',
			   'src' => 'tar.gz',
			  },
   'libcdaudio'        => {
			   'ver' => '0.99.12',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libcdaudio/',
			   'src' => 'tar.gz',
			  },
   'libcddb'           => {
			   'ver' => '0.9.6',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libcddb/',
			   'src' => 'tar.gz',
			  },
   'libcdio'           => {
			   'ver' => '0.72',
			   'url' => 'http://ftp.gnu.org/gnu/libcdio/',
			   'src' => 'tar.gz',
			  },
   'libdv'             => {
			   'ver' => '0.104',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libdv/',
			   'src' => 'tar.gz',
			  },
   'libdvbpsi3'        => {
			   'ver' => '0.1.4'.
			   'url' => 'http://download.videolan.org/pub/libdvbpsi/0.1.4/',
			   'src' => 'tar.bz2',
			  },
   'libdvdcss'         => {
			   'ver' => '1.2.8',
			   'url' => 'http://download.videolan.org/pub/libdvdcss/1.2.8/',
			   'src' => 'tar.bz2',
			  },
   'libdvdnav'         => {
			   'ver' => '0.1.10',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/dvd/',
			   'src' => 'tar.gz',
			  },
   'libdvdplay'        => {
			   'ver' => '1.0.1',
			   'url' => 'http://download.videolan.org/pub/libdvdplay/1.0.1/',
			   'src' => 'tar.bz2',
			  },
   'libdvdread'        => {
			   'ver' => '0.9.4',
			   'url' => 'http://www.dtek.chalmers.se/groups/dvd/dist/',
			   'src' => 'tar.gz',
			  },
   'libebml'           => {
			   'ver' => '0.7.3',
			   'url' => 'http://dl.matroska.org/downloads/libebml/',
			   'src' => 'tar.bz2',
			  },
   'libfame'           => {
			   'ver' => '0.9.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/fame/',
			   'src' => 'tar.gz',
			  },
   'libmatroska'       => {
			   'ver' => '0.7.5',
			   'url' => 'http://dl.matroska.org/downloads/libmatroska/',
			   'src' => 'tar.bz2',
			  },
   'libmms'            => {
			   'ver' => '0.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libmms/',
			   'src' => 'tar.gz',
			  },
   'libmovtar'         => {
			   'ver' => '0.1.3',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/',
			   'url1' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/jpeg-mmx-0.1.5.tar.gz',
			   'src' => 'tar.gz',
			  },
   'libmusepack'       => {
			   'ver' => '1.1',
			   'url' => 'http://files.musepack.net/source/libmusepack-1.1.tar.bz2',
			   'src' => 'tar.bz2',
			  },
   'libmusicbrainz'    => {
			   'ver' => '2.1.1',
			   'url' => 'ftp://ftp.musicbrainz.org/pub/musicbrainz/',
			   'src' => 'tar.gz',
			  },
   'liboil'            => {
			   'ver' => 'liboil',
			   'url' => 'http://www.schleef.org/liboil/download/',
			   'src' => 'tar.gz',
			  },
   'libquicktime'      => {
			   'ver' => '0.9.4',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libquicktime/',
			   'src' => 'tar.gz',
			  },
   'libraw1394'        => {
			   'ver' => '1.1.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libraw1394/',
			   'src' => 'tar.gz',
			  },
   'libsamplerate'     => {
			   'ver' => '0.1.2',
			   'url' => 'http://www.mega-nerd.com/SRC/',
			   'src' => 'tar.gz',
			  },
   'libsndfile'        => {
			   'ver' => '1.0.11',
			   'url' => 'http://www.mega-nerd.com/libsndfile/',
			   'src' => 'tar.gz',
			  },
   'libtheora'         => {
			   'ver' => '1.0alpha4',
			   'url' => 'http://downloads.xiph.org/releases/',
			   'src' => 'tar.gz',
			  },
   'libvisual'         => {
			   'ver' => '0.1.7',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libvisual/',
			   'src' => 'tar.gz',
			  },
   'libvisual-nebulus' => {
			   'ver' => '0.1.4',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libvisual/',
			   'src' => 'tar.gz',
			  },
   'libvisual-plugins' => {
			   'ver' => '0.1.7',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libvisual/',
			   'src' => 'tar.gz',
			  },
   'mjpegtools'        => {
			   'ver' => '1.6.2',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/',
			   'src' => 'tar.gz',
			  },
   'mpeg2dec'          => {
			   'ver' => '0.4.0b',
			   'url' => 'http://libmpeg2.sourceforge.net/files/',
			   'src' => 'tar.gz',
			  },
   'mpeg4ip'           => {
			   'ver' => '1.2',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mpeg4ip/',
			   'src' => 'tar.gz',
			  },
   'normalize'         => {
			   'ver' => '0.7.6',
			   'url' => 'http://www1.cs.columbia.edu/~cvaill/normalize/',
			   'src' => 'tar.bz2',
			  },
   'openslp'           => {
			   'ver' => '1.2.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/openslp/',
			   'src' => 'tar.gz',
			  },
   'polypaudio'        => {
			   'ver' => '0.7',
			   'url' => 'http://0pointer.de/lennart/projects/polypaudio/',
			   'src' => 'tar.gz',
			  },
   'swfdec'            => {
			  'ver' => '0.3.2',
			   'url' => 'http://www.schleef.org/swfdec/download/',
			   'src' => 'tar.gz',
			  },
   'transcode'         => {
			   'ver' => '0.6.12',
			   'url' => 'http://www.jakemsr.com/transcode/',
			   'src' => 'tar.gz',
			  },
   'xvidcore'          => {
			   'ver' => '1.0.3',
			   'url' => 'http://files.xvid.org/downloads/',
			   'src' => 'tar.bz2',
			  },
  );

#
# End Config Options
################################################################################
