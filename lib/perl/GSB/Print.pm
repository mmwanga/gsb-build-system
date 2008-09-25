package GSB::Print;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%print);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

our %print =
  (
    'system-config-printer'    => {
             'url' => 'http://cyberelk.net/tim/data/system-config-printer/1.0.x/',
             'ver' => '1.0.7',
             'src' => 'tar.bz2',
                  },
   'pycups'    => {
             'url' => 'http://cyberelk.net/tim/data/pycups/',
             'ver' => '1.9.42',
             'src' => 'tar.bz2',
                  },
   'gpp'    => {
             'url' => 'http://www.fogman.de/gpp',
             'ver' => '0.7.0',
             'src' => 'tar.gz',
                  },
  );

#
# End Config Options
################################################################################
