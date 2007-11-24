<?php
/*
    Changelog2RSS
    $Id: changelog2rss.php 2876 2007-11-24 19:33:54Z chipster $
    Code based off of Fred Emmott's changelog/rss parser of the Slamd64
    project <http://www.fredemmott.co.uk/> and <http://www.slamd64.com>.

    Contains hacks and tweaks from GSB developers (IE: Valid RSS feed)
*/

header("Content-type: text/xml");
$localServer = 'http://dixie.chipsnet.org/~chipster/gsb/';
$feeds = 'ChangeLog';
$feedPath = "$localServer/$feeds";
$mirror = "http://dixie.chipsnet.org/~chipster/gsb/";
$realdate = date('r');
$items = array();

$ch = curl_init();
$timeout = 5; // set to zero for no timeout
curl_setopt ($ch, CURLOPT_URL, "$feedPath");
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
$cl_result = curl_exec($ch);
curl_close($ch);
$file = $cl_result;
// $file = implode('', file("$feedPath"));
$days = explode('+--------------------------+', $file);
foreach ($days as $day)
{
	$lines = preg_split('/\n/', $day);
	if (trim($lines[0]) == '')
		array_shift($lines);
	$date = preg_replace('/(\w+ \w+ \w+) (.+) (\d{4})/', '\1 \3 \2', $lines[0]);
	$date = trim(date('r', strtotime($date)));
	array_shift($lines);
	$day = implode("\n", $lines);
	$splitChanges = preg_split('/(?m)^(\w.+)\n?/', $day, -1, PREG_SPLIT_DELIM_CAPTURE);
	array_shift($splitChanges);
	$changes = array();
	for ($i = 0; $i < count($splitChanges); $i++)
		$changes[($i - ($i % 2))/2] .= $splitChanges[$i] . "\n";
	foreach ($changes as $change)
	{
		$lines = preg_split('/\n/', $change);
		if (trim($lines[0]) == '')
			array_shift($lines);
		while (trim($lines[count($lines) - 1]) == '')
			array_pop($lines);
		//if (preg_match('/:/', $lines[0]))
        	if (preg_match('#/.*:#', $lines[0]))
		{
			$path =  preg_replace('/(.+):.+/','\1', $lines[0]);
			$longPath = "$mirror/$path";
		}
		else
		{
			$path = 'http://gnomeslackbuild.org/changelog/';
			$longPath = $path;
		}
		stristr($lines[count($lines) - 1], '(* Security fix *)')
 				? $secFix = true
			: $secFix = false;
		$data = implode("\n", $lines);
		$items[$path] = array(
			'secFix' => $secFix,
			'data' => preg_replace('/\s+/', ' ', strip_tags($data)),
			'date' => $date,
			'longPath' => $longPath
			);
	}
}
print('<?xml version="1.0" encoding="ISO-8859-1"?>' . "\n");
?>
<rss version="2.0" 
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
>
  <channel>
    <title>GSB-bin-current ChangeLog</title>
    <link>http://gnomeslackbuild.org/changelog/current/</link>
    <description>ChangeLog for GSB-bin-current</description>
    <language>en</language>
<?php
foreach ($items as $path => $item)
{
?>
	<item>
		<title><?php echo "$path$extra"; ?></title>
        <link><?php echo $item['longPath']; ?></link>
		<pubDate><?php echo $item['date']; ?></pubDate>
		<description><?php echo $item['data']; ?></description>
	</item>
<?php
}
?>
  </channel>
</rss>
