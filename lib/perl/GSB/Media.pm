package GSB::Media;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%media_pkgs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

our %media_pkgs =
  (
   'banshee-1'         => {
                  'url' => 'http://banshee-project.org/files/banshee',
                  'ver' => '1.2.1',
                  'src' => 'tar.bz2'
                        },
   'devede'              => {
                 'ver' => '3.11',
                 'url' => 'http://www.rastersoft.com/descargas',
                 'src' => 'tar.bz2',
                            },
   'dvdauthor'              => {
                 'ver' => '0.6.14',
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/dvdauthor',
                 'src' => 'tar.gz',
                            },
   'dvdrip'              => {
                 'ver' => '0.98.8',
                 'url' => 'http://www.exit1.org/dvdrip/dist',
                 'src' => 'tar.gz',
                            },
   'easytag'             => {
                             'ver' => '2.1.6',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/easytag',
                             'src' => 'tar.bz2',
                            },
   'gnonlin'             => {
                 'ver' => '0.10.9',
                 'url' => 'http://gstreamer.freedesktop.org/src/gnonlin',
                 'src' => 'tar.bz2',
                            },
   'gnome-mplayer'             => {
                 'ver' => '0.7.0',
                 'url' => 'http://gnome-mplayer.googlecode.com/files',
                 'src' => 'tar.gz',
                            },
  'grip'                => {
                 'ver' => '3.3.1',
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/grip',
                 'src' => 'tar.gz',
                            },
   'gtkpod'              => {
                             'ver' => '0.99.12',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gtkpod',
                             'src' => 'tar.gz',
                            },
   'jokosher'            => {
                             'ver' => '0.9',
                             'url' => 'http://www.jokosher.org/downloads/source',
                             'src' => 'tar.gz',
                            },
   'soundconverter'        => {
                             'ver' => '1.3.2',
                             'url' => 'http://download.berlios.de/soundconverter',
                             'src' => 'tar.gz',
                            },
   'streamripper'        => {
                             'ver' => '1.63.5',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/streamripper',
                             'src' => 'tar.gz',
                            },
   'vcdimager'            => {
                             'ver' => '0.7.23',
                             'url' => 'http://mirrors.kernel.org/gnu/vcdimager',
                             'src' => 'tar.gz',
                            },
  );

#
# End Config Options
################################################################################
