package GSB::GSB;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%platform %platform_diff_naming %platform_fdo %desktop
		   %bindings_cxx %bindings_java %bindings_python);
our @EXPORT_OK = qw(%gnome);
our $VERSION   = 0.03;

use GSB::Verify;

################################################################################
# Config Options
#

my %gnome =
  (
   'version'  => '2.10.0',
   'release'  => '2.10',
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

my $wget_options = "--cache=on --progress=bar:force";

my $gnome_md5_file = "md5sum";

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
  --edit         edit SlackBuild files. Updates VERSION and BUILD variables
  --build=arg    append string to all BUILD variables in the SlackBuild
                 files. ie --build=frg would make BUILD=1frg

NOT WORKING YET
  --conf         which files to download: platform, desktop, desktop_reqs,
                                          office, other, bindings, themes
  --getlocal     get files from local directory, instead of mirror
  --getrelease   download release so that --getlocal can be used

EOF
}

# simple function to grab a url
sub gsb_get {

  my $url = shift;

  system("wget $wget_options $url");
}

# simple function to take a file name and url and download a source tarball
# gsb_tarball_get($file, $url);
sub gsb_tarball_get {

  my $name    = shift;
  my $ver     = shift;
  my $tarball = shift;
  my $type    = shift;
  my $url     = shift;

#  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  if ( ! -f $tarball ) {
    system("wget $wget_options $url");
  }

  my $verify = "";
  $verify = GSB::Verify::gsb_md5_verify($name, $ver, $type);

  if ( $verify ne "" ) {
    if ( $verify eq "bad" ) {
      unlink $tarball;
      gsb_tarball_get($name, $ver, $tarball, $url);
    }
    elsif ( $verify eq "good" ) {
      print "$name tarball md5 matches\n";
    }
    else {
      print "md5 not checked\n";
    }
  }
}

# give url, tarball name
sub gsb_other_url_make {

  my $url     = shift;
  my $tarball = shift;

  return my $thisurl = "$url/$tarball";
}

# Generic URL to download from gnome's ftp sources directory
sub gsb_gnome_generic_url_make {
  my $name = shift;
  my $ver  = shift;
  my $type = shift;

  # get shortened directory name from version
  my $sver = join '.', (split( /\./, $ver ))[0,1];

  return my $thisurl = "$gsrcdir/$name/$sver/$name-$ver.tar.bz2";
}


# construct a url for a md5 sum of a gnome tarball
sub gsb_gnome_md5sum_url_make {
  my $name = shift;
  my $ver  = shift;

  # get shortened directory name from version
  my $sver = join '.', (split( /\./, $ver ))[0,1];

  my $thisurl = "$gsrcdir/$name/$sver/$name-$ver.md5sum";
  return $thisurl;
}

# construct a url for a md5 sum file of some tarball
sub gsb_other_md5sum_url_make {
  my $url      = shift;
  my $md5_file = shift;

  return my $thisurl = "$url/$md5_file";
}


sub gsb_gnome_tarball_get {

  my $name    = shift;
  my $ver     = shift;
  my $tarball = shift;

  my $md5_file = "$name-$ver.$gnome_md5_file";

  my $type = "gnome";

  my $url     = GSB::GSB::gsb_gnome_generic_url_make($name, $ver);
  my $md5_url = GSB::GSB::gsb_gnome_md5sum_url_make($name, $ver);

  if ( ! -f $tarball ){
    system("wget $wget_options $url");
  }

  if ( ! -f $md5_file ){
    system("wget $wget_options $md5_url");
  }

  my $verify = "";
  $verify = GSB::Verify::gsb_md5_verify($name, $ver, $type);

  if ( $verify ne "" ) {
    if ( $verify eq "bad" ) {
      unlink $tarball;
      unlink $md5_file;
      gsb_gnome_tarball_get($name, $ver, $tarball);
    }
    elsif ( $verify eq "good" ) {
      print "\n *** $name tarball md5 matches ***\n\n\n";
    }
    else {
      print "\n\n DEBUG: md5 not checked\n\n\n";
    }
  }

}

sub gsb_gnome_tarball_name_make {

  my $name = shift;
  my $ver  = shift;

  return my $tarball = "$name-$ver.tar.bz2";
}

sub gsb_gnome_md5sum_name_make {

  my $name = shift;
  my $ver  = shift;

  return my $tarball = "$name-$ver.md5sum";
}

sub gsb_generic_tarball_name_make {

  my $name = shift;
  my $ver  = shift;
  my $src  = shift;

  return my $tarball = "$name-$ver.$src";
}


# End Functions
#
################################################################################

# Functions that were written but are not used:
# left here in case we use them again

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
