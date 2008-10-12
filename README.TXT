
Welcome to GNOME SlackBuild 2.24.0!

GNOME SlackBuild v2.22.1 is a complete GNOME Desktop Environment for Slackware Linux v12.1, 
encompassing all the needed packages for a full, clean installation of GNOME for Slackware. It 
aims to provide a fully functional desktop, including a wide range of multimedia, graphics, 
and development tools, as well as a complete networking and office suite.  

Here are some versions of major components of GNOME SlackBuild 2.24.0

- Full GNOME Desktop     2.24.0
	- Evolution      2.24.0
	- NetworkManager 0.7svn
- PulseAudio		 0.9.13
- Mono C#		 2.0
- OpenOffice.org         2.4.1.10
- Compiz                 0.7.8
- GNOME Office
	- Abiword        2.6.4 
	- Gnumeric       1.8.3

For installation instructions, see the file 'INSTALL_GSB.TXT'

For instructions to upgrade from GSB 2.22.3 and previous versions to GSB 2.24.0, please see the
'UPGRADE.TXT'.  You would still be well advised to backup your machine first if it contains any important data.

For details of important changes between GSB 2.22.3 and GSB 2.24.0, see 'CHANGES_AND_HINTS.TXT'.

These are some of the important files and directories found on the GSB FTP site:

 <ftp://ftp.slackware.org.uk/gsb/gsb-2.24/>

.
|-- BUILDING.TXT		Instructions on how to build GSB from scratch
|-- CHECKSUMS.md5		MD5 format file checksums
|-- COPYING			The GNU Public License, version 2.
|-- COPYING3			The GNU Public License, version 3.
|-- CREDITS			A brief list of those who help with the GSB project.
|-- ChangeLog.txt		Log of system changes from GSB 2.22.3 to GSB 2.24.0.
|-- FILELIST.TXT		List of files on the GSB FTP site.
|-- INSTALL.TXT			Instructions on how to install GSB.
|-- REPLACED_PACKAGES.TXT	Packages in GSB that will replace standard Slackware packages.
|-- README.TXT			This file.
|-- UPGRADE.TXT			Instructions on how to upgrade from GSB 2.22.3.
|-- VERSIONS			Target versions for GSB 2.24.0.
|
|-- extra/			This directory contains extra packages for GSB like
|   | 				mozilla-firefox, and pidgin which, though they come
|   |				with Slackware 12.1, users may prefer to use our version.
|   |			
|   |-- README.TXT		Explanation of each extra package.
|   `-- packages/		Contains the *.tgz packages.
|
|-- gsb/			This directory contains all the software you will need
|   | 				for GSB 2.24.0.
|   `-- packages
|       |-- accessibility	Packages for accesibility in GNOME.
|       |-- administration	Packages for system administration.
|       |-- applications	Useful applications for your GNOME desktop.
|       |-- bindings		C++ and other bindings for GNOME libraries.
|       |-- compiz		Compiz-fusion for GNOME.
|       |-- desktop		Packages required for a basic GNOME desktop.
|       |-- devel		Development applications for GNOME.
|       |-- libraries		Base libraries for codecs, databases, and various dependencies.
|       |-- media		Audio and video applications for GNOME.
|       |-- metapackages	Our handy metapackages for easy installation.
|       |-- mono		Mono C# 2.0 packages.
|       |-- networking		Useful set of networking applications for GNOME.
|       |-- office		GNOME Office.
|       |-- ooo			OpenOffice.org 2.4.1.10.
|       |-- platform		Base GNOME libraries and dependencies, like PolicyKit.
|       |-- print		Handy applications for easy printing in GNOME.
|       |-- themes		Some extra themes for your GNOME desktop, like Mac4Lin.
|       `-- tools		System tools, like slapt-get, and cabextract.
|
|-- source			This directory contains source code for the packages that
|   |				are offered by the GSB project.  It doesn't contains any
|   |				source tarballs (as being too huge), but all the offical 
|   |				SlackBuilds used to build GSB, as well as slack-desc, 
|   |				slack-requireds, and any patches we use. For more information
|   |				about building GSB, please see the 'BUILDING_GSB.TXT'
|   |
|   |-- accessibility/		Source code for accessibility packages.
|   |-- administration/		Source code for administration packages.
|   |-- applications/		Source code for applications packages.
|   |-- bindings/		Source code for bindings packages.
|   |-- compiz/			Source code for compiz packages.
|   |-- desktop/		Source code for desktop packages.
|   |-- devel/			Source code for devel packages.
|   |-- extra/			Source code for packages in the extra/ directory.
|   |-- gsb.SlackBuild		Main script for building GSB.
|   |-- gsb.options.sample	Sample file for tweaking the gsb.SlackBuild script.
|   |-- libraries/		Source code for libraries packages.
|   |-- media/			Source code for media packages.
|   |-- metapackages/		Source code for metapackages.
|   |-- mono/			Source code for mono packages.
|   |-- networking/		Source code for networking packages.
|   |-- office/			Source code for office packages.
|   |-- ooo/			Source code for ooo packages.
|   |-- platform/		Source code for platform packages.
|   |-- print/			Source code for print packages.
|   |-- testing/		Source code for testing packages.
|   |-- themes/			Source code for themes packages.
|   `-- tools/			Source code for tools packages.
|
`-- testing/			This directory contains any packages we considered might
    |				be useful for some people, but didn't think stable enough
    |				to include in the GSB packages tree.
    |-- README.TXT		README about packages included in the testing/ dir.
    `-- packages

For more information about GNOME SlackBuild, please visit our website:

	http://gnomeslackbuild.org

Enjoy!

The GNOME SlackBuild Team
