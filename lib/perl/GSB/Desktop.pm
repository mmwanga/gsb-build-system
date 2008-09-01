package GSB::Desktop;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%desktop
                    %desktop_diff_naming
                    %desktop_nongnome);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

our %desktop =
  (
   'at-spi'                 => '1.23.91',
   'bug-buddy'              => '2.23.91',
   'eel'                    => '2.23.91',
   'evolution-data-server'  => '2.23.91',
   'gconf-editor'           => '2.23.91',
   'gnome-applets'          => '2.23.90',
   'gnome-backgrounds'      => '2.23.91',
   'gnome-control-center'   => '2.23.90',
   'gnome-desktop'          => '2.23.90',
   'gnome-doc-utils'        => '0.12.2',
   'gnome-keyring-manager'  => '2.20.0',
   'gnome-menus'            => '2.23.6',
   'gnome-audio'            => '2.22.2',
   'gnome-panel'            => '2.23.90.1',
   'gnome-python'           => '2.22.1',
   'gnome-session'          => '2.23.90',
   'gnome-settings-daemon'  => '2.23.91',
   'gnome-terminal'         => '2.23.6',
   'gnome-themes'           => '2.23.91',
   'gswitchit_plugins'      => '0.9',
   'gvfs'                   => '0.99.5',
   'gtkhtml'                => '3.23.91',
   'gtksourceview'          => '1.8.5',
   'libepc'                 => '0.3.5',
   'libgnomecups'           => '0.2.3',
   'libgnomekbd'            => '2.23.2',
   'libgnomeprint'          => '2.18.4',
   'libgnomeprintui'        => '2.18.2',
   'libgtop'                => '2.23.90',
   'libgweather'            => '2.23.6',
   'libwnck'                => '2.23.6',
   'libxklavier'            => '3.6',
   'metacity'               => '2.23.144',
   'nautilus'               => '2.23.91',
   'nautilus-cd-burner'     => '2.23.90',
   'nautilus-open-terminal' => '0.9',
   'nautilus-image-converter' => '0.3.0',
   );

our %desktop_nongnome =
  (
   'gnome-mount'   => {
                           'ver' => '0.8',
                           'url' => 'http://hal.freedesktop.org/releases',
                           'src' => 'tar.gz',
                          },
   'gstreamer'   => {
                           'ver' => '0.10.20',
                           'url' => 'http://gstreamer.freedesktop.org/src/gstreamer',
                           'src' => 'tar.bz2',
                          },
   'gst-fluendo-mp3'  => {
			   'ver' => '0.10.7',
			   'url' => 'http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-base'  => {
                           'ver' => '0.10.20',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-base',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-good'  => {
                           'ver' => '0.10.9',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-good',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-ugly'  => {
                           'ver' => '0.10.8',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-ugly',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-bad'  => {
                           'ver' => '0.10.7',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad',
                           'src' => 'tar.bz2',
                          },
   'libcanberra'  => {
                           'ver' => '0.7',
                           'url' => 'http://0pointer.de/public/',
                           'src' => 'tar.gz',
                          },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.4',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.8',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad',
                           'src' => 'tar.bz2',
		       },
   'gst-python' => {
	              'ver' => '0.10.12',
		      'url' => 'http://gstreamer.freedesktop.org/src/gst-python',
		      'src' => 'tar.bz2',
		     },
   'notification-daemon'           => {
                             'ver' => '0.3.7',
                             'url' => 'http://www.galago-project.org/files/releases/source/notification-daemon',
                             'src' => 'tar.bz2',
                            },
   'obex-data-server'           => {
                             'ver' => '0.3.4',
                             'url' => 'http://tadas.dailyda.com/software',
                             'src' => 'tar.gz',
                            },
   'xdg-utils'           => {
                             'ver' => '1.0.2',
                             'url' => 'http://portland.freedesktop.org/download',
                             'src' => 'tgz',
                            },
  );

our %desktop_diff_naming =
  (
   'gtksourceview2'  => {
                         'ver'  => '2.3.1',
                         'name' => 'gtksourceview',
                        },
   );


#
# End Config Options
################################################################################
