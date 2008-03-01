package GSB::Administration;
require Exporter;

use warnings;
use strict;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%administration
		    %administration_gnome);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

# src/administration from GNOME
our %administration_gnome =
  (
   'pessulus'            => '2.16.3',
   'sabayon'             => '2.20.1',
  );

# src/administration from Elsewhere
our %administration =
  (
   'parted'    => {
	   'ver' => '1.8.8',
	   'url' => 'http://ftp.gnu.org/gnu/parted',
	   'src' => 'tar.bz2',
	   },
  'python-ldap'         => {
                 'ver' => '2.3.1',
                 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/python-ldap',
                 'src' => 'tar.gz',
                            },
   'slapt-update-notifier'         => {
                 'ver' => '0.2.1',
                 'url' => 'http://software.jaos.org/source/slapt-update-notifier',
                 'src' => 'tar.gz',
                            },
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
   'pybackpack'         => {
			 'url' => 'http://andrewprice.me.uk/projects/pybackpack/download/',
			 'ver' => '0.5.2',
			 'src' => 'tar.gz',
			},
   'rdiff-backup'         => {
			 'url' => 'http://savannah.nongnu.org/download/rdiff-backup',
			 'ver' => '1.0.5',
			 'src' => 'tar.gz',
			},
   'librsync'         => {
			 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/librsync/',
			 'ver' => '0.9.7',
			 'src' => 'tar.gz',
			},
  );


#
# End Config Options
################################################################################
