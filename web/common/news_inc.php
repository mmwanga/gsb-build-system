<?php
/*

    GSB news function PHP script <http://gsb.sf.net>
    Chip Cuccio <chipster@norlug.org>
    $Id: news.php 109 2005-02-17 01:17:22Z chipster $

*/

// authors' email addresses
$author["chipster"]="chipster@norlug.org";
$author["freerock"]="freerock [at] gmail (dot) com";

// max items to show on one page
$max = 3;

// news file
$ff = "news.txt";

// entry separator
$sep = "###";

if (!is_file($ff)) {
    print("<h2>No News</h2>\n\n");
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

    $start = $news_page > 0 ? ($max * $news_page) : 0;
    $max = $news_page > 0 ? ($max * ($news_page+1)) : $max;

    for ($a=$start; $a<count($farr)-1; $a++) {
        $news = explode("\n", trim($farr[$a]),4);
        $ndate=array_shift($news);
        $nick=array_shift($news);
        $subject=array_shift($news);

        $author = $nick;
        $ndate=split("-",$ndate);
        $ndate_tzone=$ndate[_SEC];
        $ndate[_SEC] = "00";
        $ndate=mktime($ndate[_HOUR],$ndate[_MINUTE], $ndate[_SEC],
            $ndate[_MONTH], $ndate[_DAY], $ndate[_YEAR]);
        $ndate = date("Y/m/d @ H:i", $ndate);

        $news = preg_replace("/(?<!<a href=\")((http||https|ftp|rsync|news|irc)+(s)?:\/\/[^<>\s]+)/i",
            "<a href=\"\\0\">&lt;\\0&gt;</a>", $news);
       
        print( "<h2>".$subject."</h2>\n"
              ."<p class=\"newsheader\">Posted ".$ndate." ".$ndate_tzone." by "
              .$author."</p>\n"
              ."<div class=\"news_entry\">".$news[0]."</div>\n"
              ."<hr class=\"doNotDisplay\"/>\n" );
        if ($a >= $max-1) break; 
    }

    if ($start == 0 && $news_page <= 0) {
        print( "<p><a href=\"/news/1#news\">Older News</a> &raquo;</p>\n" );
    }

    if ($start > 0) {
        $prevlink = "&lt;Prev";
        $nextlink = "Next&gt;";
        if ( $max < count($farr)-1 )
            $nextlink = "<a href=\"/news/".($news_page+1)."#news\">Next</a>&gt;";
        if ($news_page > 1)
            $prevlink = "&lt;<a href=\"/news/".($news_page-1)."#news\">Prev</a>";
        print( "<p><a href=\"/\">Home</a> | ".$prevlink." : ". $nextlink . "</p>\n" );
    }

    if ($news_page > 0) {
    }
}
?>
