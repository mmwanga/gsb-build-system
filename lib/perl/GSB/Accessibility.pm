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
   'dasher'                 => '4.10.1',
   'gnome-mag'              => '0.15.6',
   'gnome-speech'           => '0.4.25',
   'gok'                    => '2.26.0',
   'orca'                   => '2.26.2',
   'libgail-gnome'          => '1.20.1',
   'mousetweaks'            => '2.26.2',
   );

#
# End Config Options
################################################################################
