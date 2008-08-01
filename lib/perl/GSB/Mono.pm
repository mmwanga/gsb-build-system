package GSB::Mono;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%mono %mono_gnome %mono_diff_naming %mono_svn);
our @EXPORT_OK = qw();
our $VERSION   = 0.01;

################################################################################
# Config Options for Mono
#

our %mono_gnome =
  (
   'evolution-sharp' => '0.16.1.1',
   'f-spot'          => '0.4.4',
   'tomboy'          => '0.10.2',
   'gtk-sharp'       => '2.12.1',
   'gnome-sharp'     => '2.20.1',
   'gnome-desktop-sharp'     => '2.20.1',
   );

our %mono=
  (
   'gecko-sharp'        => {
				'ver' => '2.0-0.13',
				'url' => 'http://go-mono.com/sources/gecko-sharp2/',
				'src' => 'tar.bz2',
			    },
   'gtksourceview-sharp' => {
				 'ver' => '2.0-0.12',
				 'url' => 'http://go-mono.com/sources/gtksourceview-sharp-2.0/',
				 'src' => 'tar.bz2',
				},
   'libgdiplus'             => {
				'ver' => '1.9',
				'url' => 'http://go-mono.com/sources/libgdiplus/',
				'src' => 'tar.bz2',
			       },
   'libgphoto2-sharp' => {
		    'ver'  => '2.3.0',
		    'url'  => 'http://kent.dl.sourceforge.net/sourceforge/gphoto',
		    'src'  => 'tar.bz2',
		   },
   'ipod-sharp'             => {
				'ver' => '0.8.0',
				'url' => 'http://banshee-project.org/files/ipod-sharp',
				'src' => 'tar.gz',
			       },
   'mono'                   => {
				'ver' => '1.9.1',
				'url' => 'http://go-mono.com/sources/mono/',
				'src' => 'tar.bz2',
			       },
   'monodevelop'            => {
				'ver' => '1.0',
				'url' => 'http://go-mono.com/sources/monodevelop/',
				'src' => 'tar.bz2',
			       },
   'mono-addins'            => {
				'ver' => '0.3.1',
				'url' => 'http://go-mono.com/sources/mono-addins/',
				'src' => 'tar.bz2',
			       },
   'mono-zeroconf'            => {
		'ver' => '0.7.6',
		'url' => 'http://banshee-project.org/files/mono-zeroconf',
		'src' => 'tar.bz2',
			       },
   'monodoc'                => {
				'ver' => '1.9',
				'url' => 'http://go-mono.com/sources/monodoc',
				'src' => 'zip',
			       },
   'mono-tools'                => {
				'ver' => '1.9',
				'url' => 'http://go-mono.com/sources/mono-tools',
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
				'ver' => '2.0.3.0',
				'url' => 'http://www.taglib-sharp.com/Download',
				'src' => 'tar.gz',
			       },
   'gnome-do'                => {
				'ver' => '0.5.0.1',
				'url' => 'http://launchpad.net/do/trunk/0.5/+download',
				'src' => 'tar.gz',
		        	},
   'banshee-1'            => {
             'url' => 'http://banshee-project.org/files/banshee',
             'ver' => '1.0.0',
             'src' => 'tar.bz2'
                        },

  );

our %mono_diff_naming =
  (
   'avahi-sharp'  => {
             'url' => 'http://avahi.org/download',
             'ver' => '0.6.23',
             'dir' => 'mono/avahi-sharp',
             'tar' => 'avahi-0.6.23.tar.gz',
             'var' => 'VERSION',
                        },
   'gmime-sharp' => {
		    'url'  => 'ftp://ftp.gnome.org/pub/gnome/sources/gmime/2.2',
		    'ver'  => '2.2.9',
            'dir' => 'mono/gmime-sharp',
            'tar' => 'gmime-2.2.9.tar.bz2',
            'var' => 'VERSION',
		   },
   'libkarma-sharp' => {
		    'url'  => 'http://www.freakysoft.de/libkarma',
		    'ver'  => '0.1.0',
            'dir' => 'mono/karma-sharp',
            'tar' => 'libkarma-0.1.0.tar.gz',
            'var' => 'VERSION',
		   },
   'gnome-do-plugins' => {
		    'url'  => 'http://launchpad.net/do/trunk/0.4/+download',
		    'ver'  => '0.4.0',
            'dir' => 'mono/gnome-do-plugins',
            'tar' => 'do-plugins-0.4.0.tar.gz',
            'var' => 'VERSION',
		   },
  );

our %mono_svn =
  (
   'podsleuth' => 'svn_60',
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

