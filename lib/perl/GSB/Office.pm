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
   'devhelp'   => '0.18',
   'gnumeric'  => '1.8.2',
   'dia'       => '0.96.1',
   'gdl'       => '0.7.11',
   'glade3'      => '3.4.3',
   'glom'      => '1.6.9',
   'gnome-build' => '0.2.4',
   'gnome-python-extras'  => '2.19.1',
   'goffice'   => '0.6.2',
   'libgda'    => '3.0.2',
   'libgdamm'  => '2.9.82',
   'libgnomedb' => '3.0.0',
  );

our %office =
  (
   'abiword' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.4.6/source/',
		 'ver' => '2.4.6',
		 'src' => 'tar.gz'
		},
   'anjuta'              => {
			     'ver' => '2.4.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/anjuta/',
			     'src' => 'tar.bz2',
			    },
   'aqbanking' => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/aqbanking/',
                   'ver' => '2.3.3',
                   'src' => 'tar.gz',
                  },
   'autogen'             => {
                             'ver' => '5.9.3',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/autogen/',
                             'src' => 'tar.bz2',
			    },
   'blender'             => {
                             'ver' => '2.45',
                             'url' => 'http://mirror.cs.umn.edu/blender.org/source/',
                             'src' => 'tar.gz',
			    },
   'bluefish'            => {
			     'ver' => '1.0.7',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/bluefish/',
			     'src' => 'tar.bz2',
			    },
   'drivel'              => {
			     'ver' => '2.0.3',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/drivel/',
			     'src' => 'tar.bz2',
			    },
   'dvgrab'              => {
			     'ver' => '3.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'gnucash'              => {
			     'ver' => '2.2.4',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.bz2',
			    },
   'gnucash-docs'              => {
			     'ver' => '2.2.0',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.gz',
			    },
   'graphviz'            => {
                             'ver' => '2.18',
                             'url' => 'http://www.graphviz.org/pub/graphviz/ARCHIVE/',
                             'src' => 'tar.gz',
                            },
   'gtkspell'            => {
			     'ver' => '2.0.11',
			     'url' => 'http://gtkspell.sourceforge.net/download/',
			     'src' => 'tar.gz',
			    },
   'gwenhywfar'    => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gwenhywfar/',
                   'ver' => '2.6.2',
                   'src' => 'tar.gz',
                  },
   'ilmbase'    => {
                   'url' => 'http://download.savannah.nongnu.org/releases/openexr/',
                   'ver' => '1.0.1',
                   'src' => 'tar.gz',
                  },
   'inkscape'            => {
			     'ver' => '0.46',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/inkscape/',
			     'src' => 'tar.gz',
			    },
   'istanbul'            => {
			     'ver' => '0.2.2',
			     'url' => 'http://zaheer.merali.org/',
			     'src' => 'tar.bz2',
			    },
   'kino'                => {
			     'ver' => '1.3.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'libofx'    => {
                   'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libofx/',
                   'ver' => '0.8.2',
                   'src' => 'tar.gz',
                  },
   'liferea'             => {
			     'ver' => '1.5.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/liferea/',
			     'src' => 'tar.gz',
			    },
   'openexr'    => {
                   'url' => 'http://download.savannah.nongnu.org/releases/openexr/',
                   'ver' => '1.6.1',
                   'src' => 'tar.gz',
                  },
   'postgresql'    => {
                   'url' => 'http://ftp7.us.postgresql.org/pub/postgresql/source/v8.3.0/',
                   'ver' => '8.3.0',
                   'src' => 'tar.bz2',
                  },
   'psiconv'   => {
		   'url' => 'http://software.frodo.looijaard.name/psiconv/files/',
		   'ver' => '0.9.8',
		   'src' => 'tar.gz',
		  },
   'python-xlib'             => {
			     'ver' => '0.14',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/python-xlib/',
			     'src' => 'tar.gz',
			    },
   'tracker'             => {
			     'ver' => '0.6.6',
			     'url' => 'http://www.gnome.org/~jamiemcc/tracker/',
			     'src' => 'tar.bz2',
			    },

  );

#
# End Config Options
################################################################################
