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
   'at-spi'                 => '1.26.0',
   'bug-buddy'              => '2.26.0',
   'eel'                    => '2.26.0',
   'evince'                 => '2.26.1',
   'evolution-data-server'  => '2.26.1',
   'gconf-editor'           => '2.26.0',
   'gnome-applets'          => '2.26.1',
   'gnome-backgrounds'      => '2.24.1',
   'gnome-control-center'   => '2.26.0',
   'gnome-desktop'          => '2.26.1',
   'gnome-menus'            => '2.26.1',
   'gnome-media'            => '2.26.0',
   'gnome-audio'            => '2.22.2',
   'gnome-panel'            => '2.26.1',
   'gnome-python'           => '2.26.1',
   'gnome-python-desktop'   => '2.26.0',
   'gnome-session'          => '2.26.1',
   'gnome-settings-daemon'  => '2.26.1',
   'gnome-terminal'         => '2.26.1',
   'gnome-themes'           => '2.26.1',
   'gswitchit_plugins'      => '0.9',
   'gvfs'                   => '1.2.2',
   'gtkhtml'                => '3.26.1.1',
   'gtksourceview'          => '1.8.5',
   'libepc'                 => '0.3.9',
   'libgnomecups'           => '0.2.3',
   'libgnomekbd'            => '2.26.0',
   'libgnomeprint'          => '2.18.6',
   'libgnomeprintui'        => '2.18.4',
   'libgtop'                => '2.26.1',
   'libbtctl'               => '0.11.1',
   'libgweather'            => '2.26.1',
   'libwnck'                => '2.26.1',
   'libxklavier'            => '3.9',
   'metacity'               => '2.26.0',
   'nautilus'               => '2.26.2',
   'nautilus-cd-burner'     => '2.24.0',
   'nautilus-open-terminal' => '0.9',
   'nautilus-image-converter' => '0.3.0',
   'totem-pl-parser'         => '2.26.1',
   'zenity'                  => '2.26.0',
   );

our %desktop_nongnome =
  (
   'bluez'   => {
                           'ver' => '4.37',
                           'url' => 'http://www.kernel.org/pub/linux/bluetooth',
                           'src' => 'tar.gz',
                          },
   'gnome-mount'   => {
                           'ver' => '0.8',
                           'url' => 'http://hal.freedesktop.org/releases',
                           'src' => 'tar.gz',
                          },
   'gst-fluendo-mp3'  => {
			   'ver' => '0.10.10',
			   'url' => 'http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3',
			   'src' => 'tar.bz2',
			  },
   'gstreamer'  => {
                           'ver' => '0.10.22',
                           'url' => 'http://gstreamer.freedesktop.org/src/gstreamer',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-base'  => {
                           'ver' => '0.10.22',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-base',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-good'  => {
                           'ver' => '0.10.13',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-good',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-ugly'  => {
                           'ver' => '0.10.11',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-ugly',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-bad'  => {
                           'ver' => '0.10.11',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad',
                           'src' => 'tar.bz2',
                          },
   'libcanberra'  => {
                           'ver' => '0.12',
                           'url' => 'http://0pointer.de/lennart/projects/libcanberra',
                           'src' => 'tar.gz',
                          },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.7',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg',
			   'src' => 'tar.bz2',
			  },
   'libical' => {
                   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/freeassociation/',
                   'ver' => '0.43',
                   'src' => 'tar.gz',
                  },
   'gst-python' => {
	              'ver' => '0.10.14',
		      'url' => 'http://gstreamer.freedesktop.org/src/gst-python',
		      'src' => 'tar.bz2',
		     },
   'notification-daemon'           => {
                             'ver' => '0.4.0',
                             'url' => 'http://www.galago-project.org/files/releases/source/notification-daemon',
                             'src' => 'tar.bz2',
                            },
   'obex-data-server'           => {
                             'ver' => '0.4.4',
                             'url' => 'http://tadas.dailyda.com/software',
                             'src' => 'tar.gz',
                            },
  );

our %desktop_diff_naming =
  (
   'gtksourceview2'  => {
                         'ver'  => '2.6.1',
                         'name' => 'gtksourceview',
                        },
   );


#
# End Config Options
################################################################################
