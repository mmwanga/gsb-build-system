package GSB::DoubleTar;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%double_tarballs %double_tarballs_url);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# iso-codes isn't a double tarball but its here temporarily because of how its named.
our %double_tarballs_url =
  (
   'boost'            => {
                         'url' => 'http://heanet.dl.sourceforge.net/sourceforge/boost/',
                         'ver' => '1_34_1',
			 'dir' => 'libraries/boost',
			 'tar' => 'boost_1_34_1.tar.bz2',
                         'var' => 'VERSION',
                        },
   'mozilla-firefox'  => {
			 'ver' => '2.0.0.9',
			 'dir' => 'applications/mozilla-firefox',
			 'url' => 'http://releases.mozilla.org/pub/mozilla.org/firefox/releases/2.0.0.9/source/',
			 'tar' => 'firefox-2.0.0.9-source.tar.bz2',
			 'var' => 'VERSION',
			 },
   'nss'               => {
				   'ver' => '3.11.7',
				   'dir' => 'libraries/nss',
				   'url' => 'http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_11_7_RTM/src/',
				   'tar' => 'nss-3.11.7-with-nspr-4.6.7.tar.gz',
				   'var' => 'VERSION',
				  },
   'openldap-client'     => {
				   'ver' => '2.3.38',
				   'dir' => 'libraries/openldap-client',
				   'url' => 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/',
				   'tar' => 'openldap-2.3.38.tgz',
				   'var' => 'VERSION',
				  },
   'sqlite3'             => {
				   'ver' => '3.5.2',
				   'dir' => 'libraries/sqlite3',
				   'url' => 'http://www.sqlite.org/',
				   'tar' => 'sqlite-3.5.2.tar.gz',
				   'var' => 'VERSION',
				  },
   'libgc'             => {
				   'ver' => '7.0',
				   'dir' => 'libraries/libgc',
				   'url' => 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/',
				   'tar' => 'gc-7.0.tar.gz',
				   'var' => 'VERSION',
				  },
   'hemidal-libraries'         => {
				   'ver' => '1.0.1',
				   'dir' => 'libraries/heimdal-libraries',
				   'url' => 'ftp://ftp.sunet.se/pub/unix/admin/mirror-pdc/heimdal/src/',
				   'tar' => 'heimdal-1.0.1.tar.gz',
				   'var' => 'VERSION',
				  },
   'ode'            => {
                         'url' => 'http://heanet.dl.sourceforge.net/sourceforge/opende/',
                         'ver' => '0.9',
			 'dir' => 'office/ode',
			 'tar' => 'ode-src-0.9.zip',
                         'var' => 'VERSION',
                        },
   'scons'            => {
                         'url' => 'http://heanet.dl.sourceforge.net/sourceforge/scons/',
                         'ver' => '0.97',
			 'dir' => 'tools/scons',
			 'tar' => 'scons-0.97.tar.gz',
                         'var' => 'VERSION',
                        },
  );
