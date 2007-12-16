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
   'exempi'              => {
			   'ver' => '1.99.4',
			   'url' => 'http://libopenraw.freedesktop.org/download/',
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
			   'src' => 'tar.gz',
			  },
   'freealut'          => {
                         'url' => 'http://www.openal.org/openal_webstf/downloads/',
                         'ver' => '1.1.0',
                         'src' => 'tar.gz',
                        },
   'id3lib'            => {
			   'ver' => '3.8.3',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/id3lib/',
			   'src' => 'tar.gz',
			  },
   'imlib2'            => {
			   'ver' => '1.4.0',
			   'url' => 'http://superb-east.dl.sourceforge.net/sourceforge/enlightenment/',
			   'src' => 'tar.gz',
			  },

   'iso-codes'       => {
			 'url' => 'ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/',
			 'ver' => '1.5',
			 'src' => 'tar.bz2',
		        },
   'lame'              => {
			   'ver' => '3.97',
			   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/lame/',
			   'src' => 'tar.gz',
			  },
   'libatomic_ops'        => {
			   'ver' => '1.2',
			   'url' => 'http://www.hpl.hp.com/research/linux/atomic_ops/download/',
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
   'libgalago'          => {
			     'ver' => '0.5.2',
			     'url' => 'http://www.galago-project.org/files/releases/source/libgalago/',
			     'src' => 'tar.bz2',
			    },
   'libgphoto2'          => {
			     'ver' => '2.4.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.bz2',
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
   'libiptcdata'       => {
                           'ver' => '1.0.2',
                           'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libiptcdata',
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
   'libnl'           => {
			   'ver' => '1.0-pre6',
			   'url' => 'http://people.suug.ch/~tgr/libnl/files/',
			   'src' => 'tar.gz',
			  },
   'libnotify'         => {
                             'ver' => '0.4.4',
                             'url' => 'http://galago-project.org/files/releases/source/libnotify/',
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

   'libsamplerate'        => {
                           'ver' => '0.1.2',
                           'url' => 'http://www.mega-nerd.com/SRC/',
                           'src' => 'tar.gz',
			  },
   'libsexy'             => {
                             'ver' => '0.1.11',
                             'url' => 'http://releases.chipx86.com/libsexy/libsexy/',
                             'src' => 'tar.gz',
                            },
   'lua'             => {
			   'ver' => '5.1.2',
			   'url' => 'http://www.lua.org/ftp/',
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
   'opal'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '2.2.11',
                         'src' => 'tar.gz',
                        },
   'openal'          => {
                         'url' => 'http://www.openal.org/openal_webstf/downloads/',
                         'ver' => '0.0.8',
                         'src' => 'tar.gz',
                        },
   'pwlib'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '1.10.10',
                         'src' => 'tar.gz',
                        },
   'sg3_utils'            => {
                         'url' => 'http://sg.torque.net/sg/p',
                         'ver' => '1.25',
                         'src' => 'tgz',
                        },
   'speex'            => {
                         'url' => 'http://downloads.us.xiph.org/releases/speex/',
                         'ver' => '1.2beta2',
                         'src' => 'tar.gz',
                        },
   'transcode'         => {
			   'ver' => '1.0.4',
			   'url' => 'http://transcode.kabewm.com/',
			   'src' => 'tar.bz2',
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

# src tarballs for src/libraries that are on ftp.gnome.org
our %libraries_gnome =
  (
   'libcroco'          => '0.6.1',
   'libsigc++'         => '2.0.18',
   'libgsf'            => '1.14.7',
   'pango'             => '1.18.3',
  );

our %libraries_diff_naming =
  (
   'glib2'  => {
		'ver'  => '2.14.4',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.12.3',
		'name' => 'gtk+',
	       },
  );


#
# End Config Options
################################################################################
