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
   'anjuta'               => '2.26.1.0',
   'gnumeric'             => '1.8.4',
   'dia'                  => '0.96.1',
   'f-spot'               => '0.5.0.3',
   'glom'                 => '1.10.0',
   'goffice'              => '0.6.6',
   'gnome-python-extras'  => '2.25.3',
   'libgsf'               => '1.14.12',
   'libgda'               => '4.0.2',
   'libgdamm'             => '3.99.14',
   'libgnomedb'           => '3.0.0',
   'tomboy'               => '0.14.1',
   'tracker'              => '0.6.93',
  );

our %office =
  (
   'abiword' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.8/source/',
		 'ver' => '2.6.8',
		 'src' => 'tar.gz'
		},
   'abiword-docs' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.8/source/',
		 'ver' => '2.6.8',
		 'src' => 'tar.gz'
		},
   'abiword-extras' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.8/source/',
		 'ver' => '2.6.8',
		 'src' => 'tar.gz'
		},
   'abiword-plugins' => {
		 'url' => 'http://www.abisource.com/downloads/abiword/2.6.8/source/',
		 'ver' => '2.6.8',
		 'src' => 'tar.gz'
		},
   'blender'             => {
                             'ver' => '2.48a',
                             'url' => 'http://mirror.cs.umn.edu/blender.org/source/',
                             'src' => 'tar.gz',
			    },
   'drivel'              => {
			     'ver' => '2.0.3',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/drivel/',
			     'src' => 'tar.bz2',
			    },
   'gnome-do'                => {
		'ver' => '0.8.1',
		'url' => 'http://edge.launchpad.net/do/0.8/0.8.1/+download/',
		'src' => 'tar.gz',
	       },
	       #'gnome-do-plugins'                => {
	       #'ver' => '0.8.1',
	       #'url' => 'http://edge.launchpad.net/do-plugins/0.8/0.8.1/+download/',
	       #'src' => 'tar.gz',
	       #},
   'gnucash'              => {
			     'ver' => '2.2.9',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
			     'src' => 'tar.bz2',
			    },
   'gnucash-docs'              => {
			     'ver' => '2.2.0',
			     'url' => 'http://ftp.at.gnucash.org/pub/gnucash/gnucash/sources/stable/',
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
			     'ver' => '1.4.28',
			     'url' => 'http://kent.dl.sourceforge.net/sourceforge/liferea',
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
                   'url' => 'http://ftp2.uk.postgresql.org/sites/ftp.postgresql.org/source/v8.3.7/',
                   'ver' => '8.3.7',
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
   'wv'              => {
			     'ver' => '1.2.4',
			     'url' => 'http://mesh.dl.sourceforge.net/sourceforge/wvware/',
			     'src' => 'tar.gz',
			    },

  );

#
# End Config Options
################################################################################
