package GSB::Libraries;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%libraries %libraries_gnome %libraries_diff_naming %libraries_svn);
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
   'cairo'            => {
			   'ver' => '1.6.4',
			   'url' => 'http://www.cairographics.org/releases',
			   'src' => 'tar.gz',
			  },
   'dbus-glib'            => {
			   'ver' => '0.76',
			   'url' => 'http://dbus.freedesktop.org/releases/dbus-glib',
			   'src' => 'tar.gz',
			  },
   'exempi'              => {
			   'ver' => '2.0.2',
			   'url' => 'http://libopenraw.freedesktop.org/download/',
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
                         'ver' => '0.0.18',
                         'src' => 'tar.bz2',
                        },
   'graphviz'            => {
                             'ver' => '2.20.2',
                             'url' => 'http://www.graphviz.org/pub/graphviz/stable/SOURCES',
                             'src' => 'tar.gz',
                            },
   'id3lib'            => {
			   'ver' => '3.8.3',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/id3lib/',
			   'src' => 'tar.gz',
			  },
   'libatomic_ops'            => {
			   'ver' => '1.2',
			   'url' => 'http://www.hpl.hp.com/research/linux/atomic_ops/download',
			   'src' => 'tar.gz',
			  },
   'imlib2'            => {
			   'ver' => '1.4.1',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/enlightenment',
			   'src' => 'tar.gz',
			  },

   'iso-codes'       => {
			 'url' => 'ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/',
			 'ver' => '3.2',
			 'src' => 'tar.bz2',
		        },
   'libesmtp'              => {
			   'ver' => '1.0.4',
			   'url' => 'http://www.stafford.uklinux.net/libesmtp',
			   'src' => 'tar.bz2',
			  },
   'libarchive'        => {
			   'ver' => '2.4.17',
			   'url' => 'http://people.freebsd.org/~kientzle/libarchive/src',
			   'src' => 'tar.gz',
			  },
   'libdiscid'        => {
			   'ver' => '0.2.2',
			   'url' => 'http://users.musicbrainz.org/~matt',
			   'src' => 'tar.gz',
			  },
   'libmusicbrainz'        => {
			   'ver' => '2.1.5',
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
   'libdvdread'        => {
			   'ver' => '0.9.7',
			   'url' => 'http://www.dtek.chalmers.se/groups/dvd/dist/',
			   'src' => 'tar.gz',
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
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libexif/',
			     'src' => 'tar.bz2',
			    },
   'libgalago'          => {
			     'ver' => '0.5.2',
			     'url' => 'http://www.galago-project.org/files/releases/source/libgalago/',
			     'src' => 'tar.bz2',
			    },
   'libgphoto2'          => {
			     'ver' => '2.4.2',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.bz2',
			    },
   'libiec61883'       => {
                'ver' => '1.1.0',
                'url' => 'http://www.linux1394.org/dl/',
                'src' => 'tar.gz',
                          },
   'libiptcdata'       => {
                           'ver' => '1.0.2',
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
                             'ver' => '0.4.4',
                             'url' => 'http://galago-project.org/files/releases/source/libnotify/',
                             'src' => 'tar.bz2',
			  },
   'liboil'            => {
			   'ver' => '0.3.15',
			   'url' => 'http://liboil.freedesktop.org/download/',
			   'src' => 'tar.gz',
			  },
   'libopenraw'        => {
			   'ver' => '0.0.5',
			   'url' => 'http://libopenraw.freedesktop.org/download/',
			   'src' => 'tar.gz',
			  },
   'libquicktime'      => {
			   'ver' => '1.0.3',
			   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libquicktime/',
			   'src' => 'tar.gz',
			  },
   'libraw1394'        => {
			   'ver' => '2.0.0',
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
   'libtasn1'             => {
                             'ver' => '1.4',
                             'url' => 'http://josefsson.org/gnutls/releases/libtasn1',
                             'src' => 'tar.gz',
                            },
   'lua'             => {
			   'ver' => '5.1.3',
			   'url' => 'http://www.lua.org/ftp/',
			   'src' => 'tar.gz',
		        },
   'libofx'    => {
                   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libofx/',
                   'ver' => '0.9.0',
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
   'opal'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '2.2.11',
                         'src' => 'tar.gz',
                        },
   'ilmbase'    => {
                   'url' => 'http://download.savannah.nongnu.org/releases/openexr/',
                   'ver' => '1.0.1',
                   'src' => 'tar.gz',
                  },
   'openexr'    => {
                   'url' => 'http://download.savannah.nongnu.org/releases/openexr/',
                   'ver' => '1.6.1',
                   'src' => 'tar.gz',
                  },
   'pwlib'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '1.10.10',
                         'src' => 'tar.gz',
                        },
   'sg3_utils'            => {
                         'url' => 'http://sg.torque.net/sg/p',
                         'ver' => '1.27',
                         'src' => 'tgz',
                        },
   'speex'            => {
                         'url' => 'http://downloads.us.xiph.org/releases/speex/',
                         'ver' => '1.2rc1',
                         'src' => 'tar.gz',
                        },
   'transcode'         => {
			   'ver' => '1.0.6',
			   'url' => 'http://fromani.exit1.org',
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
			   'ver' => 'snapshot-20080823-2245',
			   'url' => 'ftp://ftp.videolan.org/pub/videolan/x264/snapshots',
			   'src' => 'tar.bz2',
			  },
   'xvidcore'          => {
			   'ver' => '1.1.3',
			   'url' => 'http://downloads.xvid.org/downloads/',
			   'src' => 'tar.bz2',
			  },
   'yasm'           => {
			   'ver' => '0.7.1',
			   'url' => 'http://www.tortall.net/projects/yasm/releases/',
			   'src' => 'tar.gz',
			  },
  );

# src tarballs for src/libraries that are on ftp.gnome.org
our %libraries_gnome =
  (
   'libcroco'          => '0.6.1',
   'libsigc++'         => '2.2.2',
  );

our %libraries_diff_naming =
  (
   'glib2'  => {
		'ver'  => '2.17.7',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.13.7',
		'name' => 'gtk+',
	       },
  );

# libraries which we get from SVN sources
our %libraries_svn =
  (
   'ffmpeg'    => 'svn_14999',
  );

#
# End Config Options
################################################################################
