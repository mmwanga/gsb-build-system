package GSB::Other;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%other %other_gnome %other_other);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
# Config Options for OTHER
#

our %other =
  (
   'IndLinux-Hindi'      => {
			     'ver' => '0.73',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/indlinux/',
			     'src' => 'tar.gz',
			    },
   'anjuta'              => {
			     'ver' => '2.0.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/anjuta/',
			     'src' => 'tar.gz',
			    },
   'autogen'             => {
                             'ver' => '5.7.2',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/autogen/',
                             'src' => 'tar.bz2',
			    },
   'avidemux'            => {
			     'ver' => '2.0.42',
			     'url' => 'http://download.berlios.de/avidemux/',
			     'src' => 'tar.gz',
			    },
   'balsa'               => {
			     'ver' => '2.3.4',
			     'url' => 'http://balsa.gnome.org/',
			     'src' => 'tar.bz2',
			    },
   'bluefish'            => {
			     'ver' => '1.0.2',
			     'url' => 'http://pkedu.fbt.eitn.wau.nl/~olivier/downloads/',
			     'src' => 'tar.bz2',
			    },
   'bmp'                 => {
			     'ver' => '0.9.7',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/beepmp/',
			     'src' => 'tar.gz',
			    },
   'coaster'             => {
			     'ver' => '0.1.4.2',
			     'url' => 'http://www.coaster-burner.org/files/coaster/',
			     'src' => 'tar.gz',
			    },
   'contact-lookup-applet' => {
			       'ver' => '0.13',
			       'url' => 'http://www.burtonini.com/computing/',
			       'src' => 'tar.gz',
			      },
   'denu'                => {
			     'ver' => '2.3.2',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/denu/',
			     'src' => 'tar.bz2',
			    },
   'drivel'              => {
			     'ver' => '2.0.2',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/drivel/',
			     'src' => 'tar.bz2',
			    },
   'dvgrab'              => {
			     'ver' => '1.8',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'easytag'             => {
			     'ver' => '1.99.8',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/easytag/',
			     'src' => 'tar.bz2',
			    },
   'gDesklets'           => {
			     'ver' => '0.35.2',
			     'url' => 'http://www.gdesklets.org/releases/',
			     'src' => 'tar.bz2',
			    },
   'gaim'                => {
			     'ver' => '1.5.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gaim',
			     'src' => 'tar.bz2',
			    },
   'galeon'              => {
			     'ver' => '1.3.21',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/galeon',
			     'src' => 'tar.bz2',
			    },
   'gftp'                => {
			     'ver' => '2.0.18',
			     'url' => 'http://gftp.seul.org/',
			     'src' => 'tar.bz2',
			    },
   'gimp'                => {
			     'ver' => '2.2.8',
			     'url' => 'ftp://ftp.gimp.org/pub/gimp/v2.2/',
			     'src' => 'tar.bz2',
			    },
   'gmime'               => {
			     'ver' => '2.1.16',
			     'url' => 'http://spruce.sourceforge.net/gmime/sources/v2.1/',
			     'src' => 'tar.gz',
			    },
   'gnomebaker'          => {
			     'ver' => '0.4.2',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnomebaker/',
			     'src' => 'tar.gz',
			    },
   'gnome-pkgtool'       => {
                             'ver' => '0.5.2',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnome-pkgtool/',
                             'src' => 'tar.gz',
                            },
   'gnome-power-manager'       => {
                             'ver' => '0.2.2.1',
                             'url' => 'http://unc.dl.sourceforge.net/sourceforge/gnome-power/',
                             'src' => 'tar.gz',
                            },
   'gpgme'               => {
			     'ver' => '1.0.3',
			     'url' => 'ftp://ftp.gnupg.org/gcrypt/gpgme/',
			     'src' => 'tar.gz',
			    },
   'gphoto2'             => {
			     'ver' => '2.1.6',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'gqview'              => {
			     'ver' => '2.0.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gqview/',
			     'src' => 'tar.gz',
			    },
   'graphviz'            => {
                             'ver' => '2.4',
                             'url' => 'http://www.graphviz.org/pub/graphviz/ARCHIVE/',
                             'src' => 'tar.gz',
                            },
   'graveman'            => {
			     'ver' => '0.3.12-4',
			     'url' => 'http://graveman.tuxfamily.org/sources/',
			     'src' => 'tar.bz2',
			    },
   'grip'                => {
                             'ver' => '3.3.1',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/grip/',
                             'src' => 'tar.gz',
                            },
   'gslapt'             => {
			     'ver' => '0.3.7',
			     'url' => 'http://software.jaos.org/source/gslapt/',
			     'src' => 'tar.gz',
			    },
   'gtkam'               => {
			     'ver' => '0.1.12',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'gtkpod'              => {
			     'ver' => '0.94.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtkpod/',
			     'src' => 'tar.gz',
			    },
   'gtkspell'            => {
			     'ver' => '2.0.11',
			     'url' => 'http://gtkspell.sourceforge.net/download/',
			     'src' => 'tar.gz',
			    },
   'guile'            => {
			     'ver' => '1.6.7',
			     'url' => 'http://ftp.gnu.org/pub/gnu/guile/',
			     'src' => 'tar.gz',
			    },
   'kino'                => {
			     'ver' => '0.7.6',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'Imaging'             => {
			     'ver' => '1.1.4',
			     'url' => 'http://effbot.org/downloads/',
			     'src' => 'tar.gz',
			    },
   'inkscape'            => {
			     'ver' => '0.42',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/inkscape/',
			     'src' => 'tar.bz2',
			    },
   'istanbul'            => {
			     'ver' => '0.1.1',
			     'url' => 'http://live.hujjat.org',
			     'src' => 'tar.bz2',
			    },
   'libburn'             => {
			     'ver' => '0.2',
			     'url' => 'http://icculus.org/burn/releases/',
			     'src' => 'tar.gz',
			    },
   'libcoaster'          => {
			     'ver' => '0.1pre1',
			     'url' => 'http://www.coaster-burner.org/files/libcoaster/',
			     'src' => 'tar.gz'
			    },
   'libesmtp'            => {
			     'ver' => '1.0.3r1',
			     'url' => 'http://www.stafford.uklinux.net/libesmtp/',
			     'src' => 'tar.bz2',
			    },
   'libexif-gtk'         => {
			     'ver' => '0.3.5',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libexif/',
			     'src' => 'tar.bz2',
			    },
   'libgphoto2'          => {
			     'ver' => '2.1.6',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'libmikmod'           => {
			     'ver' => '3.1.11',
			     'url' => 'http://mikmod.raphnet.net/files/',
			     'src' => 'tar.gz',
			    },
   'liferea'             => {
			     'ver' => '0.9.7b',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/liferea/',
			     'src' => 'tar.gz',
			    },
   'lock-keys-applet'             => {
			     'ver' => '1.0',
			     'url' => 'http://www.wh-hms.uni-ulm.de/~mfcn/lock-keys-applet/packages/',
			     'src' => 'tar.gz',
			    },
   'mail-notification'   => {
			     'ver' => '1.1',
			     'url' => 'http://savannah.nongnu.org/download/mailnotify/',
			     'src' => 'tar.gz',
			    },
   'nautilus-open-terminal'  => {
			     'ver' => '0.4',
			     'url' => 'http://manny.cluecoder.org/packages/nautilus-open-terminal/',
			     'src' => 'tar.gz',
          },
   'poppler'             => {
			     'ver' => '0.4.2',
			     'url' => 'http://poppler.freedesktop.org/',
			     'src' => 'tar.gz',
			    },
   'pstoedit'            => {
			     'ver' => '3.41',
			     'url' => 'http://home.t-online.de/home/helga.glunz/wglunz/pstoedit/',
			     'src' => 'tar.gz',
			    },
   'skencil'             => {
			     'ver' => '0.6.16',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sketch/',
			     'src' => 'tar.gz',
			    },
   'slapt-get'           => {
			     'ver' => '0.9.10c',
			     'url' => 'http://software.jaos.org/source/slapt-get/',
			     'src' => 'tar.gz',
			    },
   'smeg'                => {
			     'ver' => '0.7.5',
			     'url' => 'http://dev.realistanew.com/smeg/0.7.5/',
			     'src' => 'tar.gz',
			    },
   'streamtuner'         => {
			     'ver' => '0.99.99',
			     'url' => 'http://savannah.nongnu.org/download/streamtuner/',
			     'src' => 'tar.gz',
			    },
   'streamripper'        => {
			     'ver' => '1.61.8',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/streamripper/',
			     'src' => 'tar.gz',
			    },
   'subversion'          => {
                             'ver' => '1.2.3',
                             'url' => 'http://subversion.tigris.org/downloads/',
                             'src' => 'tar.bz2',
                            },
   'sylpheed'            => {
			     'ver' => '2.0.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sylpheed-claws/',
			     'src' => 'tar.bz2',
			    },
   'sylpheed-claws'      => {
			     'ver' => '1.9.12',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sylpheed-claws/',
			     'src' => 'tar.bz2',
			    },
   'thoggen'             => {
			     'ver' => '0.3',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/thoggen/',
			     'src' => 'tar.gz',
			    },
   'xchat'               => {
			     'ver' => '2.4.5',
			     'url' => 'http://xchat.org/files/source/2.4/',
			     'src' => 'tar.bz2',
			    },
  );

our %other_gnome =
  (
   'NetworkManager'      => '0.3.1',
   'devhelp'             => '0.9.3',
   'evince'              => '0.4.0',
   'gdl'                 => '0.6.0',
   'ghex'                => '2.8.1',
   'glade'               => '2.12.0',
   'gnome-audio'         => '2.0.0',
   'gnome-build'         => '0.1.2',
   'gnome-cups-manager'  => '0.31',
   'gnome-blog'          => '0.9',
   'gossip'              => '0.9',
   'gthumb'              => '2.6.8',
   'loudmouth'           => '1.0.1',
   'rhythmbox'           => '0.9.0',
   'sabayon'             => '2.11.90',
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

