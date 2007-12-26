package GSB::Testing;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%testing_packages %testing_svn);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;



# Building tools
our %testing_packages =
  (
   'gslapt'    => {
             'url' => 'http://software.jaos.org/source/gslapt',
             'ver' => '0.3.19',
			 'dir' => 'testing/gslapt',
			 'tar' => 'gslapt-0.3.19.tar.gz',
             'var' => 'VERSION',
                  },
   'wpa_supplicant'    => {
             'url' => 'http://hostap.epitest.fi/releases',
             'ver' => '0.5.9',
			 'dir' => 'testing/wpa_supplicant',
			 'tar' => 'wpa_supplicant-0.5.9.tar.gz',
             'var' => 'VERSION',
                  },
  );

our %testing_svn =
  (
   'NetworkManager' => 'svn' ,
   'NetworkManager-vpn' => 'svn',
   'network-manager-applet' => 'svn',
  );
