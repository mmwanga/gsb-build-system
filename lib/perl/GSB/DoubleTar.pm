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
             		'url' => 'http://kent.dl.sourceforge.net/sourceforge/boost/',
             		'ver' => '1_34_1',
             		'dir' => 'libraries/boost',
	     		'tar' => 'boost_1_34_1.tar.bz2',
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
   'libgc'             => {
			 'ver' => '7.1',
			 'dir' => 'libraries/libgc',
			 'url' => 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/',
			 'tar' => 'gc-7.1.tar.gz',
			 'var' => 'VERSION',
				  },
   'nss'               => {
			 'ver' => '3.12',
			 'dir' => 'libraries/nss',
			 'url' => 'http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_RTM/src/',
			 'tar' => 'nss-3.12-with-nspr-4.7.tar.gz',
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
			 'ver' => '3.8.1',
			 'dir' => 'testing/libicu',
			 'url' => 'http://download.icu-project.org/files/icu4c/3.8.1',
			 'tar' => 'icu4c-3_8_1-src.tgz',
			 'var' => 'VERSION',
			     },
   'sqlite3'             => {
			 'ver' => '3.5.9',
			 'dir' => 'libraries/sqlite3',
			 'url' => 'http://www.sqlite.org/',
			 'tar' => 'sqlite-3.5.9.tar.gz',
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
			 'ver' => '1.2',
			 'dir' => 'libraries/heimdal-libraries',
			 'url' => 'http://www.h5l.org/dist/src/',
			 'tar' => 'heimdal-1.2.tar.gz',
			 'var' => 'VERSION',
				  },
   'ode'            => {
             		'url' => 'http://kent.dl.sourceforge.net/sourceforge/opende',
             		'ver' => '0.10.0',
			'dir' => 'office/ode',
			'tar' => 'ode-0.10.0.tar.bz2',
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
			 'dir' => 'extras/mplayer-codecs',
			 'url' => 'http://www1.mplayerhq.hu/MPlayer/releases/codecs',
			 'tar' => 'essential-20071007.tar.bz2',
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
			 'ver' => '1.4.272',
			 'dir' => 'libraries/openal',
			 'url' => 'http://kcat.strangesoft.net/openal-releases',
			 'tar' => 'openal-soft-1.4.272.tar.bz2',
			 'var' => 'VERSION',
				  },
   'webkit'               => {
			 'ver' => 'r35153',
			 'dir' => 'testing/webkit',
			 'url' => 'http://nightly.webkit.org/files/trunk/src',
			 'tar' => 'WebKit-r35153.tar.bz2',
			 'var' => 'VERSION',
				  },
    'mozilla-xulrunner'  => {
    			'ver' => '1.8.1.16',
    			'dir' => 'applications/mozilla-xulrunner',
    			'url' => 'http://www.mirrorservice.org/sites/ftp.mozilla.org/pub/mozilla.org/firefox/releases/2.0.0.16/source/',
    			'tar' => 'firefox-2.0.0.16-source.tar.bz2',
	    		'var' => 'VERSION',
			    },
  );
