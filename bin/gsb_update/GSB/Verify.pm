package GSB::Verify;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw();
our @EXPORT_OK = qw();
our $VERSION = 0.03;

################################################################################
#
# Functions to verify integrity of src tarballs using md5 and gpg

# verify tarball with md5 sums
# give function tarball name and (md5sum file/md5 hash)
sub tarball_md5_sum_verify{

  my $tarball       = shift;
  my $md5_sum_file  = shift;

  # get md5 sum of
  my $tarmd5 = "foo";

  if ( $tarmd5 eq $md5sum ) {
    return (0);
  } else {
    return (1);
  }
}

# verify tarball with gpg signature
# give function tarball name and gpg signature file
sub gpg_sig_verify {

  my $tarball   = shift;
  my $signature = shift;
  my $verify    = "false";

  if ( ) {
    $verify = "true";
  }

  if ( $verify_sig eq "true" ) {
    return (0);
  } else {
    return (1);
  }

}

#
# End Functions
################################################################################
