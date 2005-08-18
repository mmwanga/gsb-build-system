<?php
/*

    The index.php "brain" PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id: index.php 703 2005-06-26 02:39:11Z chipster $

*/


// Set the default index section if none specified or on initial page entry
if (!isset($op)) {
    $op = "index";
}

// set common title
$common_title = "Freerock GNOME / GNOME.SlackBuild";

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
        $title = $common_title;
        break;
    case "about":
        $title = "About : $common_title";
        break;
    case "download":
        $title = "Downloads : $common_title";
        break;
    case "installation":
        $title = "Installation : $common_title";
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
        $frg_ver = $frg_ver;
        break;
    case "packages":
        $title = "Package Browser: $common_title";
        break;
    case "http_error":
        $title = $errdesc;
        break;
    case "faqs":
        $title = "FAQs : $common_title";
        break;
    default:
        $title = "$common_title";
        header("Location: /");
        exit();
}

// The "engine" that runs the site ops.
function section($op,$news,$errno,$errdesc,$SERVER_NAME,$HTTP_REFERER,
                 $SERVER_SIGNATURE,$REQUEST_URI,$REDIRECT_URL,$mode,
                 $dir,$path,$ver,$frg_ver,$gsb_ver,$gnome_ver,$cl_ver) {
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
include('common/main-index_inc.php');
include('common/footer_inc.php');

?>
