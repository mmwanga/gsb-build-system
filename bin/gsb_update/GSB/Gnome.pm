package GSB::Gnome;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%plat %platform %platform_diff_naming %platform_fdo %desktop
		   %bindings_cxx %bindings_java %bindings_python);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for GNOME
#

our %platform =
  (
   'at-spi'              => '1.6.3',
   'atk'                 => '1.9.0',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.35',
   'gail'                => '1.8.2',
   'glib2'               => '2.6.3',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.9.93',
   'intltool'            => '0.33',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.8.0',
   'libbonoboui'         => '2.8.0',
   'libglade'            => '2.5.1',
   'libgnome'            => '2.9.2',
   'libgnomecanvas'      => '2.9.2',
   'libgnomeprint'       => '2.8.2',
   'libgnomeprintui'     => '2.8.2',
   'libgnomeui'          => '2.9.2',
   'libidl'              => '0.8.4',
   'libxml2'             => '2.6.17',
   'libxslt'             => '1.1.12',
   'pango'               => '1.8.0',
   'pkgconfig'           => '0.15.0',
  );

# needs a special function
our %platform_diff_naming =
  (
   'orbit2' => {
		'ver'  => '2.12.1',
		'name' => 'ORBit',
	       },
   'gconf'  => {
		'ver'  => '2.9.91',
		'name' => 'GConf',
	       },
   'gtk+2'  => {
		'ver'  => '2.6.4',
		'name' => 'gtk+',
	       },
  );

# these are packages from freedesktop.org, these are in tar.gz format
our %platform_fdo =
  (
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
   'bug-buddy'              => '2.9.92',
   'control-center'         => '2.9.91',
   'dasher'                 => '3.2.12',
   'eel'                    => '2.9.92',
   'eog'                    => '2.9.0',
   'epiphany'               => '1.5.8',
   'epiphany-extensions'    => '1.5.8',
   'evolution'              => '2.1.6',
   'evolution-data-server'  => '1.1.6',
   'evolution-webcal'       => '2.1.92',
   'file-roller'            => '2.9.92',
   'gal2'                   => '2.3.5',
   'gcalctool'              => '5.5.40',
   'gconf-editor'           => '2.9.92',
   'gdm'                    => '2.6.0.7',
   'gedit'                  => '2.9.7',
   'ggv'                    => '2.8.3',
   'gnome-applets'          => '2.9.7',
   'gnome-backgrounds'      => '2.9.92',
   'gnome-desktop'          => '2.9.92',
   'gnome-doc-utils'        => '0.1.2',
   'gnome-games'            => '2.9.7',
   'gnome-icon-theme'       => '2.9.92',
   'gnome-keyring'          => '0.4.1',
   'gnome-keyring-manager'  => '0.0.4',
   'gnome-mag'              => '0.11.13',
   'gnome-media'            => '2.9.92',
   'gnome-menus'            => '2.9.92',
   'gnome-netstatus'        => '2.9.4',
   'gnome-nettool'          => '1.1.0',
   'gnome-panel'            => '2.9.92',
   'gnome-pilot'            => '2.0.12',
   'gnome-pilot-conduits'   => '2.0.12',
   'gnome-session'          => '2.9.91',
   'gnome-speech'           => '0.3.6',
   'gnome-spell'            => '1.0.6',
   'gnome-system-monitor'   => '1.1.92',
   'gnome-system-tools'     => '2.9.91',
   'gnome-terminal'         => '2.9.3',
   'gnome-themes'           => '2.9.94',
   'gnome-user-share'       => '0.5',
   'gnome-utils'            => '2.9.92',
   'gnome-volume-manager'   => '1.1.3',
   'gnome2-user-docs'       => '2.8.1',
   'gnomemeeting'           => '1.2.0',
   'gnopernicus'            => '0.10.3',
   'gok'                    => '1.0.1',
   'goobox'                 => '0.7.2',
   'gpdf'                   => '2.9.3',
   'gtk-engines'            => '2.6.0',
   'gtkhtml'                => '3.5.6',
   'gtksourceview'          => '1.1.93',
   'gucharmap'              => '1.4.2',
   'libgail-gnome'          => '1.1.0',
   'libgnomecups'           => '0.1.14',
   'libgnomesu'             => '0.9.5',
   'libgtkhtml'             => '2.6.2',
   'libgtop'                => '2.9.92',
   'librsvg'                => '2.9.5',
   'libsoup'                => '2.2.2',
   'libwnck'                => '2.9.92.1',
   'libxklavier'            => '1.14',
   'metacity'               => '2.9.34',
   'nautilus'               => '2.9.92',
   'nautilus-cd-burner'     => '2.9.8',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.3',
   'scrollkeeper'           => '0.3.14',
   'sound-juicer'           => '2.9.92',
   'startup-notification'   => '0.8',
   'system-tools-backends'  => '1.1.91',
   'totem'                  => '0.101',
   'vino'                   => '2.9.2',
   'vte'                    => '0.11.12',
   'ximian-connector'       => '2.1.6',
   'yelp'                   => '2.9.3',
   'zenity'                 => '2.9.92',
  );

our %bindings_cxx =
  (
   'bakery'            => '2.3.11',
   'gconfmm'           => '2.9.2',
   'glibmm'            => '2.5.6',
   'gnome-vfsmm'       => '2.8.0',
   'gtkmm'             => '2.5.7',
   'libglademm'        => '2.5.1',
   'libgnomecanvasmm'  => '2.8.0',
   'libgnomemm'        => '2.8.0',
   'libgnomeuimm'      => '2.8.0',
   'libsigc++'         => '2.0.10',
   'libxml++'          => '2.9.2',
  );
our %bindings_java =
  (
   'libgconf-java'    => '2.9.91.1',
   'libglade-java'    => '2.9.91.1',
   'libgnome-java'    => '2.9.91.1',
   'libgtk-java'      => '2.6.0',
   'libgtkhtml-java'  => '2.6.0',
  );

our %bindings_python =
  (
   'gnome-python'         => '2.9.5',
   'gnome-python-extras'  => '2.9.4',
   'pygtk'                => '2.5.4',
   'pyorbit'              => '2.0.1',
   'pyphany'              => '0.1.2',
  );

our %themes =
  (
   'gnome-themes-extras'  => '0.8.1',
   'ximian-artwork'       => '0.2.29',
  );

#
# End Config Options
################################################################################
