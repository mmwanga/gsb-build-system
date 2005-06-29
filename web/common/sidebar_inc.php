<?php
/*

    Sidebar/menu PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id: sidebar_inc.php 703 2005-06-26 02:39:11Z chipster $

*/
?>
  <div id="side-bar">
    <div>
      <h2 class="sideBarTitle">Navigation:</h2>

      <ul>
<?php if($QUERY_STRING == "") { ?>
        <li><a href="/" title="Home Page" class="thisPage">Home</a></li>
<?php } else { ?>
        <li><a href="/" title="Home Page">Home</a></li>
<?php }
    if(strstr($QUERY_STRING, "news")) { ?>
        <li><a href="/news/" title="News" class="thisPage">News</a></li>
<?php } else { ?>
        <li><a href="/news/" title="News">News</a></li>
<?php }
    if(strstr($QUERY_STRING, "about")) { ?>
        <li><a href="/about/" title=
          "About the GSB Project" class="thisPage">About GSB</a></li>
<?php } else { ?>
        <li><a href="/about/" title=
          "About the GSB Project">About GSB</a></li>
<?php }
    if (strstr($QUERY_STRING, "faqs")) { ?>
        <li><a href="/faqs/" title=
          "Frequently-asked Questions" class="thisPage">FAQs</a></li>
<?php } else { ?>
        <li><a href="/faqs/" title=
          "Frequently-asked Questions">FAQs</a></li>
<?php }
    if(strstr($QUERY_STRING, "screenshots")) { ?>
        <li><a href="/screenshots/" title=
          "Screenshots" class="thisPage">Screenshots</a></li>
<?php } else { ?>
        <li><a href="/screenshots/" title=
          "Screenshots">Screenshots</a></li>
<?php }
    if (strstr($QUERY_STRING, "download")) { ?>
        <li><a href="/download/" title=
          "Download" class="thisPage">Download</a></li>
<?php } else { ?>
        <li><a href="/download/" title=
          "Download">Download</a></li>
<?php }
    if (strstr($QUERY_STRING, "changelog")) { ?>
        <li><a href="/changelog/" title=
           "ChangeLogs" class="thisPage">ChangeLogs</a></li>
<?php } else { ?>
        <li><a href="/changelog/" title=
          "ChangeLogs">ChangeLogs</a></li>
<?php }
    if (strstr($QUERY_STRING, "installation")) { ?>
        <li><a href="/installation/" title=
          "Installation Instructions" class=
          "thisPage">Installation</a></li>
<?php } else { ?>
        <li><a href="/installation/" title=
          "Installation Instructions">Installation</a></li>
<?php }
    if (strstr($QUERY_STRING, "roadmap")) { ?>
        <li><a href="/roadmap/" title="Roadmap"
          class="thisPage">Roadmap</a></li>
<?php } else { ?>
        <li><a href="/roadmap/" title=
          "Roadmap">Roadmap</a></li>
<?php }
    if (strstr($QUERY_STRING, "development")) { ?>
        <li><a href="/development/" title="Development"
          class="thisPage">Development</a></li>
<?php } else { ?>
        <li><a href="/development/" title=
          "Development">Development</a></li>
<?php }
    if (strstr($QUERY_STRING, "support")) { ?>
        <li><a href="/support/" title="Support"
          class="thisPage">Support</a></li>
<?php } else { ?>
        <li><a href="/support/" title="Support">Support</a></li>
<?php }
    if (strstr($QUERY_STRING, "help")) { ?>
        <li><a href="/help/" title="Help the Project"
          class="thisPage">Help the Project</a></li>
<?php } else { ?>
        <li><a href="/help/" title="Help the Project">Help the
          Project</a></li>
<?php }
    if (strstr($QUERY_STRING, "links")) { ?>
        <li><a href="/links/" title="Relevant Links"
          class="thisPage">Links</a></li>
<?php } else { ?>
        <li><a href="/links/" title="Relevant Links">Links</a></li>
<?php } ?>
        <li><a href="http://sourceforge.net/projects/gsb"
          title="SourceForge.net Project Page">Project Page</a></li>
      </ul>
    </div>
    <div>
      <h2 class="sideBarTitle">Sponsors:</h2>

      <ul>
        <li><a href="http://www.datapipe.net"
        title="Datapipe graciously provides the official mirror for GSB/FRG packages and ISOs">DataPipe Managed Hosting Services</a></li>
        <li><a href="http://sourceforge.net/donate/?group_id=130126"
        class="imglink"><img src="/images/project-support.jpg"
        alt="Donate to this project" /></a></li>
        <li><a href="http://sourceforge.net?group_id=130126"
        title="Project supported by SourceForge.net" class=
        "imglink"><img src="/images/sf_logo.png" alt=
        "SourceForge.net Logo" /></a>
        </li>
      </ul>
    </div>
  </div>

