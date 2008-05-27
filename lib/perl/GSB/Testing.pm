package GSB::Testing;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%testing_network_svn 
                    %testing);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


our %testing = 
  (
  'empathy' => {
                 'url' => 'http://ftp.gnome.org/pub/GNOME/sources/empathy/0.23',
                 'ver' => '0.23.2',
                 'src' => 'tar.bz2'
                },
  'telepathy-mission-control' => {
                 'url' => 'http://kent.dl.sourceforge.net/sourceforge/mission-control',
                 'ver' => '4.65',
                 'src' => 'tar.gz'
                },
  'libjingle' => {
                 'url' => 'http://kent.dl.sourceforge.net/sourceforge/tapioca-voip',
                 'ver' => '0.3.11',
                 'src' => 'tar.gz'
                },
   'telepathy-glib'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-glib',
             'ver' => '0.7.8',
             'src' => 'tar.gz'
                        },
   'libtelepathy'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/libtelepathy',
             'ver' => '0.3.3',
             'src' => 'tar.gz'
                        },
   'farsight'            => {
             'url' => 'http://farsight.freedesktop.org/releases/farsight',
             'ver' => '0.1.27',
             'src' => 'tar.gz'
                        },
   'gst-plugins-farsight'            => {
             'url' => 'http://farsight.freedesktop.org/releases/gst-plugins-farsight',
             'ver' => '0.12.7',
             'src' => 'tar.gz'
                        },
   'telepathy-butterfly'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-butterfly',
             'ver' => '0.3.1',
             'src' => 'tar.gz'
                        },
   'telepathy-salut'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-salut',
             'ver' => '0.3.2',
             'src' => 'tar.gz'
                        },
   'telepathy-gabble'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-gabble',
             'ver' => '0.7.6',
             'src' => 'tar.gz'
                        },
   'loudmouth'            => {
             'url' => 'http://ftp.imendio.com/pub/imendio/loudmouth/src',
             'ver' => '1.3.4',
             'src' => 'tar.bz2'
                        },
   'banshee-1'            => {
             'url' => 'http://banshee-project.org/files/banshee',
             'ver' => '0.99.2',
             'src' => 'tar.bz2'
                        },
  );

our %testing_network_svn =
  (
   'NetworkManager'         => 'svn_3690',
   'NetworkManager-vpn'     => 'svn_3690',
   'network-manager-applet' => 'svn_729',
  );
