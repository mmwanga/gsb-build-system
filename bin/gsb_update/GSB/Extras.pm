package GSB::Extras;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(
                    %extras_apps
                    %extras_apps_gnome
                    %extras_applets
                    %extras_applets_gnome
                    %extras_gnome_apps
                    %extras_gnome_other_apps
                    %extras_libs
                    %extras_libs_gnome
                    %extras_libs_other
                   );
our @EXPORT_OK = qw();
our $VERSION   = 0.03;


################################################################################
#
# Functions specific to this module

sub gsb_extras_libs_other_url_make {

  my $name = shift;
  my $url  = shift;
  my $ver  = shift;
  my $src  = shift;

  my $thisurl = "$url/$name$ver.$src";
  return $thisurl;

}


################################################################################
# Config Options for OTHER
#


# src/extras/libs
our %extras_libs =
  (
   'autogen'             => {
                             'ver' => '5.8.1',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/autogen/',
                             'src' => 'tar.bz2',
			    },
   'gmime'               => {
			     'ver' => '2.2.1',
			     'url' => 'http://spruce.sourceforge.net/gmime/sources/v2.2/',
			     'src' => 'tar.gz',
			    },
   'gpgme'               => {
			     'ver' => '1.1.0',
			     'url' => 'ftp://ftp.gnupg.org/gcrypt/gpgme/',
			     'src' => 'tar.gz',
			    },
   'gphoto2'             => {
			     'ver' => '2.1.99',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'graphviz'            => {
                             'ver' => '2.6',
                             'url' => 'http://www.graphviz.org/pub/graphviz/ARCHIVE/',
                             'src' => 'tar.gz',
                            },
   'gtkspell'            => {
			     'ver' => '2.0.11',
			     'url' => 'http://gtkspell.sourceforge.net/download/',
			     'src' => 'tar.gz',
			    },
   'Imaging'             => {
			     'ver' => '1.1.5',
			     'url' => 'http://effbot.org/downloads/',
			     'src' => 'tar.gz',
			    },
   'libburn'             => {
			     'ver' => '0.2',
			     'url' => 'http://icculus.org/burn/releases/',
			     'src' => 'tar.gz',
			    },
   'libesmtp'            => {
			     'ver' => '1.0.4',
			     'url' => 'http://www.stafford.uklinux.net/libesmtp/',
			     'src' => 'tar.bz2',
			    },
   'libexif-gtk'         => {
			     'ver' => '0.3.5',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libexif/',
			     'src' => 'tar.bz2',
			    },
   'libgphoto2'          => {
			     'ver' => '2.1.99',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'libgpod'              => {
                             'ver' => '0.3.2',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtkpod/',
                             'src' => 'tar.gz',
                            },
   'libmikmod'           => {
			     'ver' => '3.1.11',
			     'url' => 'http://mikmod.raphnet.net/files/',
			     'src' => 'tar.gz',
			    },
   'libexif-gtk'         => {
                             'ver' => '0.3.5',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libexif/',
                             'src' => 'tar.bz2',
                            },
   'libnjb'              => {
                             'ver' => '2.2.5',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/libnjb/',
                             'src' => 'tar.gz',
                            },
   'libnotify'           => {
                             'ver' => '0.4.0',
                             'url' => 'http://galago-project.org/files/releases/source/libnotify/',
                             'src' => 'tar.gz',
                            },
   'libsexy'             => {
                             'ver' => '0.1.8',
                             'url' => 'http://releases.chipx86.com/libsexy/libsexy/',
                             'src' => 'tar.gz',
                            },
   'neon'           => {
                             'ver' => '0.26.0',
                             'url' => 'http://www.webdav.org/neon/',
                             'src' => 'tar.gz',
                            },
   'notification-daemon' => {
                             'ver' => '0.3.5',
                             'url' => 'http://galago-project.org/files/releases/source/notification-daemon/',
                             'src' => 'tar.gz',
                            },
   'python-ldap'         => {
                             'ver' => '2.0.11',
                             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/python-ldap/',
                             'src' => 'tar.gz',
                            },
  );

# src/extras/libs
our %extras_libs_other =
  (
   'gc'                  => {
			     'ver' => '6.6',
			     'url' => 'http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/',
			     'src' => 'tar.gz',
			    },
  );

# src/extras/libs
our %extras_libs_gnome =
  (
   'devhelp'             => '0.11',
   'gdl'                 => '0.6.0',
   'glade'               => '2.12.1',
   'gnome-build'         => '0.1.2',
   'gnome-common'        => '2.12.0',
   'loudmouth'           => '1.0.3',
  );


# src/extras/gnome-apps
our %extras_gnome_apps =
  (
   'NetworkManager'      => '0.6.2',
   'gnome-audio'         => '2.0.0',
   'gnome-commander'     => '1.1.7',
   'gnome-cups-manager'  => '0.30',
   'gnome-power-manager' => '2.14.3',
   'gthumb'              => '2.7.6',
   'meld'                => '1.1.3',
   'pessulus'            => '0.10.1',
   'rhythmbox'           => '0.9.4.1',
   'sabayon'             => '2.12.3',
  );

# src/extras/gnome-apps
#our %extras_gnome_other_apps =
#  (
#   'gnome-power-manager'       => {
#                             'ver' => '0.3.4',
#                             'url' => 'http://internap.dl.sourceforge.net/sourceforge/gnome-power/',
#                             'src' => 'tar.gz',
#                            },
#  );


# src/extras/apps
our %extras_apps =
  (
   'anjuta'              => {
			     'ver' => '2.0.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/anjuta/',
			     'src' => 'tar.gz',
			    },
   'avidemux'            => {
			     'ver' => '2.1.2',
			     'url' => 'http://download.berlios.de/avidemux/',
			     'src' => 'tar.gz',
			    },
   'balsa'               => {
			     'ver' => '2.3.12',
			     'url' => 'http://balsa.gnome.org/',
			     'src' => 'tar.bz2',
			    },
   'bluefish'            => {
			     'ver' => '1.0.5',
			     'url' => 'http://pkedu.fbt.eitn.wau.nl/~olivier/downloads/',
			     'src' => 'tar.bz2',
			    },
   'bmpx'                 => {
			     'ver' => '0.14.4',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/beepmp/',
			     'src' => 'tar.gz',
			    },
   'drivel'              => {
			     'ver' => '2.0.2',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/drivel/',
			     'src' => 'tar.bz2',
			    },
   'dvgrab'              => {
			     'ver' => '2.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'easytag'             => {
			     'ver' => '1.99.12',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/easytag/',
			     'src' => 'tar.bz2',
			    },
   'gDesklets'           => {
			     'ver' => '0.35.3',
			     'url' => 'http://www.gdesklets.org/downloads/',
			     'src' => 'tar.bz2',
			    },
   'gaim'                => {
			     'ver' => '1.5.0',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gaim',
			     'src' => 'tar.bz2',
			    },
   'galeon'              => {
			     'ver' => '2.0.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/galeon',
			     'src' => 'tar.bz2',
			    },
   'gftp'                => {
			     'ver' => '2.0.18',
			     'url' => 'http://gftp.seul.org/',
			     'src' => 'tar.bz2',
			    },
   'gimp'                => {
			     'ver' => '2.2.11',
			     'url' => 'ftp://ftp.gimp.org/pub/gimp/v2.2/',
			     'src' => 'tar.bz2',
			    },
   'gnomebaker'          => {
			     'ver' => '0.5.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gnomebaker/',
			     'src' => 'tar.bz2',
			    },
   'gqview'              => {
			     'ver' => '2.1.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gqview/',
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
			     'ver' => '0.3.11',
			     'url' => 'http://software.jaos.org/source/gslapt/',
			     'src' => 'tar.gz',
			    },
   'gtkam'               => {
			     'ver' => '0.1.13',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gphoto/',
			     'src' => 'tar.gz',
			    },
   'gtkpod'              => {
			     'ver' => '0.99.4',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/gtkpod/',
			     'src' => 'tar.gz',
			    },
   'kino'                => {
			     'ver' => '0.8.1',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/kino/',
			     'src' => 'tar.gz',
			    },
   'inkscape'            => {
			     'ver' => '0.43',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/inkscape/',
			     'src' => 'tar.bz2',
			    },
   'liferea'             => {
			     'ver' => '1.0.10',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/liferea/',
			     'src' => 'tar.gz',
			    },
   'pstoedit'            => {
			     'ver' => '3.42',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/pstoedit/',
			     'src' => 'tar.gz',
			    },
   'skencil'             => {
			     'ver' => '0.6.16',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sketch/',
			     'src' => 'tar.gz',
			    },
   'slapt-get'           => {
			     'ver' => '0.9.11a',
			     'url' => 'http://software.jaos.org/source/slapt-get/',
			     'src' => 'tar.gz',
			    },
   'streamtuner'         => {
			     'ver' => '0.99.99',
			     'url' => 'http://savannah.nongnu.org/download/streamtuner/',
			     'src' => 'tar.gz',
			    },
   'streamripper'        => {
			     'ver' => '1.61.18',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/streamripper/',
			     'src' => 'tar.gz',
			    },
   'sylpheed'            => {
			     'ver' => '2.2.4',
			     'url' => 'http://sylpheed.good-day.net/sylpheed/v2.2/',
			     'src' => 'tar.bz2',
			    },
   'sylpheed-claws'      => {
			     'ver' => '1.9.99',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/sylpheed-claws/',
			     'src' => 'tar.bz2',
			    },
   'thoggen'             => {
			     'ver' => '0.4.2',
			     'url' => 'http://heanet.dl.sourceforge.net/sourceforge/thoggen/',
			     'src' => 'tar.gz',
			    },
   'xchat'               => {
			     'ver' => '2.6.2',
			     'url' => 'http://xchat.org/files/source/2.6/',
			     'src' => 'tar.bz2',
			    },
  );


# src/extras/apps
our %extras_apps_gnome =
  (
   'ghex'                => '2.8.2',
   'gossip'              => '0.11',
  );


# src/extras/applets_extensions
our %extras_applets =
  (
   'contact-lookup-applet' => {
			       'ver' => '0.13',
			       'url' => 'http://www.burtonini.com/computing/',
			       'src' => 'tar.gz',
			      },
   'istanbul'            => {
			     'ver' => '0.1.1',
			     'url' => 'http://live.hujjat.org',
			     'src' => 'tar.bz2',
			    },
   'lock-keys-applet'    => {
			     'ver' => '1.0',
			     'url' => 'http://www.wh-hms.uni-ulm.de/~mfcn/lock-keys-applet/packages/',
			     'src' => 'tar.gz',
			    },
   'mail-notification'   => {
			     'ver' => '2.0',
			     'url' => 'http://savannah.nongnu.org/download/mailnotify/',
			     'src' => 'tar.gz',
			    },
   'nautilus-open-terminal'  => {
			     'ver' => '0.6',
			     'url' => 'http://manny.cluecoder.org/packages/nautilus-open-terminal/',
			     'src' => 'tar.gz',
                            },
  );

# src/extras/applets_extensions
our %extras_applets_gnome =
  (
   'quick-lounge-applet'      => '2.12.1',
   'fast-user-switch-applet'  => '2.14.1',
   'deskbar-applet'           => '2.14.1.1',
  );


#
# End Config Options
################################################################################

