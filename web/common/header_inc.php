<?php
/*

    Header PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id: header_inc.php 993 2005-08-25 22:18:16Z chipster $

*/
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
  <meta name="keywords" content="gnome,slackware,gnome slackware,slackware gnome,gnome on slackware,freerock,freerock gnome,freerock's gnome,frg,gnome slackbuild,slackbuid,gsb" />
  <meta name="description" content="Gnome.SlackBuild / Freerock GNOME is a GNOME distribution for Slackware Linux" />
  <meta name="author" content="Chip Cuccio" />
  <link rel="stylesheet" type="text/css"
    href="/css/style.css?<?php echo($rnd); ?>"
    media="screen" title="Yummy Style" />
  <link rel="alternate stylesheet" type="text/css" href=
    "/css/print.css" media="print" title="Printer-friendly Style" />
  <title><?php echo($title); ?> - a GNOME distribution for Slackware Linux</title>
</head> 
<!--
    GSB site code <http://gsb.freerock.org>
    Chip Cuccio <chipster@norlug.org>
    $Revision$
    $Date$
    $Author$
-->
<body>  
  
<?php include('content/header.html'); ?>
