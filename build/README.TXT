New trial build system  
-----------------------

See our set of tagfiles in tagfiles/ for an idea of needed packages for build
machine.  Further build requirements are found in the REQUIRED_PACKAGES found
at the top of the buildgsb script.  

NOTE: The buildgsb script builds and installs the REQUIRED_PACKAGES, but does
not put them in the build tree.  These packages are only required for building,
not runtime use.  

NOTE 2:  The jdk package is found in the extra/ directory in Slackware.  You
will need to add this as a separate SOURCE= line in your slapt-getrc.

Building with the new system
----------------------------

1.  Make sure to have a sane gsb.options file.  You can use our
gsb.options.sample to begin.  Copy it over to gsb.options and then modify
according to your system.

2.  Run:
  $ ./buildgsb

  It will download source files on the fly, md5sum check, and then build the
package.  All package information is kept in the .info files found in each
package directory.  If you want to upgrade versions, you will need to modify
both the .info and .SlackBuild file for the package.

Running into dependency problems
----------------------------------

If packages complain of missing dependencies, they may be in another set.  For
example, if a package requires 'setuptools', you will need to manually build a
partial 'd' set before continuing.  You can do so by

  $ ./buildgsb -set=d

At the moment, the new build script doesn't automatically resolve and build
dependencies;  we will be adding this in to future versions of the build
script.  However, manual monitoring isn't too inconvenient.  :^)

More information about the buildgsb script can be found by 

  $ ./buildgsb --help.

The flags --publish and --export-source are only really needed if you want to
create a publicly available repository for use with slapt-get.  If you use
--publish, you will need to supply a custom GPG-KEY in order to sign your
packages.  Take a look at the buildgsb and functions.sh for details about the
signing procedure.


Todo
----
  * Improve verification logic for extra/, pasture/ and testing/
  * Add switch for building specific packages for dependency following.
