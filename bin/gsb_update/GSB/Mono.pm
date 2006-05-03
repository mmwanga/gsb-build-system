package GSB::Mono;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%mono %mono_diff_naming);
our @EXPORT_OK = qw();
our $VERSION   = 0.01;

################################################################################
# Config Options for Mono
#

our %mono=
  (
   'boo'                    => {
				'ver' => '0.7.5.2013',
				'url' => 'http://go-mono.com/sources/boo/',
				'src' => 'tar.gz',
			       },
   'banshee'                => {
				'ver' => '0.10.9',
				'url' => 'http://banshee-project.org/files/banshee/',
				'src' => 'tar.gz',
			       },
   'beagle'                 => {
				'ver' => '0.2.6',
				'url' => 'http://ftp.gnome.org/pub/GNOME/sources/beagle/0.2/',
				'src' => 'tar.bz2',
			       },
   'gecko-sharp-2.0'        => {
				'ver' => '0.11',
				'url' => 'http://go-mono.com/sources/gecko-sharp-2.0/',
				'src' => 'tar.gz',
			       },
   'gtk-sharp'              => {
				'ver' => '1.0.10',
				'url' => 'http://go-mono.com/sources/gtk-sharp/',
				'src' => 'tar.gz',
			       },
   'gtksourceview-sharp-2.0' => {
				 'ver' => '0.10',
				 'url' => 'http://go-mono.com/sources/gtksourceview-sharp-2.0/',
				 'src' => 'tar.gz',
				},
   'ikvm'                   => {
				'ver' => '0.22',
				'url' => 'http://go-mono.com/sources/ikvm',
				'src' => 'tar.gz',
			       },
   'ipod-sharp'             => {
				'ver' => '0.5.15',
				'url' => 'http://banshee-project.org/files/ipod-sharp/',
				'src' => 'tar.gz',
			       },
   'libgdiplus'             => {
				'ver' => '1.1.15',
				'url' => 'http://go-mono.com/sources/libgdiplus/',
				'src' => 'tar.gz',
			       },
   'libipoddevice'          => {
				'ver' => '0.4.1',
				'url' => 'http://banshee-project.org/files/libipoddevice/',
				'src' => 'tar.gz',
			       },
   'mono'                   => {
				'ver' => '1.1.15',
				'url' => 'http://go-mono.com/sources/mono/',
				'src' => 'tar.gz',
			       },
   'monodevelop'            => {
				'ver' => '0.10',
				'url' => 'http://go-mono.com/sources/monodevelop/',
				'src' => 'tar.gz',
			       },
   'monodoc'                => {
				'ver' => '1.1.13',
				'url' => 'http://go-mono.com/sources/monodoc',
				'src' => 'tar.gz',
			       },
  );

our %mono_diff_naming =
  (
   'gtk-sharp2'  => {
		     'ver'  => '2.8.2',
		     'name' => 'gtk-sharp',
		     'url'  => 'http://go-mono.com/sources/gtk-sharp-2.8/',
		     'src'  => 'tar.gz',
		    },
   'dbus-sharp'  => {
		     'ver'  => '0.61',
		     'name' => 'dbus',
		     'url'  => 'http://dbus.freedesktop.org/releases/',
		     'src'  => 'tar.gz',
		    },
   'gmime-sharp' => {
		    'ver'  => '2.2.1',
		    'name' => 'gmime',
		    'url'  => 'http://spruce.sourceforge.net/gmime/sources/v2.2/',
		    'src'  => 'tar.gz',
		   },
   'sqlite2'     => {
		     'ver'  => '2.8.17',
		     'name' => 'sqlite',
		     'url'  => 'http://sqlite.org/',
		     'src'  => 'tar.gz',
		    },
   'sqlite3'     => {
		     'ver'  => '3.3.5',
		     'name' => 'sqlite',
		     'url'  => 'http://sqlite.org/',
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

