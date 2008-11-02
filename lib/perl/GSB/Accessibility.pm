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
   'dasher'                 => '4.9.0',
   'gnome-mag'              => '0.15.4',
   'gnome-speech'           => '0.4.21',
   'gok'                    => '2.24.0',
   'orca'                   => '2.24.1',
   'libgail-gnome'          => '1.20.1',
   'mousetweaks'            => '2.24.1',
   );

#
# End Config Options
################################################################################
