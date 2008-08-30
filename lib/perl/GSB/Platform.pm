package GSB::Platform;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%platform
                    %platform_reqs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

our %platform =
  (
   'gail'                => '1.22.3',
   'GConf'               => '2.23.2',
   'gnome-common'        => '2.20.0',
   'gnome-keyring'       => '2.23.90',
   'gnome-mime-data'     => '2.18.0',
   'gnome-vfs'           => '2.23.0',
   'gtk-engines'         => '2.15.3',
   'intltool'            => '0.40.3',
   'libbonobo'           => '2.23.1',
   'libbonoboui'         => '2.23.5',
   'libbtctl'            => '0.10.0',
   'libgnome'            => '2.23.5',
   'libgnomecanvas'      => '2.20.1.1',
   'libgnomeui'          => '2.23.90',
   'libsoup'             => '2.23.6',
   'ORBit2'              => '2.14.14',
   'pyorbit'             => '2.14.3',
   'ttf-bitstream-vera'  => '1.10',
  );


# these are packages from freedesktop.org
our %platform_reqs =
  (
   'avahi'               => {
                             'ver' => '0.6.23',
                             'url' => 'http://www.avahi.org/download',
                             'src' => 'tar.gz',
                            },
   'libdaemon'           => {
                             'ver' => '0.13',
                             'url' => 'http://0pointer.de/lennart/projects/libdaemon',
                             'src' => 'tar.gz',
                            },
   'pulseaudio'             => {
                             'ver' => '0.9.11',
                             'url' => 'http://0pointer.de/lennart/projects/pulseaudio',
                             'src' => 'tar.gz',
                            },
   'alsa-plugins'             => {
                             'ver' => '1.0.17',
                             'url' => 'ftp://ftp.alsa-project.org/pub/plugins',
                             'src' => 'tar.bz2',
                            },
   'alsa-lib'             => {
                             'ver' => '1.0.17a',
                             'url' => 'ftp://ftp.alsa-project.org/pub/lib',
                             'src' => 'tar.bz2',
                            },
   'rarian'             => {
                             'ver' => '0.8.0',
                             'url' => 'http://rarian.freedesktop.org/Releases',
                             'src' => 'tar.bz2',
                            },
   'XML-Twig'      => {
	                 'url' => 'http://xmltwig.com/xmltwig',
                         'ver' => '3.32',
                         'src' => 'tar.gz',
                        },
  );


#
# End Config Options
################################################################################
