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
   'boo'                   => {
                            'ver' => '0.7.0.1921',
                            'url' => 'http://go-mono.com/sources/boo/',
                            'src' => 'tar.gz',
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
                            'ver' => '0.20',
                            'url' => 'http://go-mono.com/sources/ikvm',
                            'src' => 'tar.gz',
                           },
   'libgdiplus'             => {
                            'ver' => '1.1.10',
                            'url' => 'http://go-mono.com/sources/libgdiplus-1.1/',
                            'src' => 'tar.gz',
                           },
   'mono'                   => {
                            'ver' => '1.1.10',
                            'url' => 'http://go-mono.com/sources/mono-1.1/',
                            'src' => 'tar.gz',
                           },
   'monodevelop'            => {
                            'ver' => '0.8',
                            'url' => 'http://go-mono.com/sources/monodevelop/',
                            'src' => 'tar.gz',
                           },
   'monodoc'                => {
                            'ver' => '1.1.10',
                            'url' => 'http://go-mono.com/sources/monodoc',
                            'src' => 'tar.gz',
                           },
 );

our %mono_diff_naming =
  (
   'gtk-sharp2' => {
                'ver'  => '2.4.0',
                'name' => 'gtk-sharp',
		'url'  => 'http://go-mono.com/sources/gtk-sharp-2.0/',
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

