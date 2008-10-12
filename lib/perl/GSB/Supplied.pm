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
             'ver' => '0.1.0a',
	     'section' => 'applications',
                 },
   'rhpl'  => {
             'ver' => '0.215',
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
             'ver' => '2.4.1.10',
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
             'ver' => 'svn_4152',
	     'section' => 'networking',
                 },
   'NetworkManager-vpn'  => {
             'ver' => 'svn_4152',
	     'section' => 'networking',
                 },
   'network-manager-applet'  => {
             'ver' => 'svn_929',
	     'section' => 'networking',
                 },
   'ffmpeg'  => {
             'ver' => 'svn_15385',
	     'section' => 'libraries',
                 },
   'podsleuth'  => {
             'ver' => 'svn_60',
	     'section' => 'mono',
                 },
   'MPlayer'  => {
             'ver' => '1.0svn_27725',
	     'section' => 'media',
                 },
   'libflashsupport'  => {
             'ver' => '1.9',
	     'section' => 'media',
                 },
  );
