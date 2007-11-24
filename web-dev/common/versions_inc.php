<?php

/* versions func */

// global, req'd stuff
$versions = @file("versions.txt");
$proj_ver = explode(" : ", trim($versions[0]));

$gsb_source_ver       =   $proj_ver[0];
$gsb_bin_stable_ver   =   $proj_ver[1];
$slack_ver            =   $proj_ver[2];
$slack_unstable_ver   =   $proj_ver[3];
$gsb_bin_64_ver       =   $proj_ver[4];
$gsb_bin_current_ver  =   $proj_ver[5];
$gsb_bin_unstable_ver =   $proj_ver[6];

// net-installer stuff
if(!isset($use_ver)) {
    $use_ver = $gsb_bin_stable_ver;
}

/*
$slapt_path    = "/home/chipster/rsync_repo/frg/frg-$use_ver/extras/apps/";
$slapt_ver_cmd = "ls $slapt_path/slapt-get*.tgz | \
        sed s'|\/.*\/.*\/.*\/||'g | sed s'|slapt-get-||'g | sed \
        s'|\.tgz||g'";
$slapt_get_ver = exec($slapt_ver_cmd);
*/

?>
