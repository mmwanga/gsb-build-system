<?php
/*

    GSB news function PHP script <http://gsb.sf.net>
    Chip Cuccio <chipster@norlug.org>
    $Id$

*/

// max items to show on one page
$max = 1;
// news file
$ff = "news.html";
// entry separator
$sep = "<!-- ### -->";

if (is_file($ff)) {

/*
    $level = intval($level);

    if ($level <=0 && !$SHOW_NEWS)
    {
        Header("Location: ./?level=1");
        exit;
    }

    if ($level > 0)
    {
        $ST_TOPIC="news";
    }
*/

    define("_HOUR", 3);
    define("_MINUTE", 4);
    define("_SEC", 5);
    define("_MONTH", 1);
    define("_DAY", 2);
    define("_YEAR", 0);

    // authors' email addresses
    $author["chipster"]="chipster [at] norlug (dot) org";
    $author["freerock"]="freerock [at] gmail (dot) com";

    $fd = fopen ($ff, "r");
    $data = fread ($fd, filesize ($ff));
    fclose ($fd);

    $farr = split($sep, trim($data));
    rsort($farr);

    $start = $level > 0 ? ($max * $level) : 0;
    $max = $level > 0 ? ($max * ($level+1)) : $max;

    for ($a=$start; $a<count($farr)-1; $a++) {
        $news = split("\n", trim($farr[$a]),4);
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
       
        print( "<h3>".$subject."</h3>\n"
              ."<dl>\n<dt><em>Posted ".$ndate." ".$ndate_tzone." by \n"
              .$author."</em></dt>\n"
              ."<dd><p>".$news[0]."</p></dd>\n</dl>\n\n" );
        if ($a >= $max-1) break; 
    }

    if ($start == 0 && $level <= 0) {
        print( "&lt; <a href=\"./?level=1\">Older News</a> &gt;\n" );
    }

    if ($start > 0) {
        $prevlink = "&lt; Prev";
        $nextlink = "Next &gt;";
        if ( $max < count($farr)-1 )
            $nextlink = "<a href=\"./?level=".($level+1)."\">Next &gt;</a>";
        if ($level > 1)
            $prevlink = "<a href=\"./?level=".($level-1)."\">&lt; Prev</a>";
        print( "<a href=\"./\">Home</a> | ".$prevlink." : ". $nextlink . "\n" );
    }

    if ($level > 0) {
    }
}
?>
