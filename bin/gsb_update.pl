#!/usr/bin/perl

# Script that will download the latest gnome release and then
# update the various SlackBuilds in GSB.
#
# TODO:
#
#   - Verify.pm: add md5 and gpg checking of src tarballs
#   - add perl bindings to auto download
#   - add a --option to remove build string
#
# TODO AFTER 0.2.0 release:
#
#   - Clean up repeatitive areas of gsb_update.pl
#   - cli args: --conf={all,platform,desktop,desktop_reqs,office,other}
#               --getrelease
#               --getlocal
#   - for packages on sourceforge, change url to "sf" and have an existing function
#     check if url is eq "sf" and download each package from a random sf mirror
#     Store list of mirror in an array.
#   - add function to GSB.pm to construct the tarball name
#   - add function to delete old src tarballs
#   - podify all modules
#
# $Id$

use strict;
use warnings;

# Add our lib dir to @INC
use FindBin qw($Bin);
use lib "$Bin/../lib/perl/"; 

# GSB Modules
use GSB::Edit;
use GSB::GSB;
use GSB::Verify;

# GSB Source Tarballs
use GSB::DoubleTar;
use GSB::Libraries;
use GSB::Platform;
use GSB::Desktop;
use GSB::Applications;
use GSB::Accessibility;
use GSB::Bindings;
use GSB::Meta;
use GSB::Mono;
use GSB::Office;
use GSB::Extras;
use GSB::Compiz;
use GSB::Fonts;
use GSB::Supplied;
use GSB::Themes;
use GSB::Tools;
use GSB::Testing;
use GSB::Ooo;

use Cwd;

################################################################################
#
# config variables

# command line args variables
my $download = "";
my $edit     = "";
my $conf     = "";
my $build    = "";

my $sb_ext = '.SlackBuild';

my $gsb_root_sources = "$Bin/../src";

my @bad_downloads;

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
  elsif ( m/^--build=(.+)$/ ){
    $build = $1;
  }
  else {
    die "ERROR: {$_} is a bad cmdline arg\n";
  }
}

# Change directory to GSB's sources

chdir $gsb_root_sources or
  die "Can't change dir to GSB Sources: $!";

my $pwd = getcwd();

################################################################################
#
# Download and Edit


# More extra tarballs.
foreach my $dtu (keys %double_tarballs_url) {

  my $name    = $dtu;

  my $dir     = $double_tarballs_url{$dtu}{dir};
  my $var     = $double_tarballs_url{$dtu}{var};
  my $ver     = $double_tarballs_url{$dtu}{ver};
  my $tarball = $double_tarballs_url{$dtu}{tar};
  my $packurl = $double_tarballs_url{$dtu}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# Download Tools
foreach my $tool (keys %tools) {

  my $name    = $tool;

  my $dir     = $tools{$tool}{dir};
  my $var     = $tools{$tool}{var};
  my $ver     = $tools{$tool}{ver};
  my $tarball = $tools{$tool}{tar};
  my $packurl = $tools{$tool}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}


# Download Microsoft TrueType core fonts
foreach my $font (keys %fonts) {

  my $name    = $font;

  my $dir     = $fonts{$font}{dir};
  my $var     = $fonts{$font}{var};
  my $ver     = $fonts{$font}{ver};
  my $tarball = $fonts{$font}{tar};
  my $packurl = $fonts{$font}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/libraries: download src libraries
foreach my $drpackage (keys %libraries) {

  my $name    = $drpackage;
  
  my $sb_file = $name . $sb_ext;
  my $packurl = $libraries{$name}{url};
  my $ver     = $libraries{$name}{ver};
  my $src     = $libraries{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/libraries/$name";

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/libraries: download src tarballs from gnome ftp
foreach my $ppackage (keys %libraries_gnome) {

  my $name = $ppackage;
  my $ver  = $libraries_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/libraries/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name );
  }
}

# src/libraries packages that are from SVN.
# Note: this only edits the SlackBuilds to set BUILD.
foreach my $libsvnpackage (keys %libraries_svn) {

  my $name    = $libsvnpackage;
  my $sb_file = $name . $sb_ext;
  my $ver     = $libraries_svn{$name};

  chdir "$pwd/libraries/$name";

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }
}

# Set version/build numbers for metapackages
foreach my $mp (keys %meta_packages) {

  my $name    = $mp;
  my $sb_file = $name . $sb_ext;
  my $ver     = $meta_packages{$name};

  chdir "$pwd/meta/$name";

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }
}

# Set version/build numbers for our own tarballs
foreach my $sp (keys %supplied_tarballs) {

  my $name    = $sp;
  my $sb_file = $name . $sb_ext;
  my $ver     = $supplied_tarballs{$sp}{ver};
  my $section     = $supplied_tarballs{$sp}{section};

  chdir "$pwd/$section/$name";

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }
}

# src/platform packages that have different names compared to their src tarball name
foreach my $pnpackage (keys %libraries_diff_naming) {

  my $name    = $pnpackage;

  my $oname   = $libraries_diff_naming{$pnpackage}{name};
  my $ver     = $libraries_diff_naming{$pnpackage}{ver};
  my $sb_file = $name. $sb_ext;

  chdir "$pwd/libraries/$name";

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($oname, $ver);

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($oname, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/platform gnome ftp src tarballs
foreach my $ppackage (keys %platform) {

  my $name = $ppackage;
  my $ver  = $platform{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/platform/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name );
  }
}

# src/platform: misc src tarballs
foreach my $fdopackage (keys %platform_reqs) {

  my $name    = $fdopackage;

  my $sb_file = $name . $sb_ext;
  my $packurl = $platform_reqs{$name}{url};
  my $ver     = $platform_reqs{$name}{ver};
  my $src     = $platform_reqs{$name}{src};
  my $type    = "fdo";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/platform/$name";

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/desktop: gnome src tarballs
foreach my $dpackage (keys %desktop) {

  my $name    = $dpackage;
  my $ver     = $desktop{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/desktop/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/desktop: gnome packages with different naming conventions
foreach my $dnpackage (keys %desktop_diff_naming) {

  my $pack    = $dnpackage;
  my $sb_file = $pack . $sb_ext;
  my $name    = $desktop_diff_naming{$pack}{name};
  my $ver     = $desktop_diff_naming{$pack}{ver};

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/desktop/$pack";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $pack);
  }
}

# Download non gnome Desktop Packages
foreach my $ngpackage (keys %desktop_nongnome) {

  my $name    = $ngpackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $desktop_nongnome{$name}{url};
  my $ver     = $desktop_nongnome{$name}{ver};
  my $src     = $desktop_nongnome{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/desktop/$name";

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/applications: gnome src tarballs
foreach my $apackage (keys %applications_gnome) {

  my $name    = $apackage;
  my $ver     = $applications_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/applications/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/applications: non-gnome src tarballs
foreach my $angpackage (keys %applications) {

  my $name    = $angpackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $applications{$name}{url};
  my $ver     = $applications{$name}{ver};
  my $src     = $applications{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/applications/$name";

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/accessibility: gnome src tarballs
foreach my $acpackage (keys %accessibility_gnome) {

  my $name    = $acpackage;
  my $ver     = $accessibility_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/accessibility/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# Download Bindings
# C++
foreach my $cbpackage (keys %bindings_cxx) {

  my $name    = $cbpackage;
  my $ver     = $bindings_cxx{$name};
  my $sb_file = $name . $sb_ext;

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/bindings/$name";

  if ( $download eq "true") {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}


# Office apps
foreach my $ofpackage (keys %office) {

  my $name    = $ofpackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $office{$name}{url};
  my $ver     = $office{$name}{ver};
  my $src     = $office{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/office/$name";

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# GNOME Office
foreach my $office_pack (keys %office_gnome) {

  my $name    = $office_pack;
  my $ver     = $office_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/office/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name,);
  }
}

# src/office packages that are from SVN.
# Note: this only edits the SlackBuilds to set BUILD.
foreach my $officesvnpackage (keys %office_svn) {

  my $name    = $officesvnpackage;
  my $sb_file = $name . $sb_ext;
  my $ver     = $office_svn{$name};

  chdir "$pwd/office/$name";

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }
}

# GNOME Mono
foreach my $gnome_mono_pack (keys %mono_gnome) {

  my $name    = $gnome_mono_pack;
  my $ver     = $mono_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/mono/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name,);
  }
}

# MONO
foreach my $omono_pack (keys %mono) {

  my $name    = $omono_pack;

  my $sb_file = $name . $sb_ext;
  my $packurl = $mono{$name}{url};
  my $ver     = $mono{$name}{ver};
  my $src     = $mono{$name}{src};
  my $type    = "other";

  my $tarball = "$name-$ver.$src";

  chdir "$pwd/mono/$name";

  if ( $download eq "true" ) {
    my $url = GSB::Mono::gsb_mono_url_make($name, $packurl, $ver, $src);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# More extra tarballs.
foreach my $dtu (keys %mono_diff_naming) {

  my $name    = $dtu;

  my $dir     = $mono_diff_naming{$dtu}{dir};
  my $var     = $mono_diff_naming{$dtu}{var};
  my $ver     = $mono_diff_naming{$dtu}{ver};
  my $tarball = $mono_diff_naming{$dtu}{tar};
  my $packurl = $mono_diff_naming{$dtu}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);
  
  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }
  
  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }
    
  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  } 
  
  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
} 

# Extra Applications found on GNOME Source Tree

foreach my $other_pack (keys %extras_gnome) {

  my $name = $other_pack;
  my $ver  = $extras_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/extras/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# Extra applications for GSB GNOME Desktop
# found outside the regular GNOME Tree
foreach my $opackage (keys %extras) {

  chdir "$pwd/extras/$opackage";
  my $name    = $opackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $extras{$name}{url};
  my $ver     = $extras{$name}{ver};
  my $src     = $extras{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  if ( $download eq "true") {
      my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
      GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $src, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# Compiz modules 
foreach my $cpackage (keys %compiz) {

  chdir "$pwd/compiz/$cpackage";
  my $name    = $cpackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $compiz{$name}{url};
  my $ver     = $compiz{$name}{ver};
  my $src     = $compiz{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);
  
  if ( $download eq "true") {
      my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
      GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $src, $url);
  }
  
  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }
  
  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }
  
  if ( ! -f $tarball ) { 
    push(@bad_downloads, $name);
  }
}

# Download other themes
foreach my $otheme (keys %other_themes) {

  my $name = $otheme;

  my $sb_file = $name . $sb_ext;
  my $packurl = $other_themes{$name}{url};
  my $ver     = $other_themes{$name}{ver};
  my $src     = $other_themes{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/themes/$name";

  if ( $download eq "true" ) {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name );
  }
}

# Download themes from GNOME
foreach my $gtheme (keys %gnome_themes) {

  my $name = $gtheme;
  my $ver  = $gnome_themes{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/themes/$name";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name );
  }
}

# Download themes with unconventional names
foreach my $dttheme (keys %double_tarballs_themes) {

  my $name    = $dttheme;

  my $dir     = $double_tarballs_themes{$dttheme}{dir};
  my $var     = $double_tarballs_themes{$dttheme}{var};
  my $ver     = $double_tarballs_themes{$dttheme}{ver};
  my $tarball = $double_tarballs_themes{$dttheme}{tar};
  my $packurl = $double_tarballs_themes{$dttheme}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}


# Download Testing Packages
foreach my $testpkg (keys %testing_packages) {

  my $name    = $testpkg;

  my $dir     = $testing_packages{$testpkg}{dir};
  my $var     = $testing_packages{$testpkg}{var};
  my $ver     = $testing_packages{$testpkg}{ver};
  my $tarball = $testing_packages{$testpkg}{tar};
  my $packurl = $testing_packages{$testpkg}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# Download OpenOffice Packages
foreach my $ooopkg (keys %ooo_packages) {

  my $name    = $ooopkg;

  my $dir     = $ooo_packages{$ooopkg}{dir};
  my $var     = $ooo_packages{$ooopkg}{var};
  my $ver     = $ooo_packages{$ooopkg}{ver};
  my $tarball = $ooo_packages{$ooopkg}{tar};
  my $packurl = $ooo_packages{$ooopkg}{url};
  my $type    = 'other';

  chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# src/testing packages that are from SVN.
# Note: this only edits the SlackBuilds to set BUILD.
foreach my $testingsvnpackage (keys %testing_svn) {

  my $name    = $testingsvnpackage;
  my $sb_file = $name . $sb_ext;
  my $ver     = $testing_svn{$name};

  chdir "$pwd/testing/$name";

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }
}

# DONE DOWNLOADING

if ( $download eq "true" ) {
    if ( ! @bad_downloads eq "" ) {
	print "\nThe following packages could not be downloaded:\n\n";

	foreach my $bad_pack (@bad_downloads) {
	    print "$bad_pack\n";
	}
	print "\n";
    }else {
	print "\nEverything downloaded successfully!\n\n";
    }
}

exit(0);

#
################################################################################
