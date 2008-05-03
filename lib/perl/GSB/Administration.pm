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
   'sabayon'             => '2.22.0',
   'liboobs'             => '2.22.0',
   'system-tools-backends'  => '2.6.0',
   'gnome-system-tools'     => '2.22.0',
  );

# src/administration from Elsewhere
our %administration =
  (
   'parted'    => {
	   'ver' => '1.8.8',
	   'url' => 'http://ftp.gnu.org/gnu/parted',
	   'src' => 'tar.bz2',
	   },
   'gparted'    => {
                 'ver' => '0.3.7',
                 'url' => 'http://dfn.dl.sourceforge.net/sourceforge/gparted',
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
             'ver' => '0.4.0',
             'src' => 'tar.gz',
                  },
   'notify-python'    => {
             'url' => 'http://www.galago-project.org/files/releases/source/notify-python/',
             'ver' => '0.1.1',
             'src' => 'tar.bz2',
                  },
   'pycups'    => {
             'url' => 'http://cyberelk.net/tim/data/pycups/',
             'ver' => '1.9.36',
             'src' => 'tar.bz2',
                  },
   'system-config-printer'    => {
             'url' => 'http://cyberelk.net/tim/data/system-config-printer/',
             'ver' => '0.9.90',
             'src' => 'tar.bz2',
                  },
   'pybackpack'         => {
	 'url' => 'http://andrewprice.me.uk/projects/pybackpack/download/',
	 'ver' => '0.5.4',
	 'src' => 'tar.gz',
		},
   'rdiff-backup'         => {
		 'url' => 'http://savannah.nongnu.org/download/rdiff-backup',
		 'ver' => '1.0.5',
		 'src' => 'tar.gz',
		},
   'librsync'    => {
	 'url' => 'http://heanet.dl.sourceforge.net/sourceforge/librsync/',
	 'ver' => '0.9.7',
	 'src' => 'tar.gz',
		},
  );

#
# End Config Options
################################################################################
