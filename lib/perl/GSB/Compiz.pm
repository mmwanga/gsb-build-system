package GSB::Compiz;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(
                    %compiz
                   );
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


################################################################################
# Config Options for COMPIZ
#

# src/compiz
our %compiz =
  (
   'avant-window-navigator'              => {
                 'ver' => '0.2.6',
                 'url' => 'https://launchpadlibrarian.net/12155574',
                 'src' => 'tar.gz',
                            },
   'awn-extras-applets'              => {
                 'ver' => '0.2.6',
                 'url' => 'https://launchpadlibrarian.net/12155208',
                 'src' => 'tar.gz',
                            },
   'ccsm'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'compiz-bcop'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'compiz-fusion-plugins-main'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'compiz-fusion-plugins-extra'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'compiz-manager'              => {
                 'ver' => '0.6.0',
                 'url' => 'http://releases.compiz-fusion.org/0.6.0',
                 'src' => 'tar.bz2',
                            },
   'compizconfig-backend-gconf'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'compizconfig-python'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'emerald'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'libcompizconfig'              => {
                 'ver' => '0.7.8',
                 'url' => 'http://releases.compiz-fusion.org/0.7.8',
                 'src' => 'tar.bz2',
                            },
   'sexy-python'              => {
                 'ver' => '0.1.9',
                 'url' => 'http://releases.chipx86.com/libsexy/sexy-python',
                 'src' => 'tar.gz',
                 },
  );


#
# End Config Options
################################################################################
