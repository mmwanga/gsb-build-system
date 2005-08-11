<?php
$distro = "frg";
$stable = trim(`cat frg-ver.txt`);
$versions = array( # 'version' => 'directory name', most recent first
	current => "$distro-current",
	$stable => "$distro-$stable"
	);
$hideDirs = array( NULL,
	'source',
	'isolinux',
	'kernels',
    'install_scripts',
	'.',
	'..'
	);
$pkgExt = 'tgz';
$path = "/home/chipster/poosie-export/frg";

$fastMode = true; # if false, it's not just slow, it will also only return the first pack

# below only required for fastMode

$mysql_db = 'pb';
$mysql_user = 'pb';
$mysql_pass = 'pb';
$mysql_server = 'localhost';

$tmp = '/tmp/pb';
?>
