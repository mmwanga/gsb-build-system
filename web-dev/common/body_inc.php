<?php
/*

    Main content body PHP script
    Chip Cuccio <http://chip.cuccio.us>
    $Id: body_inc.php 2876 2007-11-24 19:33:54Z chipster $

*/
?>
<div id="main-body">

<?php
// default main landing page
if ($op == "index" && (!eregi("news", $_SERVER['REQUEST_URI']))) {
    include_once('content/intro.html');
    print("<h2 id=\"news\">News and Announcements:</h2>\n");
    include_once('common/news_inc.php');

// if in news sections, omit "intro" item
} elseif ($op == "index" && (eregi("news", $_SERVER['REQUEST_URI']))) {
    print("<h2 id=\"news\">News and Announcements:</h2>\n");
    include_once('common/news_inc.php');
} else {
    // Section selector - BODY - rest of site sections
    section($op,$news,$errno,$errdesc,$SERVER_NAME,$HTTP_REFERER,
        $SERVER_SIGNATURE,$REQUEST_URI,$REDIRECT_URL,$mode,
        $slack_ver,$dir,$path,$ver,$gsb_bin_stable_ver,$gsb_source_ver,
        $cl_ver,$ports,$stable,$gsb_bin_unstable_ver,$gsb_bin_current_ver,
        $slack_unstable_ver,$gsb_bin_64_ver,$show_software);
}
?>

</div>

