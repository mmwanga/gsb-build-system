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
if ($op == "index") {
    print("<h2 id=\"news\">News and Announcements:</h2>");
    include_once('common/news_inc.php');
    include_once('content/about.html');
} else {
    // Section selector - BODY
    section($op,$news);
}
?>

</div>

