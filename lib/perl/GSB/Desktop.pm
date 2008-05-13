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
   'eel'                    => '2.22.1',
   'evolution-data-server'  => '2.22.1.1',
   'gconf-editor'           => '2.22.0',
   'gnome-applets'          => '2.22.1',
   'gnome-control-center'   => '2.22.1',
   'gnome-desktop'          => '2.22.1',
   'gnome-doc-utils'        => '0.12.2',
   'gnome-keyring-manager'  => '2.20.0',
   'gnome-menus'            => '2.22.1',
   'gnome-audio'            => '2.22.2',
   'gnome-panel'            => '2.22.1.3',
   'gnome-python'           => '2.22.0',
   'gnome-session'          => '2.22.1.1',
   'gnome-settings-daemon'  => '2.22.1',
   'gnome-terminal'         => '2.22.1',
   'gnome-themes'           => '2.22.0',
   'gswitchit_plugins'      => '0.9',
   'gvfs'                   => '0.2.3',
   'gtkhtml'                => '3.18.1',
   'gtksourceview'          => '1.8.5',
   'libepc'                 => '0.3.5',
   'libgnomecups'           => '0.2.3',
   'libgnomekbd'            => '2.22.0',
   'libgnomeprint'          => '2.18.4',
   'libgnomeprintui'        => '2.18.2',
   'libgtop'                => '2.22.1',
   'libgweather'            => '2.22.1.1',
   'libwnck'                => '2.22.1',
   'libxklavier'            => '3.4',
   'metacity'               => '2.22.0',
   'nautilus'               => '2.22.2',
   'nautilus-cd-burner'     => '2.22.1',
   'nautilus-open-terminal' => '0.9',
   'nautilus-image-converter' => '0.3.0',
   );

our %desktop_nongnome =
  (
   'sensors-applet'  => { 
                      'ver' => '2.2.1',
                      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sensors-applet',
                      'src' => 'tar.gz',
                     },
   'gstreamer'   => {
                           'ver' => '0.10.19',
                           'url' => 'http://gstreamer.freedesktop.org/src/gstreamer',
                           'src' => 'tar.bz2',
                          },
   'gst-fluendo-mp3'  => {
			   'ver' => '0.10.7',
			   'url' => 'http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-base'  => {
                           'ver' => '0.10.19',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-base',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-good'  => {
                           'ver' => '0.10.7',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-good',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-ugly'  => {
                           'ver' => '0.10.7',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-ugly',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-bad'  => {
                           'ver' => '0.10.6',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad',
                           'src' => 'tar.bz2',
                          },
   'gst-pulse'  => {
                           'ver' => '0.9.7',
                           'url' => 'http://0pointer.de/lennart/projects/gst-pulse',
                           'src' => 'tar.gz',
                          },
   'gst-ffmpeg'        => {
			   'ver' => '0.10.3',
			   'url' => 'http://gstreamer.freedesktop.org/src/gst-ffmpeg',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-bad'   => {
                           'ver' => '0.10.6',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-bad',
                           'src' => 'tar.bz2',
		       },
   'gst-python' => {
	              'ver' => '0.10.11',
		      'url' => 'http://gstreamer.freedesktop.org/src/gst-python',
		      'src' => 'tar.bz2',
		     },
   'notification-daemon'           => {
                             'ver' => '0.3.7',
                             'url' => 'http://www.galago-project.org/files/releases/source/notification-daemon',
                             'src' => 'tar.bz2',
                            },
   'obex-data-server'           => {
                             'ver' => '0.3.1',
                             'url' => 'http://tadas.dailyda.com/software',
                             'src' => 'tar.gz',
                            },
  );

our %desktop_diff_naming =
  (
   'gtksourceview2'  => {
                         'ver'  => '2.2.0',
                         'name' => 'gtksourceview',
                        },
   );


#
# End Config Options
################################################################################
