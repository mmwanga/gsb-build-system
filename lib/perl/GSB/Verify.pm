package GSB::Verify;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw();
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

use Digest::MD5;

################################################################################
#
# Functions to verify integrity of src tarballs using md5 and gpg

# verify tarball with md5 sums
# give function tarball name and (md5sum file/md5 hash)
sub gsb_generic_md5_verify{

  my $tarball       = shift;
  my $md5_sum_file  = shift;

  # get md5 sum of
  my $tarmd5 = "foo";
  my $md5sum = "";

  if ( $tarmd5 eq $md5sum ) {
    return (0);
  } else {
    return (1);
  }
}

# verify tarball with gpg signature
# give function tarball name and gpg signature file
sub gsb_gpg_sig_verify {

  my $tarball   = shift;
  my $signature = shift;
  my $verify    = "false";

  my $verify_sig = "";

  if ( $verify_sig ) {
    $verify = "true";
  }

  if ( $verify_sig eq "true" ) {
    return (0);
  } else {
    return (1);
  }

}


# Verify md5sum of a gnome tarball
# give function name and version
sub gsb_gnome_md5_verify {

  my $name = shift;
  my $ver  = shift;

  my $tarball  = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);
  my $md5_file = GSB::GSB::gsb_gnome_md5sum_name_make($name, $ver);

# get md5sum of downloaded tarball
  open(my $tfh, "$tarball")
    or warn "Could not open $tarball: $!";
  binmode($tfh);
  my $tar_md5 = Digest::MD5->new->addfile(*$tfh)->hexdigest;

  close($tfh);

# get the verified md5sum from the file
  open(my $ffh, "$md5_file")
    or warn "Could not open $md5_file: $!";

  my @real_md5 = "";
  foreach my $line (<$ffh>) {
    chomp($line);

    if ( $line =~ /.*tar\.bz2$/ ) {
      @real_md5 = split /  /, $line;
    }
  }
  close($ffh);

  if ( $tar_md5 eq $real_md5[0] ) {
    return "good";
  } else {
    return "bad";
  }
}

sub gsb_md5_verify {

  my $name = shift;
  my $ver  = shift;
  my $type = shift;

  my $verify = "";

  if ( $type eq "gnome" ) {
    $verify = gsb_gnome_md5_verify($name, $ver);
  }
  elsif ( $type eq "other" ) {
    $verify = "good";
  }
  else {
    $verify = "good";
  }

  return $verify;
}

#
# End Functions
################################################################################
