<?php
/*

    Footer PHP script
    Chip Cuccio <chipster@norlug.org>
    $Id$

*/
?>
  <div id="footer">
    <br class="doNotDisplay doNotPrint" />

    <div class="left">
      <strong>[ <a href="#top">Back to Top ^</a> ]</strong><br />
      [ <a href="http://validator.w3.org/check?uri=http://<?php
      print("$SERVER_NAME"."$REQUEST_URI"); ?>"
      class="footLink">Valid XHTML 1.0 Strict</a>&nbsp;|&nbsp;<a href=
      "http://jigsaw.w3.org/css-validator/validator?uri=http://<?php
      print("$SERVER_NAME"."$REQUEST_URI"); ?>"
      class="footLink">Valid CSS2</a> ]
    </div>
    <div class="right">
      <address>
        Linux&reg; is a registered trademark of <a href=
        "http://www.linuxmark.org">Linus Torvalds</a><br />
        Slackware&reg; is a registered trademark of <a href=
        "http://slackware.com/trademark/trademark.php">Patrick
        Volkerding</a>
      </address>
    </div>
  </div>
</body>
</html>

