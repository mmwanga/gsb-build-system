package GSB::Supplied;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%supplied_tarballs);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

our %supplied_tarballs =
  (
   'mpeg4ip'  => {
             'ver' => '1.6.1',
	     'section' => 'libraries',
                 },
   'slib'  => {
             'ver' => '3b1',
	     'section' => 'office',
                 },
   'evolution-rss'  => {
             'ver' => '0.1.0',
	     'section' => 'applications',
                 },
   'rhpl'  => {
             'ver' => '0.212',
	     'section' => 'print',
                 },
   'hal-cups-utils'  => {
             'ver' => '0.6.16',
	     'section' => 'print',
                 },
   'gnome-menus-kde'  => {
             'ver' => '1.5',
	     'section' => 'desktop',
                 },
   'gnome-menus-xfce'  => {
             'ver' => '1.5',
	     'section' => 'desktop',
                 },
   'gnome-menus-ooo'  => {
             'ver' => '2.4.0.3.2',
	     'section' => 'ooo',
                 },
   'fusion-icon'  => {
             'ver' => '0.1.0',
	     'section' => 'compiz',
                 },
   'service-discovery-applet'  => {
             'ver' => '0.4.5',
	     'section' => 'applications',
                 },
   'NetworkManager'  => {
             'ver' => 'svn_4008',
	     'section' => 'networking',
                 },
   'NetworkManager-vpn'  => {
             'ver' => 'svn_4008',
	     'section' => 'networking',
                 },
   'network-manager-applet'  => {
             'ver' => 'svn_863',
	     'section' => 'networking',
                 },
   'ffmpeg'  => {
             'ver' => 'svn_14999',
	     'section' => 'libraries',
                 },
   'podsleuth'  => {
             'ver' => 'svn_60',
	     'section' => 'mono',
                 },
   'MPlayer'  => {
             'ver' => 'svn_27501',
	     'section' => 'media',
                 },
   'libdvdread'  => {
	     # Although from svn, libdvdread does have a release number
             'ver' => '4.1.3',
	     'section' => 'libraries',
                 },
  );
