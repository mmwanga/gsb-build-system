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
   'at-spi'                 => '1.22.0',
   'bug-buddy'              => '2.22.0',
   'eel'                    => '2.22.0',
   'evolution-data-server'  => '2.22.0',
   'gconf-editor'           => '2.22.0',
   'gnome-applets'          => '2.22.0',
   'gnome-control-center'   => '2.22.0',
   'gnome-desktop'          => '2.22.0',
   'gnome-doc-utils'        => '0.12.2',
   'gnome-keyring-manager'  => '2.20.0',
   'gnome-menus'            => '2.22.0',
   'gnome-panel'            => '2.22.0',
   'gnome-python'           => '2.22.0',
   'gnome-session'          => '2.22.0',
   'gnome-terminal'         => '2.22.0',
   'gnome-themes'           => '2.22.0',
   'gtkhtml'                => '3.18.0',
   'gtksourceview'          => '2.2.0',
   'libgnomecups'           => '0.2.3',
   'libgnomekbd'            => '2.21.4.1',
   'libgnomeprint'          => '2.18.4',
   'libgnomeprintui'        => '2.18.2',
   'libgtop'                => '2.22.0',
   'libwnck'                => '2.22.0',
   'libxklavier'            => '3.4',
   'metacity'               => '2.22.0',
   'nautilus'               => '2.22.0',
   'nautilus-cd-burner'     => '2.22.0',
   );

our %desktop_nongnome =
  (
   'gnome-mount'  => { 
                      'ver' => '0.6',
                      'url' => 'http://people.freedesktop.org/~david/dist/',
                      'src' => 'tar.gz',
                     },
   'sensors-applet'  => { 
                      'ver' => '2.2.1',
                      'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sensors-applet',
                      'src' => 'tar.gz',
                     },
   'gstreamer'   => {
                           'ver' => '0.10.17',
                           'url' => 'http://gstreamer.freedesktop.org/src/gstreamer/',
                           'src' => 'tar.bz2',
                          },
   'gst-fluendo-mp3'  => {
			   'ver' => '0.10.7',
			   'url' => 'http://core.fluendo.com/gstreamer/src/gst-fluendo-mp3/',
			   'src' => 'tar.bz2',
			  },
   'gst-plugins-base'  => {
                           'ver' => '0.10.17',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-base/',
                           'src' => 'tar.bz2',
                          },
   'gnome-audio'  => {
                           'ver' => '2.0.0',
                           'url' => 'ftp://ftp.gnome.org/pub/gnome/sources/gnome-audio/2.0/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-good'  => {
                           'ver' => '0.10.7',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-good/',
                           'src' => 'tar.bz2',
                          },
   'gst-plugins-ugly'  => {
                           'ver' => '0.10.7',
                           'url' => 'http://gstreamer.freedesktop.org/src/gst-plugins-ugly/',
                           'src' => 'tar.bz2',
                          },
   'libipoddevice'       => {
                'ver' => '0.5.3',
                'url' => 'http://banshee-project.org/files/libipoddevice',
                'src' => 'tar.gz',
                          },
   'notification-daemon'           => {
                             'ver' => '0.3.7',
                             'url' => 'http://www.galago-project.org/files/releases/source/notification-daemon/',
                             'src' => 'tar.bz2',
                            },
   'pyxdg'  => {
                           'ver' => '0.15',
                           'url' => 'http://www.freedesktop.org/~lanius',
                           'src' => 'tar.gz',
                          },
   'tango-icon-theme'  => {
                           'ver' => '0.8.1',
                           'url' => 'http://tango.freedesktop.org/releases',
                           'src' => 'tar.gz',
                          },
  );

our %desktop_diff_naming =
  (
   'gtksourceview2'  => {
                         'ver'  => '2.0.1',
                         'name' => 'gtksourceview',
                        },
   );


#
# End Config Options
################################################################################
