package GSB::Gnome;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%platform
                    %platform_diff_naming
                    %platform_fdo
                    %desktop
                    %desktop_diff_naming
                    %desktop_other
                    %bindings_cxx
                    %bindings_java
                    %bindings_python);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

#    'pkgconfig'           => '0.15.0',
our %platform =
  (
   'at-spi'              => '1.6.3',
   'atk'                 => '1.9.1',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.35',
   'gail'                => '1.8.2',
   'gnome-icon-theme'    => '2.10.0',
   'gnome-keyring'       => '0.4.2',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.10.0',
   'intltool'            => '0.33',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.8.1',
   'libbonoboui'         => '2.8.1',
   'libglade'            => '2.5.1',
   'libgnome'            => '2.10.0',
   'libgnomecanvas'      => '2.10.0',
   'libgnomecups'        => '0.2.0',
   'libgnomeprint'       => '2.10.0',
   'libgnomeprintui'     => '2.10.0.1',
   'libgnomeui'          => '2.10.0',
   'libxml2'             => '2.6.18',
   'libxslt'             => '1.1.13',
   'pango'               => '1.8.1',

  );

our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.12.1',
		'name' => 'ORBit2',
	       },
   'gconf'  => {
		'ver'  => '2.10.0',
		'name' => 'GConf',
	       },
   'glib2'  => {
		'ver'  => '2.6.3',
		'name' => 'glib',
	       },
   'gtk+2'  => {
		'ver'  => '2.6.4',
		'name' => 'gtk+',
	       },
   'libidl' => {
		'ver'  => '0.8.5',
		'name' => 'libIDL',
	       },
  );

# these are packages from freedesktop.org
our %platform_fdo =
  (
   'desktop-file-utils'  => {
			     'ver' => '0.10',
			     'url' => 'http://freedesktop.org/software/desktop-file-utils/releases/',
			     'src' => 'tar.gz',
			    },
   'shared-mime-info'    => {
			     'url' => 'http://freedesktop.org/software/shared-mime-info/',
			     'ver' => '0.15',
			     'src' => 'tar.gz',
			    },
   'hicolor-icon-theme'  => {
			     'url' => 'http://icon-theme.freedesktop.org/releases/',
			     'ver' => '0.7',
			     'src' => 'tar.gz',
			    },
  );

our %desktop =
  (
   'bug-buddy'              => '2.10.0',
   'control-center'         => '2.10.0',
   'dasher'                 => '3.2.15',
   'eel'                    => '2.10.0',
   'eog'                    => '2.9.0',
   'epiphany'               => '1.6.0',
   'epiphany-extensions'    => '1.6.0',
   'evolution'              => '2.2.0',
   'evolution-data-server'  => '1.2.0',
   'evolution-webcal'       => '2.2.0',
   'file-roller'            => '2.10.0',
   'gcalctool'              => '5.5.41',
   'gconf-editor'           => '2.10.0',
   'gdm'                    => '2.6.0.8',
   'gedit'                  => '2.10.0',
   'ggv'                    => '2.8.4',
   'gnome-applets'          => '2.10.0',
   'gnome-backgrounds'      => '2.10.0',
   'gnome-desktop'          => '2.10.0',
   'gnome-doc-utils'        => '0.1.3',
   'gnome-games'            => '2.10.0',
   'gnome-keyring-manager'  => '0.0.4',
   'gnome-mag'              => '0.12.0',
   'gnome-media'            => '2.10.0',
   'gnome-menus'            => '2.10.0',
   'gnome-netstatus'        => '2.10.0',
   'gnome-nettool'          => '1.2.0',
   'gnome-panel'            => '2.10.0',
   'gnome-pilot'            => '2.0.12',
   'gnome-pilot-conduits'   => '2.0.12',
   'gnome-session'          => '2.10.0',
   'gnome-speech'           => '0.3.6',
   'gnome-spell'            => '1.0.6',
   'gnome-system-monitor'   => '2.10.0',
   'gnome-system-tools'     => '1.2.0',
   'gnome-terminal'         => '2.10.0',
   'gnome-themes'           => '2.10.0',
   'gnome-user-share'       => '0.5',
   'gnome-utils'            => '2.10.0',
   'gnome-volume-manager'   => '1.2.0',
   'gnome2-user-docs'       => '2.8.1',
   'gnomemeeting'           => '1.2.1',
   'gnopernicus'            => '0.10.4',
   'gok'                    => '1.0.2',
   'goobox'                 => '0.9.90',
   'gpdf'                   => '2.10.0',
   'gtk-engines'            => '2.6.2',
   'gtkhtml'                => '3.6.0',
   'gtksourceview'          => '1.2.0',
   'gucharmap'              => '1.4.3',
   'libcroco'               => '0.6.0',
   'libgail-gnome'          => '1.1.0',
   'libgnomesu'             => '0.9.5',
   'libgsf'                 => '1.11.1',
   'libgtkhtml'             => '2.6.3',
   'libgtop'                => '2.10.0',
   'librsvg'                => '2.9.5',
   'libsoup'                => '2.2.3',
   'libwnck'                => '2.10.0',
   'libxklavier'            => '2.0',
   'metacity'               => '2.10.0',
   'nautilus'               => '2.10.0',
   'nautilus-cd-burner'     => '2.10.0',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.3',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.10.0',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.2.0',
   'totem'                  => '1.0',
   'vino'                   => '2.10.0',
   'vte'                    => '0.11.12',
   'ximian-connector'       => '2.2.0',
   'yelp'                   => '2.9.3',
   'zenity'                 => '2.10.0',
  );

our %desktop_diff_naming =
  (
   'gal2'  => {
	       'ver'  => '2.4.0',
	       'name' => 'gal',
	      },
  );

our %desktop_other =
  (
   'gnome-games-extra-data' => {
				'ver' => '2.10.0',
				'dir' => 'gnome-games',
			       },
  );

our %bindings_cxx =
  (
   'bakery'            => '2.3.12',
   'gconfmm'           => '2.10.0',
   'glibmm'            => '2.6.1',
   'gnome-vfsmm'       => '2.10.0',
   'gtkmm'             => '2.6.1',
   'libglademm'        => '2.6.0',
   'libgnomecanvasmm'  => '2.10.0',
   'libgnomemm'        => '2.10.0',
   'libgnomeuimm'      => '2.10.0',
   'libsigc++'         => '2.0.10',
   'libxml++'          => '2.10.0',
  );

#    'libgtkhtml-java'  => '2.6.0',
#    'libgtkmozembed-java' => '1.7.0',
#    'libvte-java' => '0.11.11',
our %bindings_java =
  (
   'libgconf-java'    => '2.10.0',
   'libglade-java'    => '2.10.0',
   'libgnome-java'    => '2.10.0',
   'libgtk-java'      => '2.6.0',

  );

our %bindings_python =
  (
   'gnome-python'         => '2.10.0',
   'gnome-python-extras'  => '2.10.0',
   'pygtk'                => '2.6.0',
   'pyorbit'              => '2.0.1',
   'pyphany'              => '0.1.2',
  );

#
# End Config Options
################################################################################
