package GSB::Office;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%office %office_gnome %office_svn);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

our %office_gnome =
  (
   'anjuta'    => '2.4.2',
   'devhelp'   => '0.19.1',
   'gnumeric'  => '1.8.3',
   'dia'       => '0.96.1',
   'gdl'       => '0.7.11',
   'glade3'      => '3.4.5',
   'glom'      => '1.6.17',
   'gnome-build' => '0.3.0',
   'gnome-python-extras'  => '2.19.1',
   'goffice'   => '0.6.4',
   'libgsf'    => '1.14.8',
   'libgda'    => '3.0.4',
   'libgdamm'  => '2.9.82',
   'libgnomedb' => '3.0.0',
  );

our %office =
  (
   'abiword' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.4/source/',
		 'ver' => '2.6.4',
		 'src' => 'tar.gz'
		},
   'abiword-docs' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.4/source/',
		 'ver' => '2.6.4',
		 'src' => 'tar.gz'
		},
   'abiword-extras' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.4/source/',
		 'ver' => '2.6.4',
		 'src' => 'tar.gz'
		},
   'abiword-plugins' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.4/source/',
		 'ver' => '2.6.4',
		 'src' => 'tar.gz'
		},
   'aqbanking' => {
                   'url' => 'http://kent.dl.sourceforge.net/sourceforge/aqbanking/',
                   'ver' => '2.3.3',
                   'src' => 'tar.gz',
                  },
   'autogen'             => {
                             'ver' => '5.9.5',
                             'url' => 'http://kent.dl.sourceforge.net/sourceforge/autogen/',
                             'src' => 'tar.bz2',
			    },
   'blender'             => {
                             'ver' => '2.46',
                             'url' => 'http://mirror.cs.umn.edu/blender.org/source/',
                             'src' => 'tar.gz',
			    },
   'bluefish'            => {
			     'ver' => '1.0.7',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/bluefish/',
			     'src' => 'tar.bz2',
			    },
   'drivel'              => {
			     'ver' => '2.0.3',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/drivel/',
			     'src' => 'tar.bz2',
			    },
   'dvgrab'              => {
			     'ver' => '3.1',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'gnucash'              => {
			     'ver' => '2.2.5',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.bz2',
			    },
   'gnucash-docs'              => {
			     'ver' => '2.2.0',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.gz',
			    },
   'gwenhywfar'    => {
                   'url' => 'http://kent.dl.sourceforge.net/sourceforge/gwenhywfar/',
                   'ver' => '2.6.2',
                   'src' => 'tar.gz',
                  },
   'gtkmathview'    => {
                   'url' => 'http://helm.cs.unibo.it/mml-widget/sources',
                   'ver' => '0.8.0',
                   'src' => 'tar.gz',
                  },
   'inkscape'            => {
			     'ver' => '0.46',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/inkscape/',
			     'src' => 'tar.gz',
			    },
   'istanbul'            => {
			     'ver' => '0.2.2',
			     'url' => 'http://zaheer.merali.org/',
			     'src' => 'tar.bz2',
			    },
   'kino'                => {
			     'ver' => '1.3.0',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'libofx'    => {
                   'url' => 'http://kent.dl.sourceforge.net/sourceforge/libofx/',
                   'ver' => '0.9.0',
                   'src' => 'tar.gz',
                  },
   'liferea'             => {
			     'ver' => '1.5.4',
			     'url' => 'http://switch.dl.sourceforge.net/sourceforge/liferea',
			     'src' => 'tar.gz',
			    },
   'postgresql'    => {
                   'url' => 'http://ftp7.us.postgresql.org/pub/postgresql/source/v8.3.3',
                   'ver' => '8.3.3',
                   'src' => 'tar.bz2',
                  },
   'psiconv'   => {
		   'url' => 'http://software.frodo.looijaard.name/psiconv/files/',
		   'ver' => '0.9.8',
		   'src' => 'tar.gz',
		  },
   'python-xlib'             => {
			     'ver' => '0.14',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/python-xlib/',
			     'src' => 'tar.gz',
			    },
   'tracker'             => {
			     'ver' => '0.6.6',
			     'url' => 'http://www.gnome.org/~jamiemcc/tracker/',
			     'src' => 'tar.bz2',
			    },
   'wv'              => {
			     'ver' => '1.2.4',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/wvware/',
			     'src' => 'tar.gz',
			    },

  );

#
# End Config Options
################################################################################
