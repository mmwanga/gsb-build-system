<?php
/*

    GSB news function PHP script <http://gsb.sf.net>
    Chip Cuccio <chipster@norlug.org>
    $Id$

*/

// authors' email addresses
$author["chipster"]="chipster@norlug.org";
$author["freerock"]="freerock [at] gmail (dot) com";

// max items to show on one page
$max = 1;

// news file
$ff = "news.txt";

// entry separator
$sep = "###";

if (is_file($ff)) {

    define("_HOUR", 3);
    define("_MINUTE", 4);
    define("_SEC", 5);
    define("_MONTH", 1);
    define("_DAY", 2);
    define("_YEAR", 0);

    $fd = fopen ($ff, "r");
    $data = fread ($fd, filesize ($ff));
    fclose ($fd);

    $farr = split($sep, trim($data));
    rsort($farr);

    $start = $news_page > 0 ? ($max * $news_page) : 0;
    $max = $news_page > 0 ? ($max * ($news_page+1)) : $max;

    for ($a=$start; $a<count($farr)-1; $a++) {
        $news = explode("\n", trim($farr[$a]),4);
        $news = str_replace("\n", "\n\t    ", $news);
        $ndate=array_shift($news);
        $nick=array_shift($news);
        $subject=array_shift($news);

        $author="<a href=\"mailto:".$author[$nick]."\">".$nick."</a>";
    
        $ndate=split("-",$ndate);
        $ndate_tzone=$ndate[_SEC];
        $ndate[_SEC] = "00";
        $ndate=mktime($ndate[_HOUR],$ndate[_MINUTE], $ndate[_SEC],
        $ndate[_MONTH], $ndate[_DAY], $ndate[_YEAR]);
        $ndate = date("Y/m/d @ H:i", $ndate);

        $news = preg_replace("/(?<!<a
         href=\")((http|ftp|rsync|gopher)+(s)?:\/\/[^<>\s]+)/i", "<a
         href=\"\\0\">&lt;\\0&gt;</a>", $news);
       
        print( "<h3 id=\"news_entry\">".$subject."</h3>\n\n"
              ."\t<dl>\n\t <dt><small>Posted ".$ndate." ".$ndate_tzone." by \n\t "
              .$author."</small></dt>\n"
              ."\t   <dd><p>\n\t    <em>".$news[0]."</em>\n\t   </p></dd>\n\t</dl>\n\n" );
        if ($a >= $max-1) break; 
    }

    if ($start == 0 && $news_page <= 0) {
        print( "\t<p>&lt; <a href=\"/news/1\">Older News</a> &gt;</p>\n" );
    }

    if ($start > 0) {
        $prevlink = "";
        $nextlink = "";
        if ( $max < count($farr)-1 )
            $nextlink = ": <a href=\"/news/".($news_page+1)."\">Next</a> &gt;";
        if ($news_page > 1)
            $prevlink = " | &lt; <a href=\"/news/".($news_page-1)."\">Prev</a> ";
        print( "\t<p><a href=\"/\">Home</a> ".$prevlink." ". $nextlink . "</p>\n" );
    }

    if ($news_page > 0) {
    }
}
?>
