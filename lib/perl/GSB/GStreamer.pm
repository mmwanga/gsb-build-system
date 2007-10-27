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
                           'ver' => '0.10.14',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-base/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-good'  => {
                           'ver' => '0.10.6',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-good/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.4',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-ugly'  => {
                           'ver' => '0.10.5',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-ugly/',
                           'src' => 'tar.bz2',
                          },
  );

our %gst_diff_name =
  (
   'gstreamer10'       => {
                           'name' => 'gstreamer',
                           'ver'  => '0.10.14',
                           'url'  => 'http://gstreamer.freedesktop.org/src/gstreamer/',
                           'src'  => 'tar.bz2',
                          },
  );

our %gst_other =
  (
   'gst-ffmpeg'        => {
			   'ver' => '0.10.2',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg/',
			   'src' => 'tar.bz2',
			  },
   'gst-monkeysaudio'  => {
			   'ver' => '0.8.2',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-monkeysaudio/',
			   'src' => 'tar.bz2',
			  },
   'gst-fluendo-mp3'  => {
			   'ver' => '0.10.5',
			   'url' => 'http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3/',
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
   'faac'              => {
			   'ver' => '1.25',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/faac/',
			   'src' => 'tar.gz',
			  },
   'faad2'             => {
			   'ver' => '2.5',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/faac/',
			   'src' => 'zip',
			  },
   'lame'              => {
			   'ver' => '3.97',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/lame/',
			   'src' => 'tar.gz',
			  },
   'libavc1394'        => {
			   'ver' => '0.5.3',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libavc1394/',
			   'src' => 'tar.gz',
			  },
   'libcddb'           => {
			   'ver' => '1.3.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libcddb/',
			   'src' => 'tar.bz2',
			  },
   'libcdio'           => {
			   'ver' => '0.78.2',
			   'url' => 'http://ftp.gnu.org/gnu/libcdio/',
			   'src' => 'tar.gz',
			  },
   'libdv'             => {
			   'ver' => '1.0.0',
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
   'libdvdread'        => {
			   'ver' => '0.9.7',
			   'url' => 'http://www.dtek.chalmers.se/groups/dvd/dist/',
			   'src' => 'tar.gz',
			  },
   'libebml'           => {
			   'ver' => '0.7.7',
			   'url' => 'http://dl.matroska.org/downloads/libebml/',
			   'src' => 'tar.bz2',
			  },
   'libelf'            => {
			   'ver' => '0.8.10',
			   'url' => 'http://www.mr511.de/software/',
			   'src' => 'tar.gz',
			  },
   'libexif-gtk'         => {
			     'ver' => '0.3.5',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libexif/',
			     'src' => 'tar.bz2',
			    },
   'libgphoto2'          => {
			     'ver' => '2.4.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'libgpod'              => {
                             'ver' => '0.5.2',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtkpod/',
                             'src' => 'tar.gz',
                            },
   'libiec61883'       => {
                           'ver' => '1.1.0',
                           'url' => 'http://www.linux1394.org/dl/',
                           'src' => 'tar.gz',
                          },
   'libmatroska'       => {
			   'ver' => '0.8.1',
			   'url' => 'http://dl.matroska.org/downloads/libmatroska/',
			   'src' => 'tar.bz2',
			  },
   'libmms'            => {
			   'ver' => '0.3',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libmms/',
			   'src' => 'tar.gz',
			  },
   'libmpcdec'       => {
			   'ver' => '1.2.6',
			   'url' => 'http://files.musepack.net/source/',
			   'src' => 'tar.bz2',
			  },
   'liboil'            => {
			   'ver' => '0.3.12',
			   'url' => 'http://liboil.freedesktop.org/download/',
			   'src' => 'tar.gz',
			  },
   'libopenraw'        => {
			   'ver' => '0.0.2',
			   'url' => 'http://libopenraw.freedesktop.org/download/',
			   'src' => 'tar.gz',
			  },
   'libquicktime'      => {
			   'ver' => '1.0.0',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libquicktime/',
			   'src' => 'tar.gz',
			  },
   'libraw1394'        => {
			   'ver' => '1.2.1',
			   'url' => 'http://www.linux1394.org/dl/',
			   'src' => 'tar.gz',
			  },
   'libshout'        => {
			   'ver' => '2.2.2',
			   'url' => 'http://downloads.us.xiph.org/releases/libshout/',
			   'src' => 'tar.gz',
			  },
   'libsndfile'        => {
			   'ver' => '1.0.17',
			   'url' => 'http://www.mega-nerd.com/libsndfile/',
			   'src' => 'tar.gz',
			  },
   'mjpegtools'        => {
			   'ver' => '1.9.0rc2',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mjpeg/',
			   'src' => 'tar.gz',
			  },
   'mpeg2dec'          => {
			   'ver' => '0.4.1',
			   'url' => 'http://libmpeg2.sourceforge.net/files/',
			   'src' => 'tar.gz',
			  },
   'transcode'         => {
			   'ver' => '1.0.4',
			   'url' => 'http://www.jakemsr.com/transcode/',
			   'src' => 'tar.gz',
			  },
   'twolame'           => {
			   'ver' => '0.3.10',
			   'url' => 'http://www.ecs.soton.ac.uk/~njh/twolame/',
			   'src' => 'tar.gz',
			  },
   'wavpack'           => {
			   'ver' => '4.41.0',
			   'url' => 'http://www.wavpack.com/',
			   'src' => 'tar.bz2',
			  },
   'xvidcore'          => {
			   'ver' => '1.1.3',
			   'url' => 'http://downloads.xvid.org/downloads/',
			   'src' => 'tar.bz2',
			  },
   'yasm'           => {
			   'ver' => '0.6.2',
			   'url' => 'http://www.tortall.net/projects/yasm/releases/',
			   'src' => 'tar.gz',
			  },
  );

#
# End Config Options
################################################################################
