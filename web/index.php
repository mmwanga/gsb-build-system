<?php
/*

    The index.php "brain" PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id$

*/

// Set the default index section if none specified or on initial page entry
if (!isset($op)) {
    $op = "index";
}

// set common title
$common_title = "GSB: GNOME.SlackBuild";

// Section title display engine
switch ($op) { 
    case "index":
        $title = $common_title;
        break;
    case "about":
        $title = "About : $common_title";
        break;
    case "dev":
        $title = "Development : $common_title";
        break;
    case "download":
        $title = "Downloads : $common_title";
        break;
    case "help":
        $title = "Help : $common_title";
        break;
    case "installation":
        $title = "Installation : $common_title";
        break;
    case "links":
        $title = "Links : $common_title";
        break;
    case "roadmap";
        $title = "Roadmap : $common_title";
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
    case "faqs":
        $title = "FAQs : $common_title";
        break;
    default:
        $title = "$common_title";
        header("Location: /");
        exit();
}

// The "engine" that runs the site ops.
function section($op,$news,$frg_ver,$SERVER_NAME,$REQUEST_URI) {
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
