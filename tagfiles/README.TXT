This is the set of tagfiles used when installing our build machines.  It is a
simple way to install a custom set of Slackware packages, with a restricted
selection in order to avoid unwanted dependencies (for example, accidently
linking against KDE or Qt.)

When installing Slackware, there will be an option to specify a set of tagfiles.
Simply point the installer to this directory, and the installation will then be
automated.

In addition to the packages listed in the tagfiles for each set, the following
packages from the extra/ directory are required for a full build of GSB:

   jdk yasm
