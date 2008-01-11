package GSB::Themes;
require Exporter;

use strict;
use warnings;

our @ISA       = qw(Exporter);
our @EXPORT    = qw(%gnome_themes %other_themes %double_tarballs_themes);
our @EXPORT_OK = qw();
our $VERSION   = 0.03;

################################################################################
#
# Themes options

# GNOME Supplies Themes
our %gnome_themes =
  (
   'gnome-themes-extras'  => '2.20',
  );

# Extra Themes of regular naming convention
our %other_themes =
  (
   'candido-engine'           => {
			      'ver' => '0.9.1',
			      'url' => 'http://download.berlios.de/candido',
			      'src' => 'tar.bz2',
			     },
  );

# Strangely named source tarballs can be found here.
our %double_tarballs_themes =
  (
   'candido-themes'            => {
             'url' => 'http://candido.berlios.de/media/download_gallery',
             'ver' => '1.0',
			 'dir' => 'themes/candido-themes',
			 'tar' => 'Candido.tar.bz2',
             'var' => 'VERSION',
                  },
   'candido-themes-icons'            => {
             'url' => 'http://nuovext.pwsp.net/files',
             'ver' => '1.0',
			 'dir' => 'themes/candido-themes',
			 'tar' => 'nuoveXT.2.2.tar.bz2',
             'var' => 'VERSION',
                  },
   'murrine-engine'            => {
             'url' => 'http://murrine.netsons.org/files',
             'ver' => '0.53.1',
			 'dir' => 'themes/murrine-engine',
			 'tar' => 'murrine-0.53.1.tar.bz2',
             'var' => 'VERSION',
                  },
   'murrine-themes-gtk'            => {
             'url' => 'http://murrine.netsons.org/files',
             'ver' => '1.0',
			 'dir' => 'themes/murrine-themes',
			 'tar' => 'MurrineThemePack.tar.bz2',
             'var' => 'VERSION',
                  },
   'murrine-themes-metacity'            => {
             'url' => 'http://murrine.netsons.org/files',
             'ver' => '1.0',
			 'dir' => 'themes/murrine-themes',
			 'tar' => 'MurrineRounded.tar.bz2',
             'var' => 'VERSION',
                  },
   'mac4lin-themes'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mac4lin',
             'ver' => '0.3',
			 'dir' => 'themes/mac4lin-theme',
			 'tar' => 'Mac4Lin_v0.3.tar.gz',
             'var' => 'VERSION',
                  },
   'mac4lin-icons'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mac4lin',
             'ver' => '0.3',
			 'dir' => 'themes/mac4lin-theme',
			 'tar' => 'Mac4Lin_Icons_v0.3a_for_GNOME_2.20.tar.gz',
             'var' => 'VERSION',
                  },
   'mac4lin-wallpapers'            => {
             'url' => 'http://heanet.dl.sourceforge.net/sourceforge/mac4lin',
             'ver' => '0.3',
			 'dir' => 'themes/mac4lin-theme',
			 'tar' => 'Wallpapers_Mac4Lin_v0.3.tar.gz',
             'var' => 'VERSION',
                  },
   'nmc'            => {
             'url' => 'http://murrine.netsons.org/files',
             'ver' => '1.4',
			 'dir' => 'themes/nmc',
			 'tar' => 'nmc.tar_3.bz2',
             'var' => 'VERSION',
                  },
  );
