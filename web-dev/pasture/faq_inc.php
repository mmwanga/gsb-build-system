<?php
/*

    GSB FAQ function PHP script <http://gsb.sf.net>
    Chip Cuccio <http://chip.cuccio.us>
    Contains code from Fluxbox web code
        <http://fluxbox.sourceforge.net>
    $Id: faq_inc.php 2858 2007-11-22 18:12:08Z chipster $

*/

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
        $faq = explode("\n", trim($farr[$a]),3);
        $ndate=array_shift($faq);
        $subject=array_shift($faq);

        $ndate=split("-",$ndate);
        $ndate_tzone=$ndate[_SEC];
        $ndate[_SEC] = "00";
        $ndate=mktime($ndate[_HOUR],$ndate[_MINUTE], $ndate[_SEC],
            $ndate[_MONTH], $ndate[_DAY], $ndate[_YEAR]);
        $ndate = date("Y/m/d @ H:i", $ndate);
        $faq_id = $a;
        //$faq = preg_replace("/(?<!<a href=\")((http|https|rsync|news|irc|ftp)+(s)?:\/\/[^<>\s]+)/i", "<a href=\"\\0\">\\0</a>", $faq);

        if(!ereg("</p>", $faq[0])) {
            print( "<dt class=\"faqhead\" id=\"faq_id-$a\"><q>$subject</q></dt>\n"
                   ."<dd class=\"faqentry\"><br />\n".$faq[0]."\n<br /><br /></dd>\n" );
        } else {
             print( "<dt class=\"faqhead\" id=\"faq_id-$a\">\"".$subject."\"</dt>\n"
                   ."<dd class=\"faqentry\">\n".$faq[0]."\n</dd>\n" );
        }
        if ($a >= $max-1) break; 
    }

    if ($start == 0 && $faq_page <= 0) {
        print( "\n" );
    }

    if ($start > 0) {
        $prevlink = "&lt;Prev";
        $nextlink = "Next&gt;";
        if ( $max < count($farr)-1 )
            $nextlink = "";
        if ($faq_page > 1)
            $prevlink = "";
        print( "\n" );
    }

    if ($faq_page > 0) {
    }
}
?>
