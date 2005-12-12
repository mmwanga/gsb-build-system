#!/usr/bin/perl

# Script that will download the latest gnome release and then
# update the various SlackBuilds in GSB.
#
# TODO:
#
#   - Themes.pm: themes for gnome-extra-themes need to be auto downloaded
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

# GSB Modules
use GSB::Edit;
use GSB::GSB;
use GSB::Gnome;
use GSB::GStreamer;
use GSB::Office;
use GSB::Extras;
use GSB::Mono;
use GSB::Desktop_Reqs;
use GSB::DoubleTar;
use GSB::Themes;
#use GSB::Verify;

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

my $gsb_root_sources = "../../src";

my @bad_downloads;

# THESE VARIABLES ARE NOT USED YET
# these are here to make the main code below less repetative eventually, still
# needs some changes
#
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
   '%bindings_perl'    => {
			   'type' => 'perl',
			   'dir'  => 'gnome/bindings/perl',
			  },

  );

my %gnome_other =
  (
   '%office'        => 'office',
   '%office_libs'   => 'office/libs',
   '%desktop_reqs'  => 'gnome/desktop_reqs',
   '%gst_libs'      => 'requirements',
   '%gst_other'     => 'other',
   '%mono'          => 'mono',
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

# DOWNLOAD Platform
foreach my $ppackage (keys %platform) {

  my $name = $ppackage;
  my $ver  = $platform{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/platform/$name";

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

# DOWNLOAD other platform libs
foreach my $pnpackage (keys %platform_diff_naming) {

  my $name    = $pnpackage;

  my $oname   = $platform_diff_naming{$pnpackage}{name};
  my $ver     = $platform_diff_naming{$pnpackage}{ver};
  my $sb_file = $name. $sb_ext;

  chdir "$pwd/gnome/platform/$name";

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

# DOWNLOAD freedesktop.org platform libs
foreach my $fdopackage (keys %platform_reqs) {

  my $name    = $fdopackage;

  my $sb_file = $name . $sb_ext;
  my $packurl = $platform_reqs{$name}{url};
  my $ver     = $platform_reqs{$name}{ver};
  my $src     = $platform_reqs{$name}{src};
  my $type    = "fdo";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/platform/$name";

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

# Download Desktop Reqs
foreach my $drpackage (keys %desktop_reqs) {

  my $name    = $drpackage;

  my $sb_file = $name . $sb_ext;
  my $packurl = $desktop_reqs{$name}{url};
  my $ver     = $desktop_reqs{$name}{ver};
  my $src     = $desktop_reqs{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/desktop_reqs/$name";

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

# Download Desktop Reqs for gnomemeeting
foreach my $gmpackage (keys %stupid_gnomemeeting_libs) {

  my $name    = $gmpackage;
  my $pack    = "openh323-pwlib";

  my $sb_file = $pack . $sb_ext;
  my $packurl = $stupid_gnomemeeting_libs{$name}{url};
  my $ver     = $stupid_gnomemeeting_libs{$name}{ver};
  my $src     = $stupid_gnomemeeting_libs{$name}{src};
  my $var     = $stupid_gnomemeeting_libs{$name}{var};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/desktop_reqs/$pack";

  if ( $download eq "true") {
    my $url = GSB::GSB::gsb_generic_url_make($packurl, $tarball);
    GSB::GSB::gsb_tarball_get($name, $ver, $tarball, $type, $url);
  }

  if ( $edit eq "true" ) {
    if ( $name eq "openh323" ) {
      GSB::Edit::gsb_sb_edit($sb_file, $ver);
    }else {
      GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
    }
  }

  if ( $name eq "openh323" ) {
    if ( $build ne "" ) {
      GSB::Edit::gsb_build_release_make($sb_file, $build);
    }
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
  }
}

# Download Desktop Packages
foreach my $dpackage (keys %desktop) {

  my $name    = $dpackage;
  my $ver     = $desktop{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/desktop/$name";

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

# DOWNLOAD other desktop tarballs
foreach my $dnpackage (keys %desktop_diff_naming) {

  my $pack    = $dnpackage;
  my $sb_file = $pack . $sb_ext;
  my $name    = $desktop_diff_naming{$pack}{name};
  my $ver     = $desktop_diff_naming{$pack}{ver};

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/desktop/$pack";

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

# DOWNLOAD some other desktop tarballs
foreach my $dopackage (keys %desktop_other) {

  my $name = $dopackage;
  my $ver  = $desktop_other{$name}{ver};
  my $sb_file = $desktop_other{$name}{dir} . $sb_ext;

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/desktop/$desktop_other{$name}{dir}";

  print "********** $tarball\n";

  if ( $download eq "true" ) {
    GSB::GSB::gsb_gnome_tarball_get($name, $ver, $tarball);
  }

# What to do about VERSION var here?
# maybe store the VARIABLE to edit in the hash somewhere?
# currently only gnome-games-extra-data
#  if ( $edit eq "true" ) {
#    GSB::Edit::gsb_sb_edit($sb_file, $ver);
#  }


  if ( ! -f $tarball ) {
    push(@bad_downloads, $name);
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

  chdir "$pwd/gnome/desktop/$name";

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

# Download Bindings
# C++
foreach my $cbpackage (keys %bindings_cxx) {

  my $name    = $cbpackage;
  my $ver     = $bindings_cxx{$name};
  my $sb_file = $name . $sb_ext;

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/bindings/c++/$name";

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

# java
foreach my $jbpackage (keys %bindings_java) {

  my $name    = $jbpackage;
  my $ver     = $bindings_java{$name};
  my $sb_file = $name . $sb_ext;

  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/bindings/java/$name";

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

# Python
foreach my $pbpackage (keys %bindings_python) {

  my $name = $pbpackage;
  my $ver  = $bindings_python{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/bindings/python/$name";

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

foreach my $pbopackage (keys %bindings_python_other) {

  my $name    = $pbopackage;

  my $sb_file = $name . $sb_ext;
  my $packurl = $bindings_python_other{$name}{url};
  my $ver     = $bindings_python_other{$name}{ver};
  my $src     = $bindings_python_other{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/bindings/python/$name";

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



# Perl
foreach my $plbpackage (keys %bindings_perl) {

  my $name    = $plbpackage;

  my $sb_file = $name . $sb_ext;
  my $packurl = $bindings_perl{$name}{url};
  my $ver     = $bindings_perl{$name}{ver};
  my $src     = $bindings_perl{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/bindings/perl/$name";

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

#DOWNLOAD THEMES

# Download themes from ftp.gnome.org
foreach my $gtheme (keys %gnome_themes) {

  my $name = $gtheme;
  my $ver  = $gnome_themes{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/themes/$name";

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

# Download other themes
foreach my $otheme (keys %other_themes) {

  my $name = $otheme;

  my $sb_file = $name . $sb_ext;
  my $packurl = $other_themes{$name}{url};
  my $ver     = $other_themes{$name}{ver};
  my $src     = $other_themes{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/themes/$name";

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

# GNOME Office libs
foreach my $goffice_libs (keys %office_gnome_libs) {

  my $name    = $goffice_libs;
  my $ver     = $office_gnome_libs{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/office/libs/$name";

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

# Office libs
foreach my $olpackage (keys %office_libs) {

  my $name    = $olpackage;
  my $sb_file = $olpackage . $sb_ext;
  my $packurl = $office_libs{$name}{url};
  my $ver     = $office_libs{$name}{ver};
  my $src     = $office_libs{$name}{src};
  my $type    = "other";

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/office/libs/$name";

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

# Extras libs
foreach my $opackage (keys %extras_libs) {

  chdir "$pwd/extras/libs/$opackage";
  my $name    = $opackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $extras_libs{$name}{url};
  my $ver     = $extras_libs{$name}{ver};
  my $src     = $extras_libs{$name}{src};
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


# Extra libs gnome
foreach my $other_pack (keys %extras_libs_gnome) {

  my $name = $other_pack;
  my $ver  = $extras_libs_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/extras/libs/$name";

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

# Extras libs other
foreach my $oother_pack (keys %extras_libs_other) {

  my $name    = $oother_pack;

  my $sb_file = $name . $sb_ext;
  my $packurl = $extras_libs_other{$name}{url};
  my $ver     = $extras_libs_other{$name}{ver};
  my $src     = $extras_libs_other{$name}{src};
  my $type    = 'other';

  my $tarball = "$name$ver.$src";

  chdir "$pwd/extras/libs/$name";

  if ( $download eq "true" ) {
    my $url = GSB::Extras::gsb_extras_libs_other_url_make($name, $packurl, $ver, $src);
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

# Other gnome apps
foreach my $other_pack (keys %extras_gnome_apps) {

  my $name = $other_pack;
  my $ver  = $extras_gnome_apps{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/extras/gnome-apps/$name";

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

# Extras libs
foreach my $package (keys %extras_gnome_other_apps) {

  chdir "$pwd/extras/gnome-apps/$package";
  my $name    = $package;
  my $sb_file = $name . $sb_ext;
  my $packurl = $extras_gnome_other_apps{$name}{url};
  my $ver     = $extras_gnome_other_apps{$name}{ver};
  my $src     = $extras_gnome_other_apps{$name}{src};
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

# Extra apps

foreach my $opackage (keys %extras_apps) {

  chdir "$pwd/extras/apps/$opackage";
  my $name    = $opackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $extras_apps{$name}{url};
  my $ver     = $extras_apps{$name}{ver};
  my $src     = $extras_apps{$name}{src};
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

# Extra apps gnome
foreach my $other_pack (keys %extras_apps_gnome) {

  my $name = $other_pack;
  my $ver  = $extras_apps_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/extras/apps/$name";

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

# Extra applets and extensions

foreach my $opackage (keys %extras_applets) {

  chdir "$pwd/extras/applets_extensions/$opackage";
  my $name    = $opackage;
  my $sb_file = $name . $sb_ext;
  my $packurl = $extras_applets{$name}{url};
  my $ver     = $extras_applets{$name}{ver};
  my $src     = $extras_applets{$name}{src};
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

# Extra applets gnome
foreach my $other_pack (keys %extras_applets_gnome) {

  my $name = $other_pack;
  my $ver  = $extras_applets_gnome{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/extras/applets_extensions/$name";

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


# Download GSTREAMER stuff
foreach my $gpackage (keys %gstreamer) {

  my $name    = $gpackage;
  my $ver     = $gstreamer{$name};

  my $sb_file = $name . $sb_ext;
  my $tarball = GSB::GSB::gsb_gnome_tarball_name_make($name, $ver);

  chdir "$pwd/gnome/desktop/$name";

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

# Download GSTREAMER libs
foreach my $gst_libs_pack (keys %gst_libs) {

  my $name    = $gst_libs_pack;


  my $sb_file = $name . $sb_ext;
  my $packurl = $gst_libs{$gst_libs_pack}{url};
  my $ver     = $gst_libs{$gst_libs_pack}{ver};
  my $src     = $gst_libs{$gst_libs_pack}{src};
  my $type    = 'other';

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/gnome/desktop_reqs/$name";

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
    push(@bad_downloads, $name);
  }
}

# Download extra tarballs for certain slackbuilds
foreach my $dlibs (keys %double_tarballs) {

  my $name    = $dlibs;

  my $dir     = $double_tarballs{$dlibs}{dir};
  my $packurl = $double_tarballs{$dlibs}{url};
  my $ver     = $double_tarballs{$dlibs}{ver};
  my $src     = $double_tarballs{$dlibs}{src};
  my $var     = $double_tarballs{$dlibs}{var};
  my $type    = 'other';


 chdir "$pwd/$dir";

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

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

# Download extra GSTREAMER plugins
foreach my $gst_plugins_pack (keys %gst_other) {

  my $name    = $gst_plugins_pack;

  my $sb_file = $gst_plugins_pack . $sb_ext;
  my $packurl = $gst_other{$gst_plugins_pack}{url};
  my $ver     = $gst_other{$gst_plugins_pack}{ver};
  my $src     = $gst_other{$gst_plugins_pack}{src};
  my $type    = 'other';

  my $tarball = GSB::GSB::gsb_generic_tarball_name_make($name, $ver, $src);

  chdir "$pwd/extras/libs/$gst_plugins_pack";


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

# mono
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

# DOWNLOAD other mono libs
foreach my $mononpackage (keys %mono_diff_naming) {

  my $name    = $mononpackage;

  my $oname   = $mono_diff_naming{$mononpackage}{name};
  my $ver     = $mono_diff_naming{$mononpackage}{ver};
  my $packurl = $mono_diff_naming{$mononpackage}{url};
  my $src     = $mono_diff_naming{$mononpackage}{src};
  my $sb_file = $name. $sb_ext;

  my $type    = 'other';

  chdir "$pwd/mono/$name";

  my $tarball = "$oname-$ver.$src";

  if ( $download eq "true" ) {
    my $url = GSB::Mono::gsb_mono_url_make($oname, $packurl, $ver, $src);
    GSB::GSB::gsb_tarball_get($oname, $ver, $tarball, $type, $url);
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

# DONE DOWNLOADING

if ( ! @bad_downloads eq "" ) {
  print "\nThe following packages could not be downloaded:\n\n";

  foreach my $bad_pack (@bad_downloads) {
    print "$bad_pack\n";
  }
  print "\n";
}
# end main()
#
################################################################################
