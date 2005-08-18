<?php

/* versions func */

$versions = @file("versions.txt");
$proj_ver = explode(" : ", trim($versions[0]));

$frg_ver = $proj_ver[0];
$gsb_ver = $proj_ver[1];
$gnome_ver = $proj_ver[2];

//debug
/*
print ("FRG: ".$proj_ver[0]."<br />");
print ("GSB: ".$proj_ver[1]."<br />");
print ("GNOME: ".$proj_ver[2]."<br />");
*/

?>
