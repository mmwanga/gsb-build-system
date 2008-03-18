package GSB::Testing;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%testing_svn);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


our %testing_svn =
  (
   'NetworkManager'         => 'svn_3473',
   'NetworkManager-vpn'     => 'svn_3473',
   'network-manager-applet' => 'svn_604,
  );
