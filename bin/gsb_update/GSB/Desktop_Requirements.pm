package GSB::Desktop_Requirements;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%desktop_reqs %stupid_gnomemeeting_libs);
our @EXPORT_OK = qw();
our $VERSION = 0.03;

################################################################################
# Desktop Requirements Config Options
#

our %desktop_reqs =
  (
   'dbus'            => {
			 'url' => 'http://dbus.freedesktop.org/releases/',
			 'ver' => '0.23.2',
			 'src' => 'tar.gz',
                        },
   'hal'             => {
			 'url' => 'http://freedesktop.org/~david/dist/',
			 'ver' => '0.4.7',
			 'src' => 'tar.gz',
                        },
   'howl'            => {
			 'url' => 'http://www.porchdogsoft.com/download/',
			 'ver' => '0.9.10',
			 'src' => 'tar.gz',
                        },
   'libcap'          => {
			 'url' => 'http://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/',
			 'ver' => '1.10',
			 'src' => 'tar.gz',
                        },
   'fam'             => {
			 'url' => 'ftp://oss.sgi.com/projects/fam/download/stable',
			 'ver' => '2.6.10',
			 'src' => 'tar.gz',
                        },
  );


our %stupid_gnomemeeting_libs =
  (
   'openh323'  => {
		   'url'   => 'http://www.gnomemeeting.org/admin/downloads/latest/sources/sources/',
		   'ver'   => 'v1_15_2-src-',
		   'sbver' => '1.15.2',
		   'src'   => 'tar.gz',
		  },
   'pwlib'     => {
		   'url'   => 'http://www.gnomemeeting.org/admin/downloads/latest/sources/sources/',
		   'ver'   => 'v1_8_3-src-',
		   'sbver' => '1.8.3',
		   'src'   => 'tar.gz',
		  },
  );

#
# End Config Options
################################################################################

################################################################################
#
# Functions

sub gsb_gnomemeeting_libs_url_make {
  my $name = shift;
  my $url  = shift;
  my $ver  = shift;
  my $src  = shift;

  my $gsburl = "$url/$name-$ver$src";
  return $gsburl;
}

#
#
################################################################################
