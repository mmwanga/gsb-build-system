package GSB::Requirements;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%requirements);
our @EXPORT_OK = qw();
our $VERSION = 0.03;

################################################################################
# Requirements Config Options
#

my %requirements =
  (
   'libcroco'          => {
			 'url' => 'http://ftp.gnome.org/pub/GNOME/sources/libcroco',
			 'ver' => '0.6.0',
			 'src' => 'tar.bz2',
                        },
   'libgsf'          => {
			 'url' => 'http://ftp.gnome.org/pub/GNOME/sources/',
			 'ver' => '1.11.1',
			 'src' => 'tar.bz2',
                        },
   );

#
# End Config Options
################################################################################
