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

# need to move howl, openh323-pwlib
my %desktop =
  (
   'bug-buddy'              => '',
   'control-center'         => '',
   'dasher'                 => '',
   'eel'                    => '',
   'eog'                    => '',
   'epiphany'               => '',
   'epiphany-extensions'    => '',
   'evolution'              => '',
   'evolution-data-server'  => '',
   'evolution-webcal'       => '2.1.91',
   'file-roller'            => '2.9.91',
   'gal2'                   => '',
   'gcalctool'              => '5.5.33',
   'gconf-editor'           => '',
   'gdm'                    => '',
   'gedit'                  => '2.9.6',
   'ggv'                    => '',
   'gnome-applets'          => '',
   'gnome-backgrounds'      => '',
   'gnome-desktop'          => '2.9.91',
   'gnome-doc-utils'        => '',
   'gnome-games'            => '',
   'gnome-icon-theme'       => '2.9.91',
   'gnome-keyring'          => '',
   'gnome-keyring-manager'  => '',
   'gnome-mag'              => '',
   'gnome-media'            => '',
   'gnome-menus'            => '',
   'gnome-netstatus'        => '',
   'gnome-nettool'          => '',
   'gnome-panel'            => '2.9.91',
   'gnome-pilot'            => '',
   'gnome-pilot-conduits'   => '',
   'gnome-session'          => '',
   'gnome-speech'           => '',
   'gnome-spell'            => '',
   'gnome-system-monitor'   => '2.9.91',
   'gnome-system-tools'     => '',
   'gnome-terminal'         => '',
   'gnome-themes'           => '',
   'gnome-user-share'       => '',
   'gnome-utils'            => '',
   'gnome-volume-manager'   => '',
   'gnome2-user-docs'       => '',
   'gnomemeeting'           => '',
   'gnopernicus'            => '0.10.1',
   'gok'                    => '',
   'goobox'                 => '',
   'gpdf'                   => '',
   'gtk-engines'            => '',
   'gtkhtml'                => '3.5.6',
   'gtksourceview'          => '1.1.92',
   'gucharmap'              => '',
   'howl'                   => '',
   'libgail-gnome'          => '',
   'libgnomecups'           => '',
   'libgnomesu'             => '',
   'libgtkhtml'             => '',
   'libgtop'                => '2.9.91',
   'librsvg'                => '',
   'libsoup'                => '',
   'libwnck'                => '2.9.91',
   'libxklavier'            => '',
   'metacity'               => '2.9.13',
   'nautilus'               => '',
   'nautilus-cd-burner'     => '',
   'nautilus-media'         => '',
   'nautilus-sendto'        => '',
   'openh323-pwlib'         => '',
   'scrollkeeper'           => '',
   'startup-notification'   => '',
   'totem'                  => '',
   'vino'                   => '',
   'vte'                    => '',
   'ximian-connector'       => '',
   'yelp'                   => '',
   'zenity'                 => '',
  );

# bakery is not on gnome ftp, ??? libxml++, ??? python stuff
my %bindings =
  (

   'bakery'            => '',
   'gconfmm'           => '',
   'glibmm'            => '',
   'gnome-vfsmm'       => '',
   'gtkmm'             => '',
   'libglademm'        => '',
   'libgnomecanvasmm'  => '',
   'libgnomemm'        => '',
   'libgnomeuimm'      => '',
   'libsigc++'         => '',
   'libxml++'          => '',

   'libgconf-java'  => '2.9.91',
   'libglade-java'  => '2.9.91',
   'libgnome-java'  => '2.9.91',
   'libgtk-java'    => '2.9.91',

   'gnome-python'         => '',
   'gnome-python-extras'  => '',
   'pygtk'                => '',
   'pyorbit'              => '',
  );

my %themes =
  (
   'gnome-extra-themes'   => '',
   'gnome-themes-extras'  => '',
   'ximian-artwork'       => '',
  );

#
# End Config Options
################################################################################
