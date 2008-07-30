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
   'at-spi'                 => '1.22.1',
   'bug-buddy'              => '2.22.0',
   'eel'                    => '2.22.2',
   'evolution-data-server'  => '2.22.3',
   'gconf-editor'           => '2.22.0',
   'gnome-applets'          => '2.22.3',
   'gnome-control-center'   => '2.22.2.1',
   'gnome-desktop'          => '2.22.3',
   'gnome-doc-utils'        => '0.12.2',
   'gnome-keyring-manager'  => '2.20.0',
   'gnome-menus'            => '2.22.2',
   'gnome-audio'            => '2.22.2',
   'gnome-panel'            => '2.22.2',
   'gnome-python'           => '2.22.1',
   'gnome-session'          => '2.22.3',
   'gnome-settings-daemon'  => '2.22.2.1',
   'gnome-terminal'         => '2.22.3',
   'gnome-themes'           => '2.22.2',
   'gswitchit_plugins'      => '0.9',
   'gvfs'                   => '0.2.5',
   'gtkhtml'                => '3.18.3',
   'gtksourceview'          => '1.8.5',
   'libepc'                 => '0.3.5',
   'libgnomecups'           => '0.2.3',
   'libgnomekbd'            => '2.22.0',
   'libgnomeprint'          => '2.18.4',
   'libgnomeprintui'        => '2.18.2',
   'libgtop'                => '2.22.3',
   'libgweather'            => '2.22.3',
   'libwnck'                => '2.22.3',
   'libxklavier'            => '3.6',
   'metacity'               => '2.22.0',
   'nautilus'               => '2.22.5.1',
   'nautilus-cd-burner'     => '2.22.1',
   'nautilus-open-terminal' => '0.9',
   'nautilus-image-converter' => '0.3.0',
   );

our %desktop_nongnome =
  (
   'sensors-applet'  => { 
                      'ver' => '2.2.1',
                      'url' => 'http://kent.dl.sourceforge.net/sourceforge/sensors-applet',
                      'src' => 'tar.gz',
                     },
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
                           'ver' => '0.10.8',
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
   'gst-pulse'  => {
                           'ver' => '0.9.7',
                           'url' => 'http://0pointer.de/lennart/projects/gst-pulse',
                           'src' => 'tar.gz',
                          },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.4',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.6',
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
                             'ver' => '0.3.3',
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
                         'ver'  => '2.2.2',
                         'name' => 'gtksourceview',
                        },
   );


#
# End Config Options
################################################################################
