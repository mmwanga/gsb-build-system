#!/usr/bin/perl

use strict;
use warnings;

package GSB::GSB;

require Exporter;

our @ISA = ("Exporter");
our @EXPORT = qw($gfiledir %gnome);
our $VERSION = 0.0.3;

################################################################################
# Config Options
#

my %gnome =
  (
   'version'  => '2.9.91',
   'release'  => '2.9',
   'mirror'   => 'http://ftp.gnome.org',
   'srcroot'  => '/pub/GNOME',
   'platform' => '/platform',
   'desktop'  => '/desktop',
   'bindings' => '/bindings',
  );

my $gfiledir = $gnome{mirror} . $gnome{srcroot};
my $grelease = "/$gnome{release}/$gnome{version}/sources";

my $pfiledir = $gfiledir . $gnome{platform} . $grelease;
my $dfiledir = $gfiledir . $gnome{desktop}  . $grelease;
my $bfiledir = $gfiledir . $gnome{bindings} . $grelease;

my @bad_downloads = "";

#
# End Config Options
################################################################################

################################################################################
#
# Begin Functions

sub show_help {

  print STDERR <<EOF;

  $0 --conf=\<arg or all\>

  --conf         which files to download: gnome, gstreamer, office
                 other, requirements
  --getlocal     get files from local directory, instead of mirror
  --getrelease   download release so that --local can be used

EOF
}

# simple function to take a file name and url and download a source tarball
# gsb_tarball_get($file, $url);
sub gsb_tarball_get {

  my $file = shift;
  my $url = shift;

  system("wget -c $url") == 0
    or die "Could not Download $file" && push(@bad_downloads, $file);
}

# make a $url for use by gsb_tarball_get
#
# check for number of keys, either 2 or 3, if 2 then its a tar.bz2 file: url/name-ver.tar.bz2
# if 3, then construct the url as: url/name-ver.src
sub gsb_url_make {


}

# End Functions
#
################################################################################
