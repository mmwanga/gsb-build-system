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
   'gsb-accessibility'     => '2.22.1',
   'gsb-administration'    => '2.22.1',
   'gsb-compiz'            => '2.22.1',
   'gsb-complete'          => '2.22.1',
   'gsb-desktop'           => '2.22.1',
   'gsb-development'       => '2.22.1',
   'gsb-mono'              => '2.22.1',
   'gsb-multimedia'        => '2.22.1',
   'gsb-office'            => '2.22.1',
   'gsb-themes'            => '2.22.1',
   'gsb-basic'            => '2.22.1',
  );
