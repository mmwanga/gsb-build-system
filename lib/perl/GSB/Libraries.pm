package GSB::Libraries;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%libraries %libraries_gnome %libraries_diff_naming);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


################################################################################
# 
# src/libraries tarballs


our %libraries =
  (
   'a52dec'            => {
	   'ver' => '0.7.4',
	   'url' => 'http://liba52.sourceforge.net/files/',
	   'src' => 'tar.gz',
			  },
   'alsa-lib'            => {
	   'ver' => '1.0.19',
	   'url' => 'ftp://ftp.alsa-project.org/pub/lib/',
	   'src' => 'tar.bz2',
			  },
   'cairo'            => {
	    'ver' => '1.8.6',
	    'url' => 'http://www.cairographics.org/releases',
	    'src' => 'tar.gz',
			    },
   'djvulibre'            => {
			   'ver' => '3.5.21',
			   'url' => 'http://downloads.sourceforge.net/djvu',
			   'src' => 'tar.gz',
			  },
   'exempi'              => {
			   'ver' => '2.0.2',
			   'url' => 'http://libopenraw.freedesktop.org/download/',
			   'src' => 'tar.gz',
		          },
   'exiv2'              => {
			   'ver' => '0.18.1',
			   'url' => 'http://www.exiv2.org/',
			   'src' => 'tar.gz',
		          },
   'babl'              => {
			   'ver' => '0.0.22',
			   'url' => 'ftp://ftp.gtk.org/pub/babl/0.0',
			   'src' => 'tar.bz2',
		          },
   'faac'              => {
			   'ver' => '1.26',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/faac/',
			   'src' => 'tar.gz',
			  },
   'faad2'             => {
			   'ver' => '2.6.1',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/faac/',
			   'src' => 'tar.gz',
			  },
   'freealut'          => {
                         'url' => 'http://connect.creativelabs.com/openal/Downloads/ALUT',
                         'ver' => '1.1.0',
                         'src' => 'tar.gz',
                        },
   'gegl'          => {
                         'url' => 'ftp://ftp.gimp.org/pub/gegl/0.0',
                         'ver' => '0.0.22',
                         'src' => 'tar.bz2',
                        },
   'graphviz'            => {
                             'ver' => '2.22.2',
                             'url' => 'http://www.graphviz.org/pub/graphviz/stable/SOURCES',
                             'src' => 'tar.gz',
                            },
   'ilmbase'    => {
                   'url' => 'http://download.savannah.nongnu.org/releases/openexr/',
                   'ver' => '1.0.1',
                   'src' => 'tar.gz',
                  },
   'id3lib'            => {
			   'ver' => '3.8.3',
			   'url' => 'http://kent.dl.sourceforge.net/sourceforge/id3lib/',
			   'src' => 'tar.gz',
			  },
   'libatomic_ops'            => {
			   'ver' => '1.2',
			   'url' => 'http://www.hpl.hp.com/research/linux/atomic_ops/download',
			   'src' => 'tar.gz',
			  },
   'imlib2'            => {
			   'ver' => '1.4.2',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/enlightenment',
			   'src' => 'tar.gz',
			  },

   'iso-codes'       => {
	   # Stupid debian site disabled, no response.  Server down?  We'll ues the mirror below.
	   #'url' => 'ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/',
	   'url' => 'http://www.mirrorservice.org/sites/ftp.freebsd.org/pub/FreeBSD/ports/distfiles',
			 'ver' => '3.2',
			 'src' => 'tar.bz2',
		        },
   'libesmtp'              => {
			   'ver' => '1.0.4',
			   'url' => 'http://www.stafford.uklinux.net/libesmtp',
			   'src' => 'tar.bz2',
			  },
   'libarchive'        => {
			   'ver' => '2.6.0',
			   'url' => 'http://people.freebsd.org/~kientzle/libarchive/src',
			   'src' => 'tar.gz',
			  },
   'libdiscid'        => {
			   'ver' => '0.2.2',
			   'url' => 'http://users.musicbrainz.org/~matt',
			   'src' => 'tar.gz',
			  },
   'libmusicbrainz'        => {
			   'ver' => '3.0.2',
			   'url' => 'http://ftp.musicbrainz.org/pub/musicbrainz',
			   'src' => 'tar.gz',
			  },
   'libavc1394'        => {
			   'ver' => '0.5.3',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libavc1394/',
			   'src' => 'tar.gz',
			  },
   'libdv'             => {
			   'ver' => '1.0.0',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libdv/',
			   'src' => 'tar.gz',
			  },
   'libdvbpsi5'        => {
			   'ver' => '0.1.6',
			   'url' => 'http://download.videolan.org/pub/libdvbpsi/0.1.6/',
			   'src' => 'tar.bz2',
			  },
   'libdvdcss'         => {
			   'ver' => '1.2.10',
			   'url' => 'http://download.videolan.org/pub/libdvdcss/1.2.10',
			   'src' => 'tar.bz2',
			  },
   'libdvdnav'         => {
			   'ver' => '4.1.3',
			   'url' => 'http://www8.mplayerhq.hu/MPlayer/releases/dvdnav',
			   'src' => 'tar.bz2',
			  },
   'libdvdread'         => {
			   'ver' => '4.1.3',
			   'url' => 'http://www8.mplayerhq.hu/MPlayer/releases/dvdnav',
			   'src' => 'tar.bz2',
			  },
   'libebml'           => {
			   'ver' => '0.7.8',
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
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/libexif/',
			     'src' => 'tar.bz2',
			    },
   'libgalago'          => {
			     'ver' => '0.5.2',
			     'url' => 'http://www.galago-project.org/files/releases/source/libgalago/',
			     'src' => 'tar.bz2',
			    },
   'libiec61883'       => {
                'ver' => '1.2.0',
                'url' => 'http://www.linux1394.org/dl/',
                'src' => 'tar.gz',
                          },
   'libiptcdata'       => {
                           'ver' => '1.0.3',
                           'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libiptcdata',
                           'src' => 'tar.gz',
                          },
   'libmatroska'       => {
			   'ver' => '0.8.1',
			   'url' => 'http://dl.matroska.org/downloads/libmatroska/',
			   'src' => 'tar.bz2',
			  },
   'libmms'            => {
			   'ver' => '0.4',
			   'url' => 'http://launchpad.net/libmms/trunk/0.4/+download',
			   'src' => 'tar.gz',
			  },
   'libmpcdec'       => {
			   'ver' => '1.2.6',
			   'url' => 'http://files.musepack.net/source/',
			   'src' => 'tar.bz2',
			  },
   'libnl'           => {
			   'ver' => '1.1',
			   'url' => 'http://people.suug.ch/~tgr/libnl/files/',
			   'src' => 'tar.gz',
			  },
   'libnotify'         => {
                             'ver' => '0.4.5',
                             'url' => 'http://galago-project.org/files/releases/source/libnotify/',
                             'src' => 'tar.bz2',
			  },
   'libopenraw'        => {
			   'ver' => '0.0.6',
			   'url' => 'http://libopenraw.freedesktop.org/download/',
			   'src' => 'tar.gz',
			  },
   'libquicktime'      => {
			   'ver' => '1.0.3',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libquicktime/',
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

   'libsamplerate'        => {
                           'ver' => '0.1.4',
                           'url' => 'http://www.mega-nerd.com/SRC/',
                           'src' => 'tar.gz',
			  },
   'libsexy'             => {
                             'ver' => '0.1.11',
                             'url' => 'http://releases.chipx86.com/libsexy/libsexy/',
                             'src' => 'tar.gz',
                            },
   'libspectre'             => {
                             'ver' => '0.2.2',
                             'url' => 'http://libspectre.freedesktop.org/releases',
                             'src' => 'tar.gz',
                            },
   'libtasn1'             => {
                             'ver' => '2.1',
                             'url' => 'http://ftp.gnu.org/gnu/gnutls',
                             'src' => 'tar.gz',
                            },
   'lua'             => {
			   'ver' => '5.1.3',
			   'url' => 'http://www.lua.org/ftp/',
			   'src' => 'tar.gz',
		        },
   'mjpegtools'        => {
			   'ver' => '1.9.0rc3',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/mjpeg/',
			   'src' => 'tar.gz',
			  },
   'mpeg2dec'          => {
			   'ver' => '0.4.1',
			   'url' => 'http://libmpeg2.sourceforge.net/files/',
			   'src' => 'tar.gz',
			  },
   'openexr'    => {
                   'url' => 'http://download.savannah.nongnu.org/releases/openexr/',
                   'ver' => '1.6.1',
                   'src' => 'tar.gz',
                  },
   'poppler'    => {
                   'url' => 'http://poppler.freedesktop.org',
                   'ver' => '0.10.7',
                   'src' => 'tar.gz',
                  },
   'sg3_utils'            => {
                         'url' => 'http://sg.danny.cz/sg/p/',
                         'ver' => '1.27',
                         'src' => 'tgz',
                        },
   'speex'            => {
                         'url' => 'http://downloads.us.xiph.org/releases/speex/',
                         'ver' => '1.2rc1',
                         'src' => 'tar.gz',
                        },
   'transcode'            => {
                             'ver' => '1.1.0',
                             'url' => 'http://download.berlios.de/tcforge',
                             'src' => 'tar.bz2',
                            },
   'tre'            => {
                             'ver' => '0.7.5',
                             'url' => 'http://laurikari.net/tre',
                             'src' => 'tar.bz2',
                            },
   'twolame'           => {
			   'ver' => '0.3.12',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/twolame',
			   'src' => 'tar.gz',
			  },
   'x264'            => {
			   'ver' => 'snapshot-20090420-2245',
			   'url' => 'ftp://ftp.videolan.org/pub/videolan/x264/snapshots',
			   'src' => 'tar.bz2',
			  },
   'xvidcore'          => {
			   'ver' => '1.2.1',
			   'url' => 'http://downloads.xvid.org/downloads/',
			   'src' => 'tar.bz2',
			  },
   'yasm'           => {
			   'ver' => '0.8.0',
			   'url' => 'http://www.tortall.net/projects/yasm/releases/',
			   'src' => 'tar.gz',
			  },
  );

# src tarballs for src/libraries that are on ftp.gnome.org
our %libraries_gnome =
  (
   'libcroco'          => '0.6.2',
   'libsigc++'         => '2.2.3',
   'ptlib'             => '2.6.2',
   'opal'              => '3.6.2',
   'pango'             => '1.24.2',
  );

our %libraries_diff_naming =
  (
   'glib2'  => {
		'ver'  => '2.20.2',
		'name' => 'glib',
	      },
   'gtk+2'  => {
	   #'ver'  => '2.12.12',
	   'ver'  => '2.16.1',
      		'name' => 'gtk+',
	      },
  );

#
# End Config Options
################################################################################
