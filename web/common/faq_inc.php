<?php
/*

    GSB FAQ function PHP script <http://gsb.sf.net>
    Chip Cuccio <chipster@norlug.org>
    $Id: news.php 109 2005-02-17 01:17:22Z chipster $

*/

// authors' email addresses
$author["chipster"]="chipster@norlug.org";
$author["freerock"]="freerock [at] gmail (dot) com";

// max items to show on one page
$max = 9999;

// news file
$ff = "faqs.txt";

// entry separator
$sep = "###";

if (!is_file($ff)) {
    print("<h2>No FAQs</h2>\n\n");
} else {

    define("_HOUR", 3);
    define("_MINUTE", 4);
    define("_SEC", 5);
    define("_MONTH", 1);
    define("_DAY", 2);
    define("_YEAR", 0);

    $fd = @fopen ($ff, "r");
    $data = @fread ($fd, filesize ($ff));
    @fclose ($fd);

    $farr = explode($sep, trim($data));
    rsort($farr);

    $start = $faq_page > 0 ? ($max * $faq_page) : 0;
    $max = $faq_page > 0 ? ($max * ($faq_page+1)) : $max;

    for ($a=$start; $a<count($farr)-1; $a++) {
        $faq = explode("\n", trim($farr[$a]),4);
        $ndate=array_shift($faq);
        $nick=array_shift($faq);
        $subject=array_shift($faq);

        $author = $nick;
        $ndate=split("-",$ndate);
        $ndate_tzone=$ndate[_SEC];
        $ndate[_SEC] = "00";
        $ndate=mktime($ndate[_HOUR],$ndate[_MINUTE], $ndate[_SEC],
            $ndate[_MONTH], $ndate[_DAY], $ndate[_YEAR]);
        $ndate = date("Y/m/d @ H:i", $ndate);
        $faq_id = $a;
        $faq = preg_replace("/(?<!<a href=\")((http|https|rsync|news|irc|ftp)+(s)?:\/\/[^<>\s]+)/i", "<a href=\"\\0\">\\0</a>", $faq);

        print( "<h3 class=\"faqhead\" id=\"faq_id-$a\">\"".$subject."\"</h3>\n"
              ."<blockquote>\n<div class=\"faq_entry\">".$faq[0]."</div>\n</blockquote>\n"
              ."<hr class=\"doNotDisplay\"/>\n" );
        if ($a >= $max-1) break; 
    }

    if ($start == 0 && $faq_page <= 0) {
        print( "<p></p>\n" );
    }

    if ($start > 0) {
        $prevlink = "&lt;Prev";
        $nextlink = "Next&gt;";
        if ( $max < count($farr)-1 )
            $nextlink = "";
        if ($faq_page > 1)
            $prevlink = "";
        print( "<p></p>\n" );
    }

    if ($faq_page > 0) {
    }
}
?>
