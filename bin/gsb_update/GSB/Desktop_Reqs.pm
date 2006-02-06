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
                         'url' => 'http://www.ekiga.org/downloads/sources/',
                         'ver' => '2.1.2',
                         'src' => 'tar.gz',
                        },
   'openldap'        => {
			 'url' => 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/',
			 'ver' => '2.2.30',
			 'src' => 'tgz',
			},
   'poppler'         => {
			 'url' => 'http://poppler.freedesktop.org/',
			 'ver' => '0.5.0',
			 'src' => 'tar.gz',
			},
   'opal'            => {
                         'url' => 'http://www.ekiga.org/downloads/sources/',
                         'ver' => '1.9.2',
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
