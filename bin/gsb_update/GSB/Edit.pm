#!/usr/bin/perl
#
# Module with edit routines to edit GSB's slackbuild files
#
# $Id$

use strict;
use warnings;

package GSB::Edit;


################################################################################
#
# Functions

# give the function a number and a slackbuild file
# and it will search for ^VERSION= 
# check if its the same -> do nothing
# if different edit the variable with the new number and then edit the BUILD
# variable to 1
sub gsb_version_edit {

}

# takes a number and then edit's the ^BUILD= variable
sub gsb_build_edit {

  my $newnum = shift;



}

#
# End Functions
################################################################################
