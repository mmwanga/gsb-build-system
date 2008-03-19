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
             'ver' => '3a4',
	     'section' => 'office',
                 },
   'rhpl'  => {
             'ver' => '0.212',
	     'section' => 'administration',
                 },
   'gnome-menus-kde'  => {
             'ver' => '1.0',
	     'section' => 'desktop',
                 },
   'gnome-menus-xfce'  => {
             'ver' => '1.0',
	     'section' => 'desktop',
                 },
   'gnome-menus-ooo'  => {
             'ver' => '1.0',
	     'section' => 'desktop',
                 },
   'fusion-icon'  => {
             'ver' => '0.1.0',
	     'section' => 'compiz',
                 },
  );
