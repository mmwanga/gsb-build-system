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
#   - new args: --dl --edit
#
# $Id$

use strict;
use warnings;

# GSB Modules
#use GSB::Edit;
use GSB::GSB;
use GSB::Gnome;
use GSB::GStreamer;
use GSB::Office;
use GSB::Other;
use GSB::Requirements;
use GSB::Desktop_Requirements;

use Cwd;

################################################################################
#
# config variables

# command line args variables
my $download = "";
my $edit     = "";
my $conf     = "";

my $sb_ext = '.SlackBuild';

my $gsb_root_sources = "../../src";

my @bad_downloads = "";


# Group similar hashes together
my %gnome_packages =
  (
   '%platform'             => 'gnome/platform',
   '%desktop'              => 'gnome/desktop',
   '%themes'               => 'gnome/themes',
   '%office_gnome'         => 'office',
   '%office_gnome_libs'    => 'office/libs',
   '%gstreamer'            => 'gnome/desktop',
  );

my %gnome_bindings =
  (
   '%bindings_cxx'     => {
			   'type' => 'c++',
			   'dir'  => 'gnome/bindings/c++',
			  },
   '%bindings_java'    => {
			   'type' => 'java',
			   'dir'  => 'gnome/bindings/java',
		          },
   '%bindings_python'  => {
			   'type' => 'python',
			   'dir'  => 'gnome/bindings/python',
			  },
  );

my %gnome_other =
  (
   '%office'        => 'office',
   '%office_libs'   => 'office/libs',
   '%desktop_reqs'  => 'gnome/desktop_reqs',
   '%gst_libs'      => 'requirements',
   '%gst_other'     => 'other',
   '%other'         => 'other',,
  );

my %stupid_gm =
  (
   '%stupid_gnomemeeting_libs' => 'gnome/desktop_reqs',
  );

#
#
################################################################################

################################################################################
#
# main()

if (@ARGV < 1) {
  GSB::GSB::show_help();
  exit (0);
}

# Parse command line args

foreach (@ARGV) {

  if ( m/^--dl$/ ){
    $download = "true";
  }
  elsif ( m/^--edit$/ ){
    $edit = "true";
  }
  elsif ( m/^--conf=(.+)$/ ){
    $conf = $1;
  }
  else {
    die "ERROR: {$_} is a bad cmdline arg\n";
  }
}

# Change directory to GSB's sources

chdir $gsb_root_sources or
  warn "Can't change dir to GSB Sources: $!";

my $pwd = getcwd();

################################################################################
#
# Download and Edit

# DOWNLOAD Platform
foreach my $ppackage (keys %platform) {

  chdir "$pwd/gnome/platform/$ppackage";
  my $sb_file = $ppackage. $sb_ext;
  my $tarball = "$ppackage-$platform{$ppackage}.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_gnome_platform_url_make($ppackage, $platform{$ppackage});
      GSB::GSB::gsb_tarball_get($ppackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $platform{$ppackage});
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $ppackage );
  }
}

# DOWNLOAD other platform libs
foreach my $pnpackage (keys %platform_diff_naming) {

  chdir "$pwd/gnome/platform/$pnpackage";
  my $sb_file = $pnpackage. $sb_ext;
  my $name = $platform_diff_naming{$pnpackage}{name};
  my $ver  = $platform_diff_naming{$pnpackage}{ver};

  my $tarball = "$name-$ver.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_gnome_platform_url_make($name, $ver);
      GSB::GSB::gsb_tarball_get($pnpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $pnpackage);
  }
}

# DOWNLOAD freedesktop.org platform libs
foreach my $fdopackage (keys %platform_fdo) {

  chdir "$pwd/gnome/platform/$fdopackage";
  my $sb_file = $fdopackage . $sb_ext;
  my $packurl = $platform_fdo{$fdopackage}{url};
  my $ver     = $platform_fdo{$fdopackage}{ver};
  my $src     = $platform_fdo{$fdopackage}{src};

  my $tarball = "$fdopackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($fdopackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($fdopackage, $url);
    }else{
      print "tarball exists\n";
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $fdopackage);
  }
}

# Download Desktop Packages
foreach my $dpackage (keys %desktop) {

  chdir "$pwd/gnome/desktop/$dpackage";
  my $sb_file = $dpackage . $sb_ext;
  my $tarball = "$dpackage-$desktop{$dpackage}\.tar.bz2";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_gnome_desktop_url_make($dpackage, $desktop{$dpackage});
      GSB::GSB::gsb_tarball_get($dpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $desktop{dpackage});
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $dpackage);
  }
}

# Download Bindings

# Office apps
foreach my $ofpackage (keys %office) {

  chdir "$pwd/office/$ofpackage";
  my $sb_file = $ofpackage . $sb_ext;
  my $packurl = $office{$ofpackage}{url};
  my $ver     = $office{$ofpackage}{ver};
  my $src     = $office{$ofpackage}{src};

  my $tarball = "$ofpackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($ofpackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($ofpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $ofpackage);
  }
}

# GNOME Office
foreach my $office_pack (keys %office_gnome) {

  chdir "$pwd/office/$office_pack";
  my $sb_file = $office_pack . $sb_ext;
  my $tarball = "$office_pack-$office_gnome{$office_pack}.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_gnome_generic_url_make($office_pack, $office_gnome{$office_pack});
      GSB::GSB::gsb_tarball_get($office_pack, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $office_gnome{$office_pack});
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $office_pack,);
  }
}

# GNOME Office libs
foreach my $office_pack (keys %office_gnome_libs) {

  chdir "$pwd/office/libs/$office_pack";
  my $sb_file = $office_pack . $sb_ext;
  my $tarball = "$office_pack-$office_gnome_libs{$office_pack}.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_gnome_generic_url_make($office_pack, $office_gnome_libs{$office_pack});
      GSB::GSB::gsb_tarball_get($office_pack, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $office_gnome_libs{$office_pack});
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $office_pack);
  }
}

# Office libs
foreach my $olpackage (keys %office_libs) {

  chdir "$pwd/office/libs/$olpackage";
  my $sb_file = $olpackage . $sb_ext;
  my $packurl = $office_libs{$olpackage}{url};
  my $ver     = $office_libs{$olpackage}{ver};
  my $src     = $office_libs{$olpackage}{src};

  my $tarball = "$olpackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($olpackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($olpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $olpackage);
  }
}

# Other apps
foreach my $opackage (keys %other) {

  chdir "$pwd/other/$opackage";
  my $sb_file = $opackage . $sb_ext;
  my $packurl = $other{$opackage}{url};
  my $ver     = $other{$opackage}{ver};
  my $src     = $other{$opackage}{src};

  my $tarball = "$opackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($opackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($opackage, $url);
    }else{
      print "tarball exists\n";
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $opackage);
  }
}

# Other gnome apps
foreach my $other_pack (keys %other_gnome) {

  chdir "$pwd/other/$other_pack";
  my $sb_file = $other_pack . $sb_ext;
  my $tarball = "$other_pack-$other_gnome{$other_pack}.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_gnome_generic_url_make($other_pack, $other_gnome{$other_pack});
      GSB::GSB::gsb_tarball_get($other_pack, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $other_gnome{$other_pack});
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $other_pack);
  }
}

print "The following packages could not be downloaded:\n";
print "@bad_downloads\n";

# end main()
#
################################################################################
