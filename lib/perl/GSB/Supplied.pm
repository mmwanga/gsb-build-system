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
  );
