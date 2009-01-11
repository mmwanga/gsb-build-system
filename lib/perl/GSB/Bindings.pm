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
   'bakery'             => '2.6.2',
   'gconfmm'            => '2.24.0',
   'gnome-vfsmm'        => '2.24.0',
   'libglademm'         => '2.6.7',
   'libgnomecanvasmm'   => '2.23.1',
   'libgnomemm'         => '2.24.0',
   'libgnomeuimm'       => '2.24.0',
   'gtksourceviewmm'    => '2.2.0',
   'gtkmm'              => '2.14.3',
   'libxml++'           => '2.24.2',
   'glibmm'             => '2.18.1',
   'pangomm'            => '2.14.1',
  );

  
our %bindings_ex =
  (
   'cairomm' => {
	   #'ver' => '1.6.2',
	   'ver' => '1.4.8',
                 'url' => 'http://cairographics.org/releases',
                 'src' => 'tar.gz',
                },
   'notify-python'    => {
             'url' => 'http://www.galago-project.org/files/releases/source/notify-python/',
             'ver' => '0.1.1',
             'src' => 'tar.bz2',
                  },
   'pysqlite' => {
                 'ver' => '2.5.0a',
                 'url' => 'http://oss.itsystementwicklung.de/download/pysqlite/2.5/2.5.0',
                 'src' => 'tar.gz',
                },
   'pyalsaaudio' => {
                 'ver' => '0.3',
                 'url' => 'http://mesh.dl.sourceforge.net/pyalsaaudio',
                 'src' => 'tar.gz',
                },
   'pyxdg'  => {
                           'ver' => '0.16',
                           'url' => 'http://www.freedesktop.org/~lanius',
                           'src' => 'tar.gz',
                          },
  )

#
# End Config Options
################################################################################
