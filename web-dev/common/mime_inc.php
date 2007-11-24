<?php
$charset = "utf-8";
$mime = "text/html";
function fix_code($buffer) {
    return (preg_replace("!\s*/>!", ">", $buffer));
}
if(stristr($_SERVER["HTTP_ACCEPT"],"application/xhtml+xml")) {
    if(preg_match("/application\/xhtml\+xml;q=([01]|0\.\d{1,3}|1\.0)/i",
        $_SERVER["HTTP_ACCEPT"],$matches)) {
        $xhtml_q = $matches[1];
        if(preg_match("/text\/html;q=q=([01]|0\.\d{1,3}|1\.0)/i",
            $_SERVER["HTTP_ACCEPT"],$matches)) {
            $html_q = $matches[1];
            if((float)$xhtml_q >= (float)$html_q) {
                $mime = "application/xhtml+xml";
            }
        }
    } else {
        $mime = "application/xhtml+xml";
    }
}

// validators always get XHTML mime-types
if(stristr($_SERVER["HTTP_USER_AGENT"],"Validator")) {
    $mime = "application/xhtml+xml";
}

if($mime == "application/xhtml+xml") {
    $prolog_type = "<?xml version=\"1.0\" encoding=\"$charset\"?>
<!DOCTYPE html PUBLIC
  \"-//W3C//DTD XHTML 1.1 plus MathML 2.0 plus SVG 1.1//EN\"
  \"http://www.w3.org/2002/04/xhtml-math-svg/xhtml-math-svg.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\">";
} else {
    ob_start("fix_code");
        $prolog_type = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"
  \"http://www.w3.org/TR/html4/strict.dtd\">
<html lang=\"en\">";
}
header("Content-Type: $mime;charset=$charset");
header("Vary: Accept");
print $prolog_type;
?>

