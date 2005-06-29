<?php
/*

    Main content body PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id: main-index_inc.php 141 2005-02-20 15:52:16Z chipster $

*/
?>
<div id="main-body">

<?php
// default main landing page
if ($op == "index" && (!eregi("news", $REQUEST_URI))) {
    print("<h2 id=\"news\">News and Announcements:</h2>\n");
    include_once('common/news_inc.php');
    include_once('content/about.html');
// if in news sections, omit "about" footer item
} elseif ($op == "index" && (eregi("news", $REQUEST_URI))) {
    print("<h2 id=\"news\">News and Announcements:</h2>\n");
    include_once('common/news_inc.php');
} else {
    // Section selector - BODY - rest of site sections
    section($op,$news,$frg_ver,$errno,$errdesc,$SERVER_NAME,
            $HTTP_REFERER,$SERVER_SIGNATURE,$REQUEST_URI,$REDIRECT_URL);
}
?>

</div>

