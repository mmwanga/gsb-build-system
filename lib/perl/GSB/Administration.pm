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
   'pessulus'            => '2.24.0',
   'sabayon'             => '2.22.1',
  );

# src/administration from Elsewhere
our %administration =
  (
   'gparted'    => {
                 'ver' => '0.4.1',
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gparted',
                 'src' => 'tar.bz2',
                },
   'python-ldap'         => {
                 'ver' => '2.3.5',
                 'url' => 'http://mesh.dl.sourceforge.net/sourceforge/python-ldap',
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
   'pybackpack'         => {
	 'url' => 'http://andrewprice.me.uk/projects/pybackpack/download/',
	 'ver' => '0.5.4',
	 'src' => 'tar.gz',
		},
   'rdiff-backup'         => {
		 'url' => 'http://savannah.nongnu.org/download/rdiff-backup',
		 'ver' => '1.2.0',
		 'src' => 'tar.gz',
		},
   'librsync'    => {
	 'url' => 'http://kent.dl.sourceforge.net/sourceforge/librsync/',
	 'ver' => '0.9.7',
	 'src' => 'tar.gz',
		},
  );

#
# End Config Options
################################################################################
