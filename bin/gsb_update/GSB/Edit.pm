package GSB::Edit;
require Exporter;

use strict;
use warnings;
use Tie::File;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(gsb_sb_edit);
our @EXPORT_OK = qw(gsb_version_edit gsb_build_edit);
our $VERSION   = 0.03;

################################################################################
#
# Functions

# Edit the VERSION and BUILD variables with helper functions based on following
# criteria:
# * if VERSION variables are the same -> increment the BUILD variable by one
# * if VERSION variables are differnet -> change VERSION variable and make BUILD
#    variable 1
# give the function a SlackBuild file and a version number as args
sub gsb_sb_edit {

  my $file = shift;
  my $new_ver = shift;

  tie my @fh, 'Tie::File', $file
    or die "Cannot open $file: $!";

  my $sb_version = gsb_version_get(@fh);
  my $sb_build   = gsb_build_get(@fh);

  print "\n\n *** $new_ver *** $file *** $sb_version \n\n";

  if ( $new_ver eq $sb_version ) {
    #my $new_build_num = $sb_build + 1;
    #@fh = gsb_build_edit($new_build_num, @fh);
    print "VERSIONS are the same, do nothing\n";
  }else {
    @fh = gsb_version_edit($new_ver, @fh);
    @fh = gsb_build_edit("1", @fh);
  }

  untie @fh;
}

# Edit the VERSION variable
# give the function a version number and array as args
sub gsb_version_edit {

  my $newver = shift;
  my @arr = @_;

  for (@arr) {
    s/^VERSION=(.*)$/VERSION=$newver/;
  }

  return @arr;
}

# Edit the ^BUILD= variable
# Give the function a number as an arg
sub gsb_build_edit {

  my $newnum = shift;
  my @arr = @_;

  for (@arr) {
    s/^BUILD=(.*)$/BUILD=$newnum/;
  }

  return @arr;
}

# give function array
sub gsb_version_get {

  my $version_num;
  my @arr = @_;

  for (@arr) {
    if ( /^VERSION=(.*)$/ ) {
      $version_num = $1;
    }
  }
  return $version_num;
}

# give function array
sub gsb_build_get{

  my $build_num;
  my @arr = @_;

  for (@arr) {
    if ( /^BUILD=(.*)$/ ) {
      $build_num = $1;
    }
  }
  return $build_num;
}

#
# End Functions
################################################################################
