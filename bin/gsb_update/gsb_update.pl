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
use GSB::Requirements;
use GSB::Desktop_Requirements;

################################################################################
#
# config variables

my @bad_downloads = "";

my $gsb_root_sources = "../../src";

#
#
################################################################################

################################################################################
#
# main()

if (@ARGV != 1) {
  GSB::GSB::show_help();
  exit (0);
}

foreach my $package (keys %platform) {

  my $url = gsb_gnome_platform_url_make($package, $platform{$package});

  gsb_tarball_get{$url);
}

foreach my $package (keys %desktop) {

  my $url = gsb_gnome_desktop_url_make($package, $platform{$package});

  gsb_tarball_get{$url);
}


#print "The following packages could not be downloaded:\n";
#print "GSB::GSB::@bad_downloads\n";

# end main()
#
################################################################################
