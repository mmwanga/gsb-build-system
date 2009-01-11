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
   'gnome-menus-ooo3'  => {
             'ver' => '3.0.0.6',
	     'section' => 'testing',
                 },
   'fusion-icon'  => {
             'ver' => '0.1.0',
	     'section' => 'compiz',
                 },
   'service-discovery-applet'  => {
             'ver' => '0.4.5',
	     'section' => 'applications',
                 },
   'ffmpeg'  => {
             'ver' => 'svn_16306',
	     'section' => 'libraries',
                 },
   'podsleuth'  => {
             'ver' => 'svn_60',
	     'section' => 'mono',
                 },
   'MPlayer'  => {
             'ver' => '1.0svn_28215',
	     'section' => 'media',
                 },
   'gnome-python-extras'  => {
             'ver' => '2.24.0',
	     'section' => 'office',
                 },
   'notify-sharp'  => {
             'ver' => '0.4.0_svn2998',
	     'section' => 'mono',
                 },
  );
