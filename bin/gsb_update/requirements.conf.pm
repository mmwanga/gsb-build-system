################################################################################
# Config Options
#

my %requirements =
  (
   'dbus'            => {
			 'url' => 'http://dbus.freedesktop.org/releases/',
			 'ver' => '0.23',
			 'src' => 'tar.gz',
                        },
   'hal'             => {
			 'url' => 'http://freedesktop.org/~david/dist/',
			 'ver' => '0.4.7',
			 'src' => 'tar.gz',
                        },
   'howl'            => {
			 'url' => 'http://www.porchdogsoft.com/download/',
			 'ver' => '0.9.10',
			 'src' => 'tar.gz',
                        },
   'libcap'          => {
			 'url' => 'http://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/',
			 'ver' => '1.10',
			 'src' => 'tar.gz',
                        },
   'libcroco'          => {
			 'url' => 'http://ftp.gnome.org/pub/GNOME/sources/libcroco',
			 'ver' => '0.6.0',
			 'src' => 'tar.bz2',
                        },
   'libgsf'          => {
			 'url' => 'http://ftp.gnome.org/pub/GNOME/sources/',
			 'ver' => '1.11.1',
			 'src' => 'tar.bz2',
                        },
   );

my %stupid_gnomemeeting_libs =
  (
   'openh323'  => {
		   'url'   => 'http://www.gnomemeeting.org/admin/downloads/latest/sources/sources/',
		   'ver'   => 'v1_15_2-src-',
		   'sbver' => '1.15.2',
		   'src'   => 'tar.gz',
		  },
   'pwlib'     => {
		   'url'   => 'http://www.gnomemeeting.org/admin/downloads/latest/sources/sources/',
		   'ver'   => 'v1_8_3-src-',
		   'sbver' => '1.8.3',
		   'src'   => 'tar.gz',
		  },
  );

#
# End Config Options
################################################################################
