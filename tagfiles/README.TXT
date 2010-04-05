This is the set of tagfiles to be used when installing build machines.  

The tagfiles are a simple way to install a custom set of Slackware packages
best suited to building GSB without accidently including extra dependancies
or libraries in the finished product (ie, ./configure picking up QT or KDE
and linking against them just because they are there).

To use these tagfiles, you will need to make them available during the initial
installation of Slackware (an NFS mount is very handy for this).  During
installation, you will be presented with a menu to select the type of install
to be performed (full, expert, etc), at which point you can select 'tagpath'
and specify the location for these tagfiles - the installation will then
proceed; installing only the packages required for the build.

In addition to the packages listed in the tagfiles for each set, the following
packages from the extra/ directory are required for a full build of GSB:
    * jdk
    * qt3
    * yasm
