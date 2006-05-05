package GSB::GStreamer;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%gstreamer %gst_diff_name %gst_other %gst_libs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GSTREAMER
#

our %gstreamer =
  (
   'gst-plugins-base'  => {
                           'ver' => '0.10.6',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-base/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-good'  => {
                           'ver' => '0.10.3',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-good/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.3',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-ugly'  => {
                           'ver' => '0.10.3',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-ugly/',
                           'src' => 'tar.bz2',
                          },
  );

our %gst_diff_name =
  (
   'gstreamer10'       => {
                           'name' => 'gstreamer',
                           'ver'  => '0.10.5',
                           'url'  => 'http://gstreamer.freedesktop.org/src/gstreamer/',
                           'src'  => 'tar.bz2',
                          },
  );

our %gst_other =
  (
   'gst-ffmpeg'        => {
			   'ver' => '0.10.1',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg/',
			   'src' => 'tar.bz2',
			  },
   'gst-monkeysaudio'  => {
			   'ver' => '0.8.2',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-monkeysaudio/',
			   'src' => 'tar.bz2',
			  },
  );

our %gst_libs =
  (
   'a52dec'            => {
			   'ver' => '0.7.4',
			   'url' => 'http://liba52.sourceforge.net/files/',
			   'src' => 'tar.gz',
			  },
   'avifile'           => {
			   'ver' => '0.7-0.7.45',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/avifile/',
			   'src' => 'tar.bz2',
			  },
   'faac'              => {
			   'ver' => '1.24',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/faac/',
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
			   'src' => 'tar.gz',
			  },
   'libavc1394'        => {
			   'ver' => '0.5.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libavc1394/',
			   'src' => 'tar.gz',
			  },
   'libcdaudio'        => {
			   'ver' => '0.99.12p2',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libcdaudio/',
			   'src' => 'tar.gz',
			  },
   'libcddb'           => {
			   'ver' => '1.2.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libcddb/',
			   'src' => 'tar.bz2',
			  },
   'libcdio'           => {
			   'ver' => '0.77',
			   'url' => 'http://ftp.gnu.org/gnu/libcdio/',
			   'src' => 'tar.gz',
			  },
   'libdv'             => {
			   'ver' => '0.104',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libdv/',
			   'src' => 'tar.gz',
			  },
   'libdvbpsi4'        => {
			   'ver' => '0.1.5',
			   'url' => 'http://download.videolan.org/pub/libdvbpsi/0.1.5/',
			   'src' => 'tar.bz2',
			  },
   'libdvdcss'         => {
			   'ver' => '1.2.9',
			   'url' => 'http://download.videolan.org/pub/libdvdcss/1.2.9/',
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
			   'ver' => '0.9.5',
			   'url' => 'http://www.dtek.chalmers.se/groups/dvd/dist/',
			   'src' => 'tar.gz',
			  },
   'libebml'           => {
			   'ver' => '0.7.6',
			   'url' => 'http://dl.matroska.org/downloads/libebml/',
			   'src' => 'tar.bz2',
			  },
   'libfame'           => {
			   'ver' => '0.9.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/fame/',
			   'src' => 'tar.gz',
                          },
   'libiec61883'       => {
                           'ver' => '1.0.0',
                           'url' => 'http://www.linux1394.org/dl/',
                           'src' => 'tar.gz',
                          },
   'libmatroska'       => {
			   'ver' => '0.8.0',
			   'url' => 'http://dl.matroska.org/downloads/libmatroska/',
			   'src' => 'tar.bz2',
			  },
   'libmms'            => {
			   'ver' => '0.2',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libmms/',
			   'src' => 'tar.gz',
			  },
   'libmovtar'         => {
			   'ver' => '0.1.3',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/',
			   'src' => 'tar.gz',
			  },
   'libmpcdec'       => {
			   'ver' => '1.2.2',
			   'url' => 'http://files.musepack.net/source/',
			   'src' => 'tar.bz2',
			  },
   'libmusicbrainz'    => {
			   'ver' => '2.1.2',
			   'url' => 'http://musicbrainz.org/ftpmirror/pub/musicbrainz/',
			   'src' => 'tar.gz',
			  },
   'liboil'            => {
			   'ver' => '0.3.8',
			   'url' => 'http://liboil.freedesktop.org/download/',
			   'src' => 'tar.gz',
			  },
   'libquicktime'      => {
			   'ver' => '0.9.8',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libquicktime/',
			   'src' => 'tar.gz',
			  },
   'libraw1394'        => {
			   'ver' => '1.2.1',
			   'url' => 'http://www.linux1394.org/dl/',
			   'src' => 'tar.gz',
			  },
   'libsamplerate'     => {
			   'ver' => '0.1.2',
			   'url' => 'http://www.mega-nerd.com/SRC/',
			   'src' => 'tar.gz',
			  },
   'libsndfile'        => {
			   'ver' => '1.0.14',
			   'url' => 'http://www.mega-nerd.com/libsndfile/',
			   'src' => 'tar.gz',
			  },
   'libtheora'         => {
			   'ver' => '1.0alpha5',
			   'url' => 'http://downloads.xiph.org/releases/theora/',
			   'src' => 'tar.gz',
			  },
   'libvisual'         => {
			   'ver' => '0.4.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libvisual/',
			   'src' => 'tar.gz',
			  },
   'libvisual-nebulus' => {
			   'ver' => '0.1.4',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libvisual/',
			   'src' => 'tar.gz',
			  },
   'libvisual-plugins' => {
			   'ver' => '0.4.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libvisual/',
			   'src' => 'tar.gz',
			  },
   'mac'               => {
                           'ver' => '3.99-u4-b4',
                           'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mac-port/',
                           'src' => 'tar.gz',
                          },
   'mjpegtools'        => {
			   'ver' => '1.8.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/',
			   'src' => 'tar.gz',
			  },
   'mpeg2dec'          => {
			   'ver' => '0.4.0b',
			   'url' => 'http://libmpeg2.sourceforge.net/files/',
			   'src' => 'tar.gz',
			  },
   'mpeg4ip'           => {
			   'ver' => '1.4.1',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mpeg4ip/',
			   'src' => 'tar.gz',
			  },
   'normalize'         => {
			   'ver' => '0.7.6',
			   'url' => 'http://www1.cs.columbia.edu/~cvaill/normalize/',
			   'src' => 'tar.bz2',
			  },
   'openslp'           => {
			   'ver' => '1.3.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/openslp/',
			   'src' => 'tar.gz',
			  },
   'polypaudio'        => {
			   'ver' => '0.8',
			   'url' => 'http://0pointer.de/lennart/projects/polypaudio/',
			   'src' => 'tar.gz',
			  },
   'swfdec'            => {
			   'ver' => '0.3.6',
			   'url' => 'http://www.schleef.org/swfdec/download/',
			   'src' => 'tar.gz',
			  },
   'transcode'         => {
			   'ver' => '1.0.2',
			   'url' => 'http://www.jakemsr.com/transcode/',
			   'src' => 'tar.gz',
			  },
   'xvidcore'          => {
			   'ver' => '1.1.0',
			   'url' => 'http://downloads.xvid.org/downloads/',
			   'src' => 'tar.bz2',
			  },
  );

#
# End Config Options
################################################################################
