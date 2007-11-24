<?php
/*
    Header PHP script
    Chip Cuccio <http://chip.cuccio.us>
    $Id: header_inc.php 2876 2007-11-24 19:33:54Z chipster $
*/

/* set preliminary headers */
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");    // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // Expires now
header("Cache-Control: no-store, no-cache, must-revalidate");  // HTTP/1.1
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

// MIME negotiation
require('common/mime_inc.php');

// force non-caching CSS after changes
$CSS_RAND = true;

?>
<head>
  <meta http-equiv="Content-Type" content="<?php echo $mime ?>; charset=<?php echo $charset; ?>" />
  <meta name="author" content="Chip Cuccio" />
  <style type="text/css" title="Chipster's Plenty-O-Whitespace Style">
    <?php if($CSS_RAND == true) { ?>
    @import url(/css/style.css?v=<?php echo($rnd); ?>) screen;
    <?php } else { ?>
    @import url(/css/style.css) screen;
    <?php } ?>
</style>
  <link rel="stylesheet" href="/css/print.css"
      type="text/css" media="print" />
  <link rel="shortcut icon" href="/favicon.ico" />
  <link rel="alternate" type="application/rss+xml" title=
    "GSB Binary -current ChangeLog" href="http://gnomeslackbuild.org/changelog.xml" />
  <title><?php echo($title); ?> - a GNOME distribution for Slackware Linux</title>
  <link rel="stylesheet" href="/js/lightbox/css/lightbox.css"
    type="text/css" media="screen" />
  <script type="text/javascript" src="/js/lightbox/js/prototype.js"></script>
  <script type="text/javascript" src="/js/lightbox/js/effects.js"></script>
  <script type="text/javascript" src="/js/lightbox/js/lightbox.js"></script>
</head> 
<!--
    GSB site code <http://gnomeslackbuild.org>
    Chip Cuccio <http://chip.cuccio.us>
    $Id: header_inc.php 2876 2007-11-24 19:33:54Z chipster $
    
    // ENVs:

        OP:       <?php echo($op."\n"); ?>
        REQ URI:  <?php echo($_SERVER['REQUEST_URI']."\n"); ?>
        QS:       <?php echo($_SERVER['QUERY_STRING']."\n"); ?>

    // VERs:
              <?php print("\n\t"
                        .$gsb_source_ver."\n\t"
                        .$gsb_bin_stable_ver."\n\t"
                        .$slack_ver."\n\t"
                        .$slack_unstable_ver."\n\t"
                        .$gsb_bin_64_ver."\n\t"
                        .$gsb_bin_current_ver."\n\t"
                        .$gsb_bin_unstable_ver."\n"); ?>
-->
<body>  
  
<?php include('content/header.html'); ?>
