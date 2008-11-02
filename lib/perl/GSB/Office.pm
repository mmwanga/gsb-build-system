package GSB::Office;
use Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%office %office_gnome );
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options
#

our %office_gnome =
  (
   'gnumeric'             => '1.8.3',
   'dia'                  => '0.96.1',
   'evince'               => '2.24.1',
   'f-spot'               => '0.5.0.3',
   'glom'                 => '1.8.1',
   'gnome-python-extras'  => '2.19.1',
   'goffice'              => '0.6.5',
   'libgsf'               => '1.14.10',
   'libgda'               => '3.0.4',
   'libgdamm'             => '3.0.1',
   'libgnomedb'           => '3.0.0',
   'tomboy'               => '0.12.1',
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
                   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/aqbanking/',
                   'ver' => '2.3.3',
                   'src' => 'tar.gz',
                  },
   'blender'             => {
                             'ver' => '2.46',
                             'url' => 'http://mirror.cs.umn.edu/blender.org/source/',
                             'src' => 'tar.gz',
			    },
   'drivel'              => {
			     'ver' => '2.0.3',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/drivel/',
			     'src' => 'tar.bz2',
			    },
   'gnome-do'                => {
				'ver' => '0.5.0.1',
				'url' => 'http://launchpad.net/do/trunk/0.5/+download',
				'src' => 'tar.gz',
		        	},
   'gnucash'              => {
			     'ver' => '2.2.7',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.bz2',
			    },
   'gnucash-docs'              => {
			     'ver' => '2.2.0',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.gz',
			    },
   'gwenhywfar'    => {
                   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/gwenhywfar/',
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
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/inkscape/',
			     'src' => 'tar.gz',
			    },
   'istanbul'            => {
			     'ver' => '0.2.2',
			     'url' => 'http://zaheer.merali.org/',
			     'src' => 'tar.bz2',
			    },
   'liferea'             => {
			     'ver' => '1.4.20',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/liferea',
			     'src' => 'tar.gz',
			    },
   'libofx'    => {
                   'url' => 'http://mesh.dl.sourceforge.net/sourceforge/libofx/',
                   'ver' => '0.9.0',
                   'src' => 'tar.gz',
                  },
   'pstoedit'            => {
			     'ver' => '3.45',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/pstoedit',
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
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/python-xlib/',
			     'src' => 'tar.gz',
			    },
   'tracker'             => {
			     'ver' => '0.6.6',
			     'url' => 'http://www.gnome.org/~jamiemcc/tracker/',
			     'src' => 'tar.bz2',
			    },
   'wv'              => {
			     'ver' => '1.2.4',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/wvware/',
			     'src' => 'tar.gz',
			    },

  );

#
# End Config Options
################################################################################
