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
   'fuse'              => {
                 'ver' => '2.7.3',
                 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/fuse',
                 'src' => 'tar.gz',
                            },
   'compiz'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2/compiz',
                 'src' => 'tar.bz2',
                            },
   'ccsm'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'compiz-bcop'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'compiz-fusion-plugins-main'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'compiz-fusion-plugins-extra'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'compiz-manager'              => {
                 'ver' => '0.6.0',
                 'url' => 'http://releases.compiz-fusion.org/0.6.0',
                 'src' => 'tar.bz2',
                            },
   'compizconfig-backend-gconf'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'compizconfig-python'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'emerald'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'libcompizconfig'              => {
                 'ver' => '0.7.2',
                 'url' => 'http://releases.compiz-fusion.org/0.7.2',
                 'src' => 'tar.bz2',
                            },
   'sexy-python'              => {
                 'ver' => '0.1.9',
                 'url' => 'http://releases.chipx86.com/libsexy/sexy-python',
                 'src' => 'tar.gz',
                 },
   'Pyrex'              => {
                 'ver' => '0.9.6.4',
                 'url' => 'http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex',
                 'src' => 'tar.gz',
                 },
  );


#
# End Config Options
################################################################################
