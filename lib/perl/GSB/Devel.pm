package GSB::Devel;
use Exporter;

# Add our lib dir to @INC
use FindBin qw($Bin);
use lib "$Bin/../lib/perl/";
#
# # GSB Modules
use GSB::GSB;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%devel %devel_gnome);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

our %devel_gnome =
  (
   'accerciser'  => '1.6.1',
   'devhelp'     => '0.22',
   'gdl'         => '2.26.0',
   'ghex'        => '2.24.0',
   'glade3'      => '3.6.2',
   'gnome-build' => '2.24.1',
   'nemiver'     => '0.6.6',
   'vala'        => '0.6.1',
  );

our %devel =
  (
   'autogen'             => {
                             'ver' => '5.9.7',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/autogen/',
                             'src' => 'tar.bz2',
			    },
   'bluefish'            => {
			     'ver' => '1.0.7',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/bluefish/',
			     'src' => 'tar.bz2',
			    },
   'monodevelop'            => {
				'ver' => '2.0',
				'url' => 'http://go-mono.com/sources/monodevelop/',
				'src' => 'tar.bz2',
			       },
   'mono-tools'                => {
				'ver' => '2.4',
				'url' => 'http://go-mono.com/sources/mono-tools',
				'src' => 'tar.bz2',
			       },
  );

#
# End Config Options
################################################################################
