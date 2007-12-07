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
   'beagle'          => '0.3.0',
   'evolution-sharp' => '0.14.0.1',
   'f-spot'          => '0.4.1',
   'tomboy'          => '0.8.2',
   );

our %mono=
  (
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
				'ver' => '1.2.5',
				'url' => 'http://go-mono.com/sources/libgdiplus/',
				'src' => 'tar.bz2',
			       },
   'mono'                   => {
				'ver' => '1.2.5.2',
				'url' => 'http://go-mono.com/sources/mono/',
				'src' => 'tar.bz2',
			       },
   'monodevelop'            => {
				'ver' => '0.17',
				'url' => 'http://go-mono.com/sources/monodevelop/',
				'src' => 'tar.bz2',
			       },
   'monodoc'                => {
				'ver' => '1.2.5',
				'url' => 'http://go-mono.com/sources/monodoc',
				'src' => 'zip',
			       },
   'mono-tools'                => {
				'ver' => '1.2.4',
				'url' => 'http://go-mono.com/sources/mono-tools',
				'src' => 'tar.bz2',
			       },
  );

our %mono_diff_naming =
  (
   'avahi-sharp'  => {
                     'ver'  => '0.6.14',
                     'name' => 'avahi',
                     'url'  => 'http://avahi.org/download/',
                     'src'  => 'tar.gz',
                    },
   'gtk-sharp2'  => {
		     'ver'  => '2.10.2',
		     'name' => 'gtk-sharp',
		     'url'  => 'http://go-mono.com/sources/gtk-sharp210/',
		     'src'  => 'tar.bz2',
		    },
   'dbus-sharp'  => {
		     'ver'  => '0.93',
		     'name' => 'dbus',
		     'url'  => 'http://dbus.freedesktop.org/releases/',
		     'src'  => 'tar.gz',
		    },
   'gmime-sharp' => {
		    'ver'  => '2.2.3',
		    'name' => 'gmime',
		    'url'  => 'http://spruce.sourceforge.net/gmime/sources/v2.2/',
		    'src'  => 'tar.gz',
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
  my $url  = shift;
  my $ver  = shift;
  my $src  = shift;

  my $thisurl = "$url/$name-$ver.$src";
  return $thisurl;

}

