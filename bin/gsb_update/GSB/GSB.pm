package GSB::GSB;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%platform %platform_diff_naming %platform_fdo %desktop
		   %bindings_cxx %bindings_java %bindings_python);
our @EXPORT_OK = qw(%gnome);
our $VERSION = 0.03;

################################################################################
# Config Options
#

my %gnome =
  (
   'version'  => '2.9.92',
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
my $gsrcdir  = $gfiledir . '/sources';

#
# End Config Options
################################################################################

################################################################################
#
# Begin Functions

sub show_help {

  print STDERR <<EOF;

  $0 \<args\>

  --dl           download source tarballs
  --edit         edit SlackBuild files

NOT WORKING YET
  --conf         which files to download: gnome, gstreamer, office
                                          other, requirements
  --getlocal     get files from local directory, instead of mirror
  --getrelease   download release so that --getlocal can be used

EOF
}

# simple function to take a file name and url and download a source tarball
# gsb_tarball_get($file, $url);
sub gsb_tarball_get {
  my $file = shift;
  my $url = shift;

  system("wget --cache=on --progress=bar:force $url");
}

# hash has 3 keys
# give name, url, version, srctarballtype
sub gsb_other_url_make {
  my $name = shift;
  my $url  = shift;
  my $ver  = shift;
  my $src  = shift;

  my $thisurl = "$url/$name-$ver.$src";
  return $thisurl;
}

# Generic URL to download from gnome's ftp sources directory
sub gsb_gnome_generic_url_make {
  my $name = shift;
  my $ver  = shift;

  # get shortened directory name from version
  (my $sver = $ver) =~ s/(.*)\.(.*)\.(.*)$/$1\.$2/;

  my $thisurl = "$gsrcdir/$name/$sver/$name-$ver.tar.bz2";
  return $thisurl;
}


# Give name and version to function
sub gsb_gnome_platform_url_make {
  my $name = shift;
  my $ver  = shift;

  my $thisurl = "$pfiledir/$name-$ver.tar.bz2";
  return $thisurl;
}

# give name and version
sub gsb_gnome_desktop_url_make {
  my $name = shift;
  my $ver  = shift;

  my $thisurl = "$dfiledir/$name-$ver.tar.bz2";
  return $thisurl;
}

# give binding type, name and version
sub gsb_gnome_bindings_url_make {
  my $binding_type = shift;
  my $name         = shift;
  my $ver          = shift;

  my $thisurl = "$bfiledir/$binding_type/$name-$ver.tar.bz2";
  return $thisurl;
}

# End Functions
#
################################################################################
