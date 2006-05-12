package GSB::Desktop_Reqs;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%desktop_reqs %stupid_gnomemeeting_libs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Desktop Requirements Config Options
#

our %desktop_reqs =
  (

   'bluez-libs'      => {
                         'ver' => '2.25',
                         'url' => 'http://bluez.sf.net/download/',
                         'src' => 'tar.gz',
                        },
   'bluez-utils'     => {
                         'ver' => '2.25',
                         'url' => 'http://bluez.sf.net/download/',
                         'src' => 'tar.gz',
                        },
   'cyrus-sasl'      => {
			 'url' => 'ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/',
			 'ver' => '2.1.21',
			 'src' => 'tar.gz',
                        },
   'heimdal'         => {
			 'url' => 'ftp://ftp.sunet.se/pub/unix/admin/mirror-pdc/heimdal/src/',
			 'ver' => '0.7',
			 'src' => 'tar.gz',
			},
   'opal'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '2.2.1',
                         'src' => 'tar.gz',
                        },
   'openldap'        => {
			 'url' => 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/',
			 'ver' => '2.3.20',
			 'src' => 'tgz',
			},
   'openobex'        => {
                         'ver' => '1.0.1',
                         'url' => 'http://heanet.dl.sourceforge.net/sourceforge/openobex/',
                         'src' => 'tar.gz',
                        },
   'poppler'         => {
			 'url' => 'http://poppler.freedesktop.org/',
			 'ver' => '0.5.1',
			 'src' => 'tar.gz',
			},
   'pwlib'            => {
                         'url' => 'http://www.ekiga.org/admin/downloads/latest/sources/sources/',
                         'ver' => '1.10.0',
                         'src' => 'tar.gz',
                        },
   'PyXML'           => {
			 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/pyxml/',
			 'ver' => '0.8.4',
			 'src' => 'tar.gz',
			},
  );


#
# End Config Options
################################################################################
