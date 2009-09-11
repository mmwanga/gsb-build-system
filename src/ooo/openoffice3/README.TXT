The GNOME SlackBuild project uses go-oo (go-oo.org) as the basis for building
Openoffice.org. go-oo supplies milestone source balls in additional to
supplementary software used by openoffice (like mdbtools).  

On Slackware 13.0, boost contains a bug in the function_template.hpp.  You will
need to apply the boost patch found in this directory in order to compile
openoffice. 
