package GSB::Bindings;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%bindings_cxx);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Bindings source tarballs
#

our %bindings_cxx =
  (
   'bakery'            => '2.4.3',
   'gconfmm'           => '2.20.0',
   'gnome-vfsmm'       => '2.20.0',
   'libglademm'        => '2.6.5',
   'libgnomecanvasmm'  => '2.20.0',
   'libgnomemm'        => '2.20.0',
   'libgnomeuimm'      => '2.20.0',
   'libgtksourceviewmm' => '0.3.1',
   'libxml++'          => '2.20.0',
  );

#
# End Config Options
################################################################################
