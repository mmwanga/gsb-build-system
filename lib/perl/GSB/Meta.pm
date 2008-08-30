package GSB::Meta;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%meta_packages);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

our %meta_packages =
  (
   'gsb-accessibility'     => '2.23.90',
   'gsb-administration'    => '2.23.90',
   'gsb-compiz'            => '2.23.90',
   'gsb-complete'          => '2.23.90',
   'gsb-desktop'           => '2.23.90',
   'gsb-development'       => '2.23.90',
   'gsb-mono'              => '2.23.90',
   'gsb-multimedia'        => '2.23.90',
   'gsb-office'            => '2.23.90',
   'gsb-themes'            => '2.23.90',
   'gsb-basic'             => '2.23.90',
  );
