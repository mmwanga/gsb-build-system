#!/usr/bin/perl

# Script that will download the latest gnome release and then
# update the various SlackBuilds in GSB.
#
# TODO:
#
#   - check if version is older or just different, then substitute new
#     version variable. If VERSION is changed change BUILD back to 1
#   - auto download themes. Get ximian-artwork rpm and extract
#   - cli args: --conf={all,gnome,requirements,gstreamer,office,other}
#               --getrelease
#               --getlocal
#   - need to account for packages (ie. avifile,openh323,pwlib,ffmpeg)
#     with both a VERSION Var and a PVERSION var so that both are updated
#   - for packages on sourceforge, change url to sf and have a function randomly download each
#     package from a different mirror
#
# $Id$

use strict;
use warnings;

################################################################################
# Config Options
#

# the .conf.pm files
my @conf =
  (
   'gnome',
   'gstreamer',
   'office',
   'other',
   'requirements',
  );

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
# main()

if (@ARGV != 1) {
  show_help();
  exit (0);
}

print "The following packages could not be downloaded:\n";
print "@bad_downloads\n";

# end main()
#
################################################################################

################################################################################
#
# Begin Functions

sub show_help {

  print STDERR <<EOF;

  $0 --conf=\<arg or all\>

  --conf         which files to download: gnome, gstreamer, office, other, requirements
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
