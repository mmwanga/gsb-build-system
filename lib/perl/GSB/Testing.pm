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
   'notify-python'    => {
             'url' => 'http://www.galago-project.org/files/releases/source/notify-python/',
             'ver' => '0.1.1',
             'dir' => 'testing/notify-python',
             'tar' => 'notify-python-0.1.1.tar.bz2',
             'var' => 'VERSION',
                  },
   'pycups'    => {
             'url' => 'http://cyberelk.net/tim/data/pycups/',
             'ver' => '1.9.32',
             'dir' => 'testing/pycups',
             'tar' => 'pycups-1.9.32.tar.bz2',
             'var' => 'VERSION',
                  },
   'system-config-printer'    => {
             'url' => 'http://cyberelk.net/tim/data/system-config-printer/',
             'ver' => '0.7.78',
             'dir' => 'testing/system-config-printer',
             'tar' => 'system-config-printer-0.7.78.tar.bz2',
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
   'NetworkManager'         => 'svn_3173',
   'NetworkManager-vpn'     => 'svn_3173',
   'network-manager-applet' => 'svn_404',
  );
