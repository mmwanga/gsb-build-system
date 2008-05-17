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
   'gnome-speech'           => '0.4.19',
   'gnopernicus'            => '1.1.2',
   'gok'                    => '1.3.7',
   'orca'                   => '2.22.1',
   'libgail-gnome'          => '1.20.0',
   'mousetweaks'            => '2.22.1',
   );

#
# End Config Options
################################################################################
