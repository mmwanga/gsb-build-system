package GSB::Edit;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(gsb_version_edit gsb_build_edit);
our @EXPORT_OK = qw();
our $VERSION = 0.03;

################################################################################
#
# Functions

# give the function a number and a slackbuild file
# and it will search for ^VERSION=
# check if its the same -> do nothing
# if different edit the variable with the new number and then edit the BUILD
# variable to 1

sub gsb_version_edit {

  return (0);

}

# takes a number and then edit's the ^BUILD= variable
sub gsb_build_edit {

  my $newnum = shift;

  return (0);

}

#
# End Functions
################################################################################
