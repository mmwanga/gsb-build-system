package GSB::DoubleTar;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%double_tarballs_url);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# Strangely named source tarballs can be found here.
our %double_tarballs_url =
  (
   'boost'            => {
             		'url' => 'http://mesh.dl.sourceforge.net/sourceforge/boost/',
             		'ver' => '1.36.0',
             		'dir' => 'libraries/boost',
	     		'tar' => 'boost_1_36_0.tar.bz2',
             		'var' => 'VERSION',
                        },
    'libintl-perl'   => {
	     		'ver' => '1.16',
	     		'url' => 'http://search.cpan.org/CPAN/authors/id/G/GU/GUIDO',
	     		'dir' => 'bindings/libintl-perl',
	     		'tar' => 'libintl-perl-1.16.tar.gz',
             		'var' => 'VERSION',
			    },
   'compiz-fusion'              => {
	     		'ver' => '0.7.6',
             		'url' => 'http://releases.compiz-fusion.org/0.7.6/compiz',
	     		'dir' => 'compiz/compiz-fusion',
	     		'tar' => 'compiz-0.7.6.tar.bz2',
             		'var' => 'VERSION',
                            },
    'mozilla-firefox'  => {
    			'ver' => '3.0.1',
    			'dir' => 'testing/mozilla-firefox',
    			'url' => 'http://www.mirrorservice.org/sites/ftp.mozilla.org/pub/mozilla.org/firefox/releases/3.0.1/source/',
    			'tar' => 'firefox-3.0.1-source.tar.bz2',
	    		'var' => 'VERSION',
			    },
   'libunique'             => {
			 'ver' => '1.0.0',
			 'dir' => 'libraries/libunique',
			 'url' => 'http://www.gnome.org/~ebassi/source',
			 'tar' => 'unique-1.0.0.tar.gz',
			 'var' => 'VERSION',
				  },
   'libgc'             => {
			 'ver' => '7.1',
			 'dir' => 'libraries/libgc',
			 'url' => 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/',
			 'tar' => 'gc-7.1.tar.gz',
			 'var' => 'VERSION',
				  },
   'lame'              => {
			 'ver' => '3.98',
			 'dir' => 'libraries/lame',
			 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/lame/',
			 'tar' => 'lame-398.tar.gz',
			 'var' => 'VERSION',
			  },
   'nss'               => {
			 'ver' => '3.12',
			 'dir' => 'libraries/nss',
			 'url' => 'http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_RTM/src/',
			 'tar' => 'nss-3.12-with-nspr-4.7.tar.gz',
			 'var' => 'VERSION',
				  },
   'policykit'               => {
			 'ver' => '0.9',
			 'dir' => 'platform/policykit',
			 'url' => 'http://hal.freedesktop.org/releases',
			 'tar' => 'PolicyKit-0.9.tar.gz',
			 'var' => 'VERSION',
				  },
   'policykit-gnome'               => {
			 'ver' => '0.9',
			 'dir' => 'platform/policykit-gnome',
			 'url' => 'http://hal.freedesktop.org/releases',
			 'tar' => 'PolicyKit-gnome-0.9.tar.bz2',
			 'var' => 'VERSION',
				  },
   'Gnome2-Gconf-perl'               => {
			 'ver' => '1.044',
			 'dir' => 'bindings/gnome2-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Gnome2-GConf-1.044.tar.gz',
			 'var' => 'VERSION',
				  },
   'Gnome2-VFS-perl'               => {
			 'ver' => '1.081',
			 'dir' => 'bindings/gnome2-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Gnome2-VFS-1.081.tar.gz',
			 'var' => 'VERSION',
				  },
   'Gnome2-Canvas'               => {
			 'ver' => '1.042',
			 'dir' => 'bindings/gnome2-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Gnome2-Canvas-1.002.tar.gz',
			 'var' => 'VERSION',
				  },
   'Gnome2-perl'               => {
			 'ver' => '1.042',
			 'dir' => 'bindings/gnome2-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Gnome2-1.042.tar.gz',
			 'var' => 'VERSION',
				  },
   'ExtUtilsDepends-perl'               => {
			 'ver' => '1.183',
			 'dir' => 'bindings/glib-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'ExtUtils-Depends-0.300.tar.gz',
			 'var' => 'VERSION',
				  },
   'ExtUtilsPkgConfig-perl'               => {
			 'ver' => '1.10',
			 'dir' => 'bindings/glib-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'ExtUtils-PkgConfig-1.10.tar.gz',
			 'var' => 'VERSION',
				  },
   'Cairo-perl'               => {
			 'ver' => '1.183',
			 'dir' => 'bindings/gtk2-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Cairo-1.045.tar.gz',
			 'var' => 'VERSION',
				  },
   'libicu'               => {
			 'ver' => '4.0c',
			 'dir' => 'libraries/libicu',
			 'url' => 'http://download.icu-project.org/files/icu4c/4.0',
			 'tar' => 'icu4c-4_0-src.tgz',
			 'var' => 'VERSION',
			     },
   'libjasper'               => {
			 'ver' => '1.900.1',
			 'dir' => 'libraries/libjasper',
			 'url' => 'http://www.ece.uvic.ca/~mdadams/jasper/software/',
			 'tar' => 'jasper-1.900.1.zip',
			 'var' => 'VERSION',
			     },
   'sqlite3'             => {
			 'ver' => '3.6.1',
			 'dir' => 'libraries/sqlite3',
			 'url' => 'http://www.sqlite.org/',
			 'tar' => 'sqlite-3.6.1.tar.gz',
			 'var' => 'VERSION',
				  },
   'pyfeedparser'             => {
			 'ver' => '4.1',
			 'dir' => 'bindings/pyfeedparser',
			 'url' => 'http://feedparser.googlecode.com/files',
			 'tar' => 'feedparser-4.1.zip',
			 'var' => 'VERSION',
				  },
   'hemidal-libraries'         => {
			 'ver' => '1.2.1',
			 'dir' => 'libraries/heimdal-libraries',
			 'url' => 'http://www.h5l.org/dist/src/',
			 'tar' => 'heimdal-1.2.1.tar.gz',
			 'var' => 'VERSION',
				  },
   'ode'            => {
             		'url' => 'http://mesh.dl.sourceforge.net/sourceforge/opende',
             		'ver' => '0.10.1',
			'dir' => 'libraries/ode',
			'tar' => 'ode-0.10.1.tar.bz2',
             		'var' => 'VERSION',
                        },
   'evo-openldap'     => {
			 'ver' => '2.3.38',
			 'dir' => 'desktop/evo-openldap',
			 'url' => 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/',
			 'tar' => 'openldap-2.3.38.tgz',
			 'var' => 'VERSION',
				  },
   'Glib-perl'               => {
			 'ver' => '1.183',
			 'dir' => 'bindings/glib-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Glib-1.183.tar.gz',
			 'var' => 'VERSION',
				  },
   'Gtk2-perl'               => {
			 'ver' => '1.183',
			 'dir' => 'bindings/gtk2-perl',
			 'url' => 'http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/',
			 'tar' => 'Gtk2-1.183.tar.gz',
			 'var' => 'VERSION',
				  },
   'mplayer-codecs'               => {
			 'ver' => '20071007',
			 'dir' => 'media/mplayer-codecs',
			 'url' => 'http://www1.mplayerhq.hu/MPlayer/releases/codecs',
			 'tar' => 'essential-20071007.tar.bz2',
			 'var' => 'VERSION',
				  },
   'mplayer-amd64-codecs'               => {
			 'ver' => '20071007',
			 'dir' => 'media/mplayer-codecs',
			 'url' => 'http://www1.mplayerhq.hu/MPlayer/releases/codecs',
			 'tar' => 'essential-amd64-20071007.tar.bz2',
			 'var' => 'VERSION',
				  },
   'pygdata'               => {
			 'ver' => '1.1.1',
			 'dir' => 'bindings/pygdata',
			 'url' => 'http://gdata-python-client.googlecode.com/files',
			 'tar' => 'gdata.py-1.1.1.tar.gz',
			 'var' => 'VERSION',
				  },
   'openal'               => {
			 'ver' => '1.5.304',
			 'dir' => 'libraries/openal',
			 'url' => 'http://kcat.strangesoft.net/openal-releases',
			 'tar' => 'openal-soft-1.5.304.tar.bz2',
			 'var' => 'VERSION',
				  },
   'webkit'               => {
			 'ver' => 'r35963',
			 'dir' => 'applications/webkit',
			 'url' => 'http://nightly.webkit.org/files/trunk/src',
			 'tar' => 'WebKit-r35963.tar.bz2',
			 'var' => 'VERSION',
				  },
    'mozilla-xulrunner'  => {
    			'ver' => '1.9.0.1',
    			'dir' => 'applications/mozilla-xulrunner',
    			'url' => 'http://releases.mozilla.org/pub/mozilla.org/xulrunner/releases/1.9.0.1/source',
    			'tar' => 'xulrunner-1.9.0.1-source.tar.bz2',
	    		'var' => 'VERSION',
			    },
   'gnome-do-plugins' => {
            'url'  => 'http://launchpad.net/do/trunk/0.4/+download',
            'ver'  => '0.4.0',
            'dir' => 'office/gnome-do-plugins',
            'tar' => 'do-plugins-0.4.0.tar.gz',
            'var' => 'VERSION',
                   },

  );
