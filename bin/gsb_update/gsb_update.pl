#!/usr/bin/perl

# Script that will download the latest gnome release and then
# update the various SlackBuilds in GSB.
#
# TODO:
#
#   - auto download themes. Need to Populate Themes.pm file with apropriate hashes
#   - cli args: --conf={all,platform,desktop,desktop_reqs,office,other}
#               --getrelease
#               --getlocal
#   - need to account for packages (ie. avifile,openh323,pwlib,ffmpeg)
#     with both a VERSION Var and a PVERSION var so that both are updated
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
use GSB::Other;
use GSB::Desktop_Requirements;
use GSB::DoubleTar;
#use GSB::Themes;
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
#   needs some changes
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

  chdir "$pwd/gnome/platform/$ppackage";
  my $sb_file = $ppackage. $sb_ext;
  my $tarball = "$ppackage-$platform{$ppackage}.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_platform_url_make($ppackage, $platform{$ppackage});
      my $url = GSB::GSB::gsb_gnome_generic_url_make($ppackage, $platform{$ppackage});
      GSB::GSB::gsb_tarball_get($ppackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $platform{$ppackage});
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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
#      my $url = GSB::GSB::gsb_gnome_platform_url_make($name, $ver);
      my $url = GSB::GSB::gsb_gnome_generic_url_make($name, $ver);
      GSB::GSB::gsb_tarball_get($pnpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $fdopackage);
  }
}

# Download Desktop Reqs
foreach my $drpackage (keys %desktop_reqs) {

  chdir "$pwd/gnome/desktop_reqs/$drpackage";
  my $sb_file = $drpackage . $sb_ext;
  my $packurl = $desktop_reqs{$drpackage}{url};
  my $ver     = $desktop_reqs{$drpackage}{ver};
  my $src     = $desktop_reqs{$drpackage}{src};

  my $tarball = "$drpackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($drpackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($drpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $drpackage);
  }
}

# Download Desktop Reqs for gnomemeeting
foreach my $gmpackage (keys %stupid_gnomemeeting_libs) {

  my $pack = "openh323-pwlib";

  chdir "$pwd/gnome/desktop_reqs/$pack";
  my $sb_file = $pack . $sb_ext;
  my $packurl = $stupid_gnomemeeting_libs{$gmpackage}{url};
  my $ver     = $stupid_gnomemeeting_libs{$gmpackage}{ver};
  my $src     = $stupid_gnomemeeting_libs{$gmpackage}{src};

  my $tarball = "$gmpackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::Desktop_Requirements::gsb_gnomemeeting_libs_url_make($gmpackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($gmpackage, $url);
    }
  }

# NEED TO FIGURE OUT HOW TO EDIT THIS FILE
#  if ( $edit eq "true" ) {
#    GSB::Edit::gsb_sb_edit($sb_file, $ver);
#  }

  if ( $gmpackage eq "pwlib" ) {
    if ( $build ne "" ) {
      GSB::Edit::gsb_build_release_make($sb_file, $build);
    }
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $gmpackage);
  }
}


# Download Desktop Packages
foreach my $dpackage (keys %desktop) {

  chdir "$pwd/gnome/desktop/$dpackage";
  my $sb_file = $dpackage . $sb_ext;
  my $tarball = "$dpackage-$desktop{$dpackage}\.tar.bz2";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_desktop_url_make($dpackage, $desktop{$dpackage});
      my $url = GSB::GSB::gsb_gnome_generic_url_make($dpackage, $desktop{$dpackage});
      GSB::GSB::gsb_tarball_get($dpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $desktop{$dpackage});
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $dpackage);
  }
}


# DOWNLOAD other desktop tarballs
foreach my $dnpackage (keys %desktop_diff_naming) {

  chdir "$pwd/gnome/desktop/$dnpackage";
  my $sb_file = $dnpackage. $sb_ext;
  my $name = $desktop_diff_naming{$dnpackage}{name};
  my $ver  = $desktop_diff_naming{$dnpackage}{ver};

  my $tarball = "$name-$ver.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_platform_url_make($name, $ver);
      my $url = GSB::GSB::gsb_gnome_generic_url_make($name, $ver);
      GSB::GSB::gsb_tarball_get($dnpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $dnpackage);
  }
}

# DOWNLOAD some other desktop tarballs
foreach my $dopackage (keys %desktop_other) {

  chdir "$pwd/gnome/desktop/$desktop_other{$dopackage}{dir}";

  my $sb_file = $desktop_other{$dopackage}{dir} . $sb_ext;
  my $name = $dopackage;
  my $ver  = $desktop_other{$dopackage}{ver};

  my $tarball = "$name-$ver.tar.bz2";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_desktop_url_make($name, $ver);
      my $url = GSB::GSB::gsb_gnome_generic_url_make($name, $ver);
      GSB::GSB::gsb_tarball_get($dopackage, $url);
    }
  }

# What to do about VERSION var here?
# maybe store the VARIABLE to edit in the hash somewhere?
#  if ( $edit eq "true" ) {
#    GSB::Edit::gsb_sb_edit($sb_file, $ver);
#  }


  if ( ! -f $tarball ) {
    push(@bad_downloads, $dopackage);
  }
}

# Download non gnome Desktop Packages
foreach my $ngpackage (keys %desktop_nongnome) {

  chdir "$pwd/gnome/desktop/$ngpackage";
  my $sb_file = $ngpackage . $sb_ext;
  my $packurl = $desktop_nongnome{$ngpackage}{url};
  my $ver     = $desktop_nongnome{$ngpackage}{ver};
  my $src     = $desktop_nongnome{$ngpackage}{src};

  my $tarball = "$ngpackage-$ver.$src";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($ngpackage, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($ngpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $ngpackage);
  }
}

# Download Bindings
# C++
foreach my $cbpackage (keys %bindings_cxx) {

  chdir "$pwd/gnome/bindings/c++/$cbpackage";
  my $sb_file = $cbpackage . $sb_ext;
  my $tarball = "$cbpackage-$bindings_cxx{$cbpackage}\.tar.bz2";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_bindings_url_make($cbpackage, $bindings_cxx{$cbpackage});
      my $url = GSB::GSB::gsb_gnome_generic_url_make($cbpackage, $bindings_cxx{$cbpackage});
      GSB::GSB::gsb_tarball_get($cbpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $bindings_cxx{$cbpackage});
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $cbpackage);
  }
}

# java
foreach my $jbpackage (keys %bindings_java) {

  chdir "$pwd/gnome/bindings/java/$jbpackage";
  my $sb_file = $jbpackage . $sb_ext;
  my $tarball = "$jbpackage-$bindings_java{$jbpackage}\.tar.bz2";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_bindings_url_make($jbpackage, $bindings_java{$jbpackage});
      my $url = GSB::GSB::gsb_gnome_generic_url_make($jbpackage, $bindings_java{$jbpackage});
      GSB::GSB::gsb_tarball_get($jbpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $bindings_java{$jbpackage});
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $jbpackage);
  }
}

# Python
foreach my $pbpackage (keys %bindings_python) {

  chdir "$pwd/gnome/bindings/python/$pbpackage";
  my $sb_file = $pbpackage . $sb_ext;
  my $tarball = "$pbpackage-$bindings_python{$pbpackage}\.tar.bz2";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_bindings_url_make($pbpackage, $bindings_python{$pbpackage});
      my $url = GSB::GSB::gsb_gnome_generic_url_make($pbpackage, $bindings_python{$pbpackage});
      GSB::GSB::gsb_tarball_get($pbpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $bindings_python{$pbpackage});
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $pbpackage);
  }
}

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

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
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

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $other_pack);
  }
}

# Other Other
foreach my $oother_pack (keys %other_other) {

  chdir "$pwd/other/$oother_pack";
  my $sb_file = $oother_pack . $sb_ext;
  my $packurl = $other_other{$oother_pack}{url};
  my $ver     = $other_other{$oother_pack}{ver};
  my $src     = $other_other{$oother_pack}{src};

  my $tarball = "$oother_pack$ver.$src";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::Other::gsb_other_other_url_make($oother_pack, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($oother_pack, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $oother_pack);
  }
}

# Download GSTREAMER stuff
foreach my $gpackage (keys %gstreamer) {

  chdir "$pwd/gnome/desktop/$gpackage";
  my $sb_file = $gpackage . $sb_ext;
  my $tarball = "$gpackage-$gstreamer{$gpackage}\.tar.bz2";

  if ( $download eq "true") {
    if ( ! -f $tarball ) {
#      my $url = GSB::GSB::gsb_gnome_desktop_url_make($gpackage, $gstreamer{$gpackage});
      my $url = GSB::GSB::gsb_gnome_generic_url_make($gpackage, $gstreamer{$gpackage});
      GSB::GSB::gsb_tarball_get($gpackage, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $gstreamer{$gpackage});
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $gpackage);
  }
}

# Download GSTREAMER libs
foreach my $gst_libs_pack (keys %gst_libs) {

  chdir "$pwd/gnome/desktop_reqs/$gst_libs_pack";
  my $sb_file = $gst_libs_pack . $sb_ext;
  my $packurl = $gst_libs{$gst_libs_pack}{url};
  my $ver     = $gst_libs{$gst_libs_pack}{ver};
  my $src     = $gst_libs{$gst_libs_pack}{src};

  my $tarball = "$gst_libs_pack-$ver.$src";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($gst_libs_pack, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($gst_libs_pack, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $gst_libs_pack);
  }
}

# Download libs for single dir
foreach my $dlibs (keys %double_tarballs) {
  chdir "$pwd/$double_tarballs{$dlibs}{dir}";

  my $dir     = $double_tarballs{$dlibs}{dir};
  my $packurl = $double_tarballs{$dlibs}{url};
  my $ver     = $double_tarballs{$dlibs}{ver};
  my $src     = $double_tarballs{$dlibs}{src};
  my $var     = $double_tarballs{$dlibs}{var};

  my @tmp = split(/\//, $dir);
  my $sb  = pop(@tmp);

  my $sb_file = $sb . $sb_ext;

  my $tarball = "$dlibs-$ver.$src";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($dlibs, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($dlibs, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_double_edit($sb_file, $ver, $var);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $dlibs);
  }
}

# Download extra GSTREAMER plugins
foreach my $gst_plugins_pack (keys %gst_other) {

  chdir "$pwd/other/$gst_plugins_pack";
  my $sb_file = $gst_plugins_pack . $sb_ext;
  my $packurl = $gst_other{$gst_plugins_pack}{url};
  my $ver     = $gst_other{$gst_plugins_pack}{ver};
  my $src     = $gst_other{$gst_plugins_pack}{src};

  my $tarball = "$gst_plugins_pack-$ver.$src";

  if ( $download eq "true" ) {
    if ( ! -f $tarball ) {
      my $url = GSB::GSB::gsb_other_url_make($gst_plugins_pack, $packurl, $ver, $src);
      GSB::GSB::gsb_tarball_get($gst_plugins_pack, $url);
    }
  }

  if ( $edit eq "true" ) {
    GSB::Edit::gsb_sb_edit($sb_file, $ver);
  }

  if ( $build ne "" ) {
    GSB::Edit::gsb_build_release_make($sb_file, $build);
  }

  if ( ! -f $tarball ) {
    push(@bad_downloads, $gst_plugins_pack);
  }
}

# DONE DOWNLOADING

if ( ! @bad_downloads eq "" ) {
  print "The following packages could not be downloaded:\n\n";

  foreach my $bad_pack (@bad_downloads) {
    print "$bad_pack\n";
  }
  print "\n";
}
# end main()
#
################################################################################
