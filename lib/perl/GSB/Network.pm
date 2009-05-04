package GSB::Network;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%network_gnome %network_external);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

our %network_gnome =
  (
   'ekiga'                  => '3.2.0',
   'empathy'	            => '2.26.1',
   'gnome-user-share'       => '2.26.0',
   'gnome-phone-manager'    => '0.60',
   'nautilus-sendto'        => '1.1.4.1',
   'NetworkManager'         => '0.7.1',
   'network-manager-applet' => '0.7.1',
  );

our %network_external =
  (
   'balsa'       => {
		'ver' => '2.3.28',
		'url' => 'http://balsa.gnome.org',
		'src' => 'tar.bz2',
		 },
   'deluge'     => {
                 'ver' => '1.1.7',
                 'url' => 'http://download.deluge-torrent.org/source',
		 'src' => 'tar.bz2',
                   },
  'sylpheed'     => {
                  'ver' => '2.6.0',
                  'url' => 'http://sylpheed.sraoss.jp/sylpheed/v2.6/',
                 'src' => 'tar.bz2',
                 },
  'telepathy-mission-control' => {
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/mission-control',
                 'ver' => '4.67',
                 'src' => 'tar.gz'
                },
  'libjingle' => {
                 'url' => 'http://libjingle.googlecode.com/files/',
                 'ver' => '0.4.0',
                 'src' => 'tar.gz'
                },
   'telepathy-glib'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-glib',
             'ver' => '0.7.29',
             'src' => 'tar.gz'
                        },
   'telepathy-farsight'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-farsight',
             'ver' => '0.0.6',
             'src' => 'tar.gz'
                        },
   'libtelepathy'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/libtelepathy',
             'ver' => '0.3.3',
             'src' => 'tar.gz'
                        },
			#'farsight'            => {
			#'url' => 'http://farsight.freedesktop.org/releases/farsight',
			#'ver' => '0.1.28',
			#'src' => 'tar.gz'
			#},
   'farsight2'            => {
             'url' => 'http://farsight.freedesktop.org/releases/farsight2',
             'ver' => '0.0.9',
             'src' => 'tar.gz'
                        },
   'libnice'            => {
             'url' => 'http://nice.freedesktop.org/releases',
             'ver' => '0.0.6',
             'src' => 'tar.gz'
                        },
			#'gst-plugins-farsight'            => {
			#'url' => 'http://farsight.freedesktop.org/releases/gst-plugins-farsight',
			#'ver' => '0.12.9',
			#'src' => 'tar.gz'
			#},
   'telepathy-butterfly'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-butterfly',
             'ver' => '0.3.3',
             'src' => 'tar.gz'
                        },
			#'pymsn'            => {
			#'url' => 'http://telepathy.freedesktop.org/releases/pymsn',
			#'ver' => '0.3.3',
			#'src' => 'tar.gz'
			#},
   'telepathy-salut'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-salut',
             'ver' => '0.3.9',
             'src' => 'tar.gz'
                        },
   'telepathy-gabble'            => {
             'url' => 'http://telepathy.freedesktop.org/releases/telepathy-gabble',
             'ver' => '0.7.26',
             'src' => 'tar.gz'
                        },
   'loudmouth'            => {
             'url' => 'http://ftp.imendio.com/pub/imendio/loudmouth/src',
             'ver' => '1.4.3',
             'src' => 'tar.bz2'
                        },
			#'gupnp'            => {
			#'url' => 'http://www.gupnp.org/sources/gupnp/',
			#'ver' => '0.12.7',
			#'src' => 'tar.gz'
			#},
			#'gsspd'            => {
			#'url' => 'http://www.gupnp.org/sources/gsspd/',
			#'ver' => '0.6.4',
			#'src' => 'tar.gz'
			#},
  );

#
# End Config Options
################################################################################
