<?php
/*
    Chip Cuccio <http://chip.cuccio.us>
    $Id: index.php 2773 2007-11-18 16:49:41Z chipster $
*/

// Set req. vars
$errno          =	$_REQUEST['errno'];
$op 	        =   $_REQUEST['op'];
$ports          =   $_REQUEST['ports'];
$news_page      =   $_REQUEST['news_page'];
$http_error     =   $_REQUEST['http_error'];
$cl_ver         =   $_REQUEST['cl_ver'];
$show_software  =   $_REQUEST['show_software'];

// Set the default index section if none specified or on initial page entry
if (!isset($op)) {
    $op = "index";
}

// globals
$rnd = md5(gmdate('M d Y'));
require('common/versions_inc.php');

// common title
$common_title = "GNOME SlackBuild";

// error handlers
switch ($errno) {
    case "401":
        $errdesc = "Error 401 - Authorization Required";
        break;
    case "403":
        $errdesc = "Error 403 - Access Forbidden";
        break;
    case "404":
        $errdesc = "Error 404 - Not Found";
        break;
}

// Section title display engine
switch ($op) { 
    case "index":
        if (strstr($_SERVER['REQUEST_URI'], "news")) {
            $title = "News : $common_title";
        } else {
            $title = $common_title;
        }
        break;
    case "about":
        if ($show_software == true) {
            $title = "Software Included: $common_title";
        } else {
            $title = "About : $common_title";
        }
        break;
    case "download":
        if ($ports == true) {
            $title = "Ports : $common_title";
        } else {
            $title = "Download &amp; Installation : $common_title";
        }
        break;
    case "links":
        $title = "Links : $common_title";
        break;
    case "screenshots";
        $title = "Screenshots : $common_title";
        break;
    case "support":
        $title = "Support : $common_title";
        break;
    case "development":
        $title = "Development : $common_title";
        break;
    case "changelog":
        $title = "ChangeLog : $common_title";
        break;
    case "http_error":
        $title = $errdesc;
        break;
    default:
        $title = "$common_title";
        header("Location: /");
        exit();
}

// The "engine" that runs the site ops.
function section($op,$news,$errno,$errdesc,$SERVER_NAME,$HTTP_REFERER,
                 $SERVER_SIGNATURE,$REQUEST_URI,$REDIRECT_URL,$mode,
                 $slack_ver,$dir,$path,$ver,$gsb_bin_stable_ver,$gsb__source_ver,
                 $cl_ver,$ports,$stable,$gsb_bin_unstable_ver,$gsb_bin_current_ver,
                 $slack_unstable_ver,$gsb_bin_64_ver,$show_software) {
    $PAGE['url_'.$op] = ("content/$op.html");
    $doit = "url"."_"."$op";
    if (is_file($PAGE[$doit])) {
        include($PAGE[$doit]);
    }
    return $section;
}

// common includes
include('common/header_inc.php');
include('common/sidebar_inc.php');
include('common/body_inc.php');
include('common/footer_inc.php');

?>
