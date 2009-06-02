package GSB::Media;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%media_gnome 
                    %media_pkgs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#
our %media_gnome =
  (
   'rhythmbox'               => '0.12.2',
  );

our %media_pkgs =
  (
   'banshee-1'         => {
                  'url' => 'http://banshee-project.org/files/banshee',
                  'ver' => '1.4.3',
                  'src' => 'tar.bz2'
                        },
   'dvgrab'              => {
			     'ver' => '3.4',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'devede'              => {
                 'ver' => '3.12c',
                 'url' => 'http://www.rastersoft.com/descargas',
                 'src' => 'tar.bz2',
                            },
   'dvdauthor'              => {
                 'ver' => '0.6.14',
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/dvdauthor',
                 'src' => 'tar.gz',
                            },
   'dvdrip'              => {
                 'ver' => '0.98.10',
                 'url' => 'http://www.exit1.org/dvdrip/dist',
                 'src' => 'tar.gz',
                            },
   'easytag'             => {
                             'ver' => '2.1.6',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/easytag',
                             'src' => 'tar.bz2',
                            },
   'gnonlin'             => {
                 'ver' => '0.10.10',
                 'url' => 'http://gstreamer.freedesktop.org/src/gnonlin',
                 'src' => 'tar.bz2',
                            },
   'gnome-mplayer'             => {
                 'ver' => '0.9.5',
                 'url' => 'http://gnome-mplayer.googlecode.com/files',
                 'src' => 'tar.gz',
                            },
  'grip'                => {
                 'ver' => '3.3.1',
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/grip',
                 'src' => 'tar.gz',
                            },
   'libgpod'              => {
                             'ver' => '0.7.2',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gtkpod',
                             'src' => 'tar.gz',
                            },
   'gtkpod'              => {
                             'ver' => '0.99.14',
                             'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gtkpod',
                             'src' => 'tar.gz',
                            },
   'kino'                => {
			     'ver' => '1.3.3',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'jokosher'            => {
                             'ver' => '0.11.1',
                             'url' => 'http://launchpad.net/jokosher/0.11/0.11.1/+download/',
                             'src' => 'tar.gz',
                            },
   'soundconverter'        => {
                             'ver' => '1.4.3',
                             'url' => 'http://download.berlios.de/soundconverter',
                             'src' => 'tar.gz',
                            },
   'streamripper'        => {
                             'ver' => '1.64.6',
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
