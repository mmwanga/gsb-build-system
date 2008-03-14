package GSB::Accessibility;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%accessibility_gnome);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

our %accessibility_gnome =
  (
   'dasher'                 => '4.6.1',
   'gnome-mag'              => '0.14.10',
   'gnome-speech'           => '0.4.18',
   'gnopernicus'            => '1.1.2',
   'gok'                    => '1.3.7',
   'orca'                   => '2.22.0',
   'libgail-gnome'          => '1.20.0',
   );

#
# End Config Options
################################################################################
