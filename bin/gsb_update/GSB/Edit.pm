package GSB::Edit;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(gsb_sb_edit);
our @EXPORT_OK = qw(gsb_version_edit gsb_build_edit);
our $VERSION = 0.03;

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
  my $ver = shift;



}

# Edit the VERSION variable
# give the function a filehandle and version number as args
sub gsb_version_edit {

  my $newver = shift;
  return (0);

}

# Edit the ^BUILD= variable
# Give the function a number as an arg
sub gsb_build_edit {

  my $newnum = shift;

  return (0);

}

#
# End Functions
################################################################################
