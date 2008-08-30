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
   'gnome-mag'              => '0.15.2',
   'gnome-speech'           => '0.4.21',
   'gok'                    => '2.23.91',
   'orca'                   => '2.23.90',
   'libgail-gnome'          => '1.20.0',
   'mousetweaks'            => '2.23.90',
   );

#
# End Config Options
################################################################################
