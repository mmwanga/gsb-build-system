<?php
/*

    Sidebar/menu PHP script
    Chip Cuccio <http://chip.cuccio.us>
    $Id: sidebar_inc.php 2865 2007-11-24 02:24:21Z chipster $

*/
?>
  <div id="side-bar">
    <div>
      <h2 class="sideBarTitle">Navigation:</h2>

      <ul>
        <?php if($op == "index" && (!strstr($_SERVER['REQUEST_URI'],"news"))) { ?>
        <li><a href="/" title="Home Page" class=
          "thisPage">Home</a></li><?php } else { ?>

        <li><a href="/" title="Home Page">Home</a></li><?php }
            if(strstr($_SERVER['REQUEST_URI'], "news")) { ?>

        <li><a href="/news/" title="News" class=
        "thisPage">News</a></li><?php } else { ?>

        <li><a href="/news/" title="News">News</a></li><?php }
            if($op == "about") { ?>

        <li><a href="/about/" title="About the Project" class=
        "thisPage">About</a></li><?php } else { ?>

        <li><a href="/about/" title="About the Project">About</a></li><?php }
            if($op == "screenshots") { ?>

        <li><a href="/screenshots/" title="Screenshots" class=
        "thisPage">Screenshots</a></li><?php } else { ?>

        <li><a href="/screenshots/" title=
        "Screenshots">Screenshots</a></li><?php }
            if ($op == "download") { ?>

        <li><a href="/download/" title="Download and Installation Info" class=
        "thisPage">Download &amp; Install</a></li><?php } else { ?>

        <li><a href="/download/" title=
        "Download and Installation Info">Download &amp; Install</a></li><?php }
            if ($op == "development") { ?>

        <li><a href="/development/" title="Development" class=
        "thisPage">Development</a></li><?php } else { ?>

        <li><a href="/development/" title=
        "Development">Development</a></li><?php }
            if ($op == "support") { ?>

        <li><a href="/support/" title="Support &amp; FAQs" class=
        "thisPage">Support / FAQs</a></li><?php } else { ?>

        <li><a href="/support/" title=
        "Support &amp; FAQs">Support / FAQs</a></li><?php } ?>

      </ul>
    </div>

  </div>
