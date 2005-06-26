<?php
/*

    Header PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id: header_inc.php 63 2005-02-13 23:46:18Z chipster $

*/
$rnd = md5(rand(1,999999));
header("Content-Type: text/html;charset=utf-8");
print("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
?>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD XHTML 1.1 plus MathML 2.0 plus SVG 1.1//EN"
  "http://www.w3.org/2002/04/xhtml-math-svg/xhtml-math-svg.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="MSSmartTagsPreventParsing" content="TRUE" />
  <meta http-equiv="MSTHEMECOMPATIBLE" content="no" />
  <link rel="stylesheet" type="text/css"
    href="/css/style.css?<?php echo($rnd); ?>"
    media="screen" title="Yummy Style" />
  <link rel="alternate stylesheet" type="text/css" href=
    "/css/print.css" media="print" title="Printer-friendly Style" />
  <title><?php echo($title); ?></title>
</head> 
<!--
    GSB site code <http://gsb.sf.net>
    Chip Cuccio <chipster@norlug.org>
    $Revision: 703 $
    $Date$
    $Author: chipster $
-->
<body>  
  
<?php include('content/header.html'); ?>
