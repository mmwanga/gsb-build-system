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
   'gsb-accessibility'     => '2.24.3',
   'gsb-administration'    => '2.24.3',
   'gsb-compiz'            => '2.24.3', 
   'gsb-complete'          => '2.24.3', 
   'gsb-desktop'           => '2.24.3', 
   'gsb-development'       => '2.24.3', 
   'gsb-mono'              => '2.24.3', 
   'gsb-multimedia'        => '2.24.3', 
   'gsb-office'            => '2.24.3', 
   'gsb-themes'            => '2.24.3', 
   'gsb-basic'             => '2.24.3', 
  );
