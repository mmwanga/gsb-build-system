<?php
/*

    Main content body PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id$

*/
?>
<div id="main-body">

<?php
// default main landing page
if ($op == "index" && (!eregi("news", $REQUEST_URI))) {
    include_once('content/intro.html');
    print("<h2 id=\"news\">News and Announcements:</h2>\n");
    include_once('common/news_inc.php');
// if in news sections, omit "intro" item
} elseif ($op == "index" && (eregi("news", $REQUEST_URI))) {
    print("<h2 id=\"news\">News and Announcements:</h2>\n");
    include_once('common/news_inc.php');
} else {
    // Section selector - BODY - rest of site sections
    section($op,$news,$errno,$errdesc,$SERVER_NAME,$HTTP_REFERER,
            $SERVER_SIGNATURE,$REQUEST_URI,$REDIRECT_URL,$mode,
            $slack_ver,$dir,$path,$ver,$frg_ver,$gsb_ver,$gnome_ver,
            $cl_ver);
}
?>

</div>

