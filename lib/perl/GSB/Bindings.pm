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
   'bakery'            => '2.4.4',
   'gconfmm'           => '2.22.0',
   'gnome-vfsmm'       => '2.22.0',
   'libglademm'        => '2.6.6',
   'libgnomecanvasmm'  => '2.22.0',
   'libgnomemm'        => '2.22.0',
   'libgnomeuimm'      => '2.22.0',
   'libgtksourceviewmm' => '1.9.4',
   'libxml++'          => '2.22.0',
  );

#
# End Config Options
################################################################################
