package GSB::Mono;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%mono %mono_gnome %mono_diff_naming);
our @EXPORT_OK = qw();
our $VERSION   = 0.01;

################################################################################
# Config Options for Mono
#

our %mono_gnome =
  (
   'evolution-sharp' => '0.20.0',
   'gtk-sharp'       => '2.12.8',
   'gnome-sharp'     => '2.24.1',
   'gnome-desktop-sharp'     => '2.26.0',
   );

our %mono=
  (
   'boo'        => {
				'ver' => '0.9.0.3203-2',
				'url' => 'http://dist.codehaus.org/boo/distributions',
				'src' => 'tar.gz',
			    },
			    #'gecko-sharp'        => {
			    #'ver' => '2.0-0.13',
			    #'url' => 'http://go-mono.com/sources/gecko-sharp2/',
			    #'src' => 'tar.bz2',
			    #},
   'gluezilla'        => {
				'ver' => '2.4',
				'url' => 'http://ftp.novell.com/pub/mono/sources/gluezilla',
				'src' => 'tar.bz2',
			    },
   'gnome-keyring-sharp'                => {
				'ver' => '1.0.0',
				'url' => 'http://ftp.novell.com/pub/mono/sources/gnome-keyring-sharp',
				'src' => 'tar.bz2',
			       },
   'gtksourceview-sharp' => {
				 'ver' => '2.0-0.12',
				 'url' => 'http://go-mono.com/sources/gtksourceview-sharp-2.0/',
				 'src' => 'tar.bz2',
				},
   'libgdiplus'             => {
				'ver' => '2.4',
				'url' => 'http://go-mono.com/sources/libgdiplus/',
				'src' => 'tar.bz2',
			       },
   'libgphoto2-sharp' => {
		    'ver'  => '2.3.0',
		    'url'  => 'http://mesh.dl.sourceforge.net/sourceforge/gphoto',
		    'src'  => 'tar.bz2',
		   },
   'ipod-sharp'             => {
				'ver' => '0.8.2',
				'url' => 'http://banshee-project.org/files/ipod-sharp',
				'src' => 'tar.gz',
			       },
   'mono'                   => {
				'ver' => '2.4',
				'url' => 'http://go-mono.com/sources/mono/',
				'src' => 'tar.bz2',
			       },
   'mono-addins'            => {
				'ver' => '0.4',
				'url' => 'http://go-mono.com/sources/mono-addins/',
				'src' => 'tar.bz2',
			       },
			       #'monodoc'                => {
			       #'ver' => '2.0',
			       #'url' => 'http://go-mono.com/sources/monodoc',
			       #'src' => 'zip',
			       #},
   'mono-zeroconf'            => {
		'ver' => '0.8.0',
		'url' => 'http://banshee-project.org/files/mono-zeroconf',
		'src' => 'tar.bz2',
			       },
   'ndesk-dbus'                => {
				'ver' => '0.6.1a',
				'url' => 'http://www.ndesk.org/archive/dbus-sharp/',
				'src' => 'tar.gz',
			       },
   'ndesk-dbus-glib'                => {
				'ver' => '0.4.1',
				'url' => 'http://www.ndesk.org/archive/dbus-sharp/',
				'src' => 'tar.gz',
			       },
   'njb-sharp'                => {
				'ver' => '0.3.0',
				'url' => 'http://banshee-project.org/files/njb-sharp',
				'src' => 'tar.gz',
			       },
   'taglib-sharp'                => {
				'ver' => '2.0.3.2',
				'url' => 'http://download.banshee-project.org/taglib-sharp/2.0.3.2/',
				'src' => 'tar.bz2',
			       },
  );

our %mono_diff_naming =
  (
   'avahi-sharp'  => {
             'url' => 'http://avahi.org/download',
             'ver' => '0.6.25',
             'dir' => 'mono/avahi-sharp',
             'tar' => 'avahi-0.6.25.tar.gz',
             'var' => 'VERSION',
                        },
   'gmime-sharp' => {
		    'url'  => 'ftp://ftp.gnome.org/pub/gnome/sources/gmime/2.2',
		    'ver'  => '2.2.23',
            'dir' => 'mono/gmime-sharp',
            'tar' => 'gmime-2.2.23.tar.bz2',
            'var' => 'VERSION',
		   },
   'libkarma-sharp' => {
		    'url'  => 'http://www.freakysoft.de/libkarma',
		    'ver'  => '0.1.0',
            'dir' => 'mono/karma-sharp',
            'tar' => 'libkarma-0.1.0.tar.gz',
            'var' => 'VERSION',
		   },
  );

#
# End Config Options
################################################################################

################################################################################
#
# Functions specific to this module

sub gsb_mono_url_make {

  my $name = shift;
  my $url  = shift; my $ver  = shift;
  my $src  = shift;

  my $thisurl = "$url/$name-$ver.$src";
  return $thisurl;

}

