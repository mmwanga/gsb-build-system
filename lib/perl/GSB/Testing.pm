package GSB::Testing;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%testing_packages);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# Building tools
our %testing_packages =
  (
   'wpa_supplicant'    => {
             'url' => 'http://hostap.epitest.fi/releases',
             'ver' => '0.5.9',
			 'dir' => 'testing/wpa_supplicant',
			 'tar' => 'wpa_supplicant-0.5.9.tar.gz',
             'var' => 'VERSION',
                  },
  );
