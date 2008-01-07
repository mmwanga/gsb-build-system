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
   'beagle'          => '0.3.1',
   'evolution-sharp' => '0.14.0.1',
   'f-spot'          => '0.4.1',
   'tomboy'          => '0.8.2',
   );

our %mono=
  (
   'banshee'        => {
				'ver' => '0.13.1',
				'url' => 'http://banshee-project.org/files/banshee',
				'src' => 'tar.bz2',
			    },
   'gecko-sharp'        => {
				'ver' => '2.0-0.12',
				'url' => 'http://go-mono.com/sources/gecko-sharp-2.0/',
				'src' => 'tar.gz',
			    },
   'gnome-sharp'        => {
				'ver' => '2.16.0',
				'url' => 'http://go-mono.com/sources/gnome-sharp2/',
				'src' => 'tar.gz',
			       },
   'gtk-sharp'              => {
				'ver' => '2.10.2',
				'url' => 'http://go-mono.com/sources/gtk-sharp210/',
				'src' => 'tar.bz2',
			       },
   'gtksourceview-sharp' => {
				 'ver' => '2.0-0.11',
				 'url' => 'http://go-mono.com/sources/gtksourceview-sharp-2.0/',
				 'src' => 'tar.bz2',
				},
   'libgdiplus'             => {
				'ver' => '1.2.6',
				'url' => 'http://go-mono.com/sources/libgdiplus/',
				'src' => 'tar.bz2',
			       },
   'libgphoto2-sharp' => {
		    'ver'  => '2.3.0',
		    'url'  => 'http://downloads.sourceforge.net/gphoto',
		    'src'  => 'tar.bz2',
		   },
   'ipod-sharp'             => {
				'ver' => '0.6.3',
				'url' => 'http://banshee-project.org/files/ipod-sharp',
				'src' => 'tar.gz',
			       },
   'mono'                   => {
				'ver' => '1.2.6',
				'url' => 'http://go-mono.com/sources/mono/',
				'src' => 'tar.bz2',
			       },
   'monodevelop'            => {
				'ver' => '0.18.1',
				'url' => 'http://go-mono.com/sources/monodevelop/',
				'src' => 'tar.bz2',
			       },
   'mono-addins'            => {
				'ver' => '0.3',
				'url' => 'http://go-mono.com/sources/mono-addins/',
				'src' => 'tar.bz2',
			       },
   'monodoc'                => {
				'ver' => '1.2.6',
				'url' => 'http://go-mono.com/sources/monodoc',
				'src' => 'zip',
			       },
   'mono-tools'                => {
				'ver' => '1.2.6',
				'url' => 'http://go-mono.com/sources/mono-tools',
				'src' => 'tar.bz2',
			       },
   'njb-sharp'                => {
				'ver' => '0.3.0',
				'url' => 'http://banshee-project.org/files/njb-sharp',
				'src' => 'tar.gz',
			       },
  );

our %mono_diff_naming =
  (
   'avahi-sharp'  => {
             'url' => 'http://avahi.org/download',
             'ver' => '0.6.21',
             'dir' => 'mono/avahi-sharp',
             'tar' => 'avahi-0.6.21.tar.gz',
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

