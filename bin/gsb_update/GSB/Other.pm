package GSB::Other;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%other %other_gnome %other_other);
our @EXPORT_OK = qw();
our $VERSION = 0.03;

################################################################################
# Config Options for OTHER
#

our %other =
  (
   'IndLinux-Hindi'      => {
			     'ver' => '0.73',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/indlinux/',
			     'src'  => 'tar.gz',
			    },
   'bluefish'            => {
			     'ver' => '1.0',
			     'url' => 'http://pkedu.fbt.eitn.wau.nl/~olivier/downloads/',
			     'src' => 'tar.bz2',
			    },
   'coaster'             => {
			     'ver' => '0.1.4.2',
			     'url' => 'http://www.coaster-burn.org/files/coaster/',
			     'src' => 'tar.gz',
			    },
   'dvgrab'              => {
			     'ver' => '1.7',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'gDesklets'           => {
			     'ver' => '0.34.1',
			     'url' => 'http://www.pycage.de/download/gdesklets/',
			     'src' => 'tar.bz2',
			    },
   'gaim'                => {
			     'ver' => '1.1.4',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gaim',
			     'src' => 'tar.bz2',
			    },
   'galeon'              => {
			     'ver' => '1.3.19',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/galeon',
			     'src' => 'tar.bz2',
			    },
   'gftp'                => {
			     'ver' => '2.0.18',
			     'url' => 'http://gftp.seul.org/',
			     'src' => 'tar.bz2',
			    },
   'gimp'                => {
			     'ver' => '2.2.4',
			     'url' => 'ftp://ftp.gimp.org/pub/gimp/v2.2/',
			     'src' => 'tar.bz2',
			    },
   'gnomebaker'          => {
			     'ver' => '0.3',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnomebaker/',
			     'src' => 'tar.gz',
			    },
   'graveman'            => {
			     'ver' => '0.3.8',
			     'url' => 'http://savannah.nongnu.org/download/graveman/',
			     'src' => 'tar.bz2',
			    },
   'gtkpod'              => {
			     'ver' => '0.88',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtkpod/',
			     'src' => 'tar.gz',
			    },
   'gtkspell'            => {
			     'ver' => '2.0.10',
			     'url' => 'http://gtkspell.sourceforge.net/download/',
			     'src' => 'tar.gz',
			    },
   'kino'                => {
			     'ver' => '0.7.5',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'inkscape'            => {
			     'ver' => '0.41',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/inkscape/',
			     'src' => 'tar.bz2',
			    },
   'libburn'             => {
			     'ver' => '0.2',
			     'url' => 'http://icculus.org/burn/releases/',
			     'src' => 'tar.gz',
			    },
   'libcoaster'          => {
			     'ver' => '0.1pre1',
			     'url' => 'http://www.coaster-burn.org/files/libcoaster/',
			     'src' => 'tar.gz'
			    },
   'libmikmod'           => {
			     'ver' => '3.1.11',
			     'url' => 'http://mikmod.raphnet.net/files/',
			     'src' => 'tar.gz',
			    },
   'poppler'             => {
			     'ver' => '0.1.1',
			     'url' => 'http://poppler.freedesktop.org/',
			     'src' => 'tar.gz',
			    },
   'streamtuner'         => {
			     'ver' => '0.99.99',
			     'url' => 'http://savannah.nongnu.org/download/streamtuner/',
			     'src' => 'tar.gz',
			    },
   'streamripper'        => {
			     'ver' => '1.61.4',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/streamripper/',
			     'src' => 'tar.gz',
			    },
   'xchat'               => {
			     'ver' => '2.4.1',
			     'url' => 'http://xchat.org/files/source/2.4/',
			     'src' => 'tar.bz2',
			    },
  );

our %other_gnome =
  (
   'NetworkManager'      => '0.3.1',
   'evince'              => '0.1.9',
   'ghex'                => '2.8.1',
   'glade'               => '2.9.0',
   'gnome-audio'         => '2.0.0',
   'gnome-cups-manager'  => '0.30',
   'gthumb'              => '2.6.4',
   'rhythmbox'           => '0.8.8',
  );

our %other_other =
  (
   'gc'                  => {
			     'ver' => '6.4',
			     'url' => 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/',
			     'src' => 'tar.gz',
			    },
  );
#
# End Config Options
################################################################################

################################################################################
#
# Functions specific to this module

sub gsb_other_other_url_make {

  my $name = shift;
  my $url  = shift;
  my $ver  = shift;
  my $src  = shift;

  my $thisurl = "$url/$name$ver.$src";
  return $thisurl;

}
