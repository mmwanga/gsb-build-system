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
   'GConf'               => '2.26.0',
   'gnome-common'        => '2.26.0',
   'gnome-doc-utils'     => '0.16.1',
   'gnome-keyring'       => '2.26.1',
   'gnome-mime-data'     => '2.18.0',
   'gnome-icon-theme'    => '2.26.0',
   'gnome-vfs'           => '2.24.1',
   'gtk-engines'         => '2.18.1',
   'libbonobo'           => '2.24.1',
   'libbonoboui'         => '2.24.1',
   'libgnome'            => '2.26.0',
   'libgnomecanvas'      => '2.26.0',
   'libgnomeui'          => '2.24.1',
   'libsoup'             => '2.26.1',
   'ORBit2'              => '2.14.17',
   'pyorbit'             => '2.24.0',
   'ttf-bitstream-vera'  => '1.10',
   'vte'                 => '0.20.1',
  );


# these are packages from freedesktop.org
our %platform_reqs =
  (
   'avahi'               => {
                             'ver' => '0.6.25',
                             'url' => 'http://www.avahi.org/download',
                             'src' => 'tar.gz',
                            },
   'nss-mdns'               => {
                             'ver' => '0.10',
                             'url' => 'http://0pointer.de/lennart/projects/nss-mdns',
                             'src' => 'tar.gz',
                            },
   'libdaemon'           => {
                             'ver' => '0.13',
                             'url' => 'http://0pointer.de/lennart/projects/libdaemon',
                             'src' => 'tar.gz',
                            },
   'libproxy'           => {
                             'ver' => '0.2.3',
                             'url' => 'http://libproxy.googlecode.com/files/',
                             'src' => 'tar.gz',
                            },
   'pulseaudio'             => {
                             'ver' => '0.9.15',
                             'url' => 'http://0pointer.de/lennart/projects/pulseaudio',
                             'src' => 'tar.gz',
                            },
   'alsa-plugins'             => {
                             'ver' => '1.0.17',
                             'url' => 'ftp://ftp.alsa-project.org/pub/plugins',
                             'src' => 'tar.bz2',
                            },
   'rarian'             => {
                             'ver' => '0.8.1',
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
