package GSB::Ruby;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%ruby %ruby_diff_naming);
our @EXPORT_OK = qw();
our $VERSION   = 0.01;

################################################################################
# Config Options for Mono
#

our %ruby=
  (
   'ruby'                    => {
				'ver' => '1.8.4',
				'url' => 'ftp://ftp.ruby-lang.org/pub/ruby/',
				'src' => 'tar.gz',
			       },
   'ruby-gnome2-all'         => {
				'ver' => '0.15.0',
				'url' => 'http://heanet.dl.sourceforge.net/sourceforge/ruby-gnome2/',
				'src' => 'tar.gz',
			       },
  );

our %ruby_diff_naming =
  (
   ''     => {
		     'ver'  => '',
		     'name' => '',
		     'url'  => '',
		     'src'  => '',
		    },
  );

#
# End Config Options
################################################################################

