################################################################################
# Config Options for GNOME
#

my %platform =
  (
   'at-spi'              => '1.6.3',
   'atk'                 => '1.9.0',
   'audiofile'           => '0.2.6',
   'esound'              => '0.2.35',
   'gail'                => '1.8.2',
   'glib2'               => '2.6.2',
   'gnome-mime-data'     => '2.4.2',
   'gnome-vfs'           => '2.9.90',
   'intltool'            => '0.33',
   'libart_lgpl'         => '2.3.17',
   'libbonobo'           => '2.8.0',
   'libbonoboui'         => '2.8.0',
   'libglade'            => '2.5.0',
   'libgnome'            => '2.9.1',
   'libgnomecanvas'      => '2.9.1',
   'libgnomeprint'       => '2.8.2',
   'libgnomeprintui'     => '2.8.2',
   'libgnomeui'          => '2.9.1',
   'libidl'              => '0.8.4',
   'libxml2'             => '2.6.17',
   'libxslt'             => '1.1.12',
   'pango'               => '1.8.0',
   'pkgconfig'           => '0.15.0',
  );

my %platform_diff_naming =
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
		'ver'  => '2.6.2',
		'name' => 'gtk+',
	       },
  );

# these are packages from freedesktop.org, these are in tar.gz format
my %platform_fdo =
  (
   'shared-mime-info'    => '0.15',
   'hicolor-icon-theme'  => '0.5',
  );

my %desktop =
  (
   'bug-buddy'              => '2.9.91',
   'control-center'         => '2.9.91',
   'dasher'                 => '3.2.12',
   'eel'                    => '2.9.90',
   'eog'                    => '2.9.0',
   'epiphany'               => '1.5.6',
   'epiphany-extensions'    => '1.5.7',
   'evolution'              => '2.1.5',
   'evolution-data-server'  => '1.1.15',
   'evolution-webcal'       => '2.1.91',
   'file-roller'            => '2.9.91',
   'gal2'                   => '2.3.4',
   'gcalctool'              => '5.5.33',
   'gconf-editor'           => '2.9.3',
   'gdm'                    => '2.6.0.7',
   'gedit'                  => '2.9.6',
   'ggv'                    => '2.8.3',
   'gnome-applets'          => '2.9.5',
   'gnome-backgrounds'      => '2.9.90',
   'gnome-desktop'          => '2.9.91',
   'gnome-doc-utils'        => '0.1.2',
   'gnome-games'            => '2.9.5',
   'gnome-icon-theme'       => '2.9.91',
   'gnome-keyring'          => '0.4.1',
   'gnome-keyring-manager'  => '0.0.4',
   'gnome-mag'              => '0.11.13',
   'gnome-media'            => '2.9.90',
   'gnome-menus'            => '2.9.90',
   'gnome-netstatus'        => '2.9.4',
   'gnome-nettool'          => '1.1.0',
   'gnome-panel'            => '2.9.91',
   'gnome-pilot'            => '2.0.12',
   'gnome-pilot-conduits'   => '2.0.12',
   'gnome-session'          => '2.9.91',
   'gnome-speech'           => '0.3.6',
   'gnome-spell'            => '1.0.6',
   'gnome-system-monitor'   => '2.9.91',
   'gnome-system-tools'     => '2.9.91',
   'gnome-terminal'         => '2.9.2',
   'gnome-themes'           => '2.9.90',
   'gnome-user-share'       => '0.5',
   'gnome-utils'            => '2.9.91',
   'gnome-volume-manager'   => '1.1.3',
   'gnome2-user-docs'       => '2.8.1',
   'gnomemeeting'           => '1.2.0',
   'gnopernicus'            => '0.10.1',
   'gok'                    => '0.12.1',
   'goobox'                 => '0.7.2',
   'gpdf'                   => '2.9.3',
   'gtk-engines'            => '2.6.0',
   'gtkhtml'                => '3.5.6',
   'gtksourceview'          => '1.1.92',
   'gucharmap'              => '1.4.2',
   'libgail-gnome'          => '1.1.0',
   'libgnomecups'           => '0.1.14',
   'libgnomesu'             => '0.9.5',
   'libgtkhtml'             => '2.6.2',
   'libgtop'                => '2.9.91',
   'librsvg'                => '2.9.5',
   'libsoup'                => '2.2.2',
   'libwnck'                => '2.9.91',
   'libxklavier'            => '1.14', # check if this is tar.gz only
   'metacity'               => '2.9.13',
   'nautilus'               => '2.9.90',
   'nautilus-cd-burner'     => '2.9.5',
   'nautilus-media'         => '0.8.1',
   'nautilus-sendto'        => '0.3',
   'scrollkeeper'           => '0.3.14',
   'startup-notification'   => '0.8',
   'totem'                  => '0.101',
   'vino'                   => '2.9.2',
   'vte'                    => '0.11.11',
   'ximian-connector'       => '2.1.4',
   'yelp'                   => '2.9.3',
   'zenity'                 => '2.9.2',
  );

my %bindings_cxx =
  (
   'bakery'            => '2.3.11',
   'gconfmm'           => '2.9.2',
   'glibmm'            => '2.5.5',
   'gnome-vfsmm'       => '2.8.0',
   'gtkmm'             => '2.5.5',
   'libglademm'        => '2.5.1',
   'libgnomecanvasmm'  => '2.8.0',
   'libgnomemm'        => '2.8.0',
   'libgnomeuimm'      => '2.8.0',
   'libsigc++'         => '2.0.9',
   'libxml++'          => '2.9.1',
  );
my %bindings_java =
  (
   'libgconf-java'  => '2.9.91',
   'libglade-java'  => '2.9.91',
   'libgnome-java'  => '2.9.91',
   'libgtk-java'    => '2.9.91',
  );

my %bindings_python =
  (
   'gnome-python'         => '2.9.4',
   'gnome-python-extras'  => '2.9.3',
   'pygtk'                => '2.5.3',
   'pyorbit'              => '2.0.1',
   'pyphany'              => '0.1.1',
  );

my %themes =
  (
   'gnome-extra-themes'   => '1.0.1',
   'gnome-themes-extras'  => '0.8.0',
   'ximian-artwork'       => '0.2.29',
  );

#
# End Config Options
################################################################################
