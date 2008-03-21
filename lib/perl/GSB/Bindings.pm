package GSB::Bindings;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%bindings_gnome %bindings_ex);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Bindings source tarballs
#

our %bindings_gnome =
  (
   'bakery'            => '2.4.4',
   'gconfmm'           => '2.22.0',
   'gnome-vfsmm'       => '2.22.0',
   'libglademm'        => '2.6.6',
   'libgnomecanvasmm'  => '2.22.0',
   'libgnomemm'        => '2.22.0',
   'libgnomeuimm'      => '2.22.0',
   'libgtksourceviewmm' => '0.3.1',
   'libxml++'          => '2.22.0',
   'gtkmm'             => '2.12.5',
   'glibmm'            => '2.16.0',
  );

  
our %bindings_ex =
  (
   'cairomm' => {
                 'ver' => '1.4.8',
                 'url' => 'http://cairographics.org/releases',
                 'src' => 'tar.gz',
                },
   'pysqlite' => {
                 'ver' => '2.4.1',
                 'url' => 'http://oss.itsystementwicklung.de/download/pysqlite/2.4/2.4.1',
                 'src' => 'tar.gz',
                },
  )

#
# End Config Options
################################################################################
