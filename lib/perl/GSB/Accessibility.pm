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
   'dasher'                 => '4.7.3',
   'gnome-mag'              => '0.15.0',
   'gnome-speech'           => '0.4.20',
   'gnopernicus'            => '1.1.2',
   'gok'                    => '1.4.0',
   'orca'                   => '2.22.3',
   'libgail-gnome'          => '1.20.0',
   'mousetweaks'            => '2.22.3',
   );

#
# End Config Options
################################################################################
