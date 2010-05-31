
Welcome to GNOME SlackBuild 2.30.0!

GNOME SlackBuild v2.30.0 is a complete GNOME Desktop Environment for 
Slackware Linux 13.1, encompassing all the needed packages for a full, 
clean installation of GNOME for Slackware. It aims to provide a fully 
functional desktop, including a wide range of multimedia, graphics, 
and development tools, as well as a complete networking and office suite.  

Here are some versions of major components of GNOME SlackBuild 2.30.0

- Full GNOME Desktop    2.30.0
- Evolution             2.30.0
- NetworkManager        0.8
- Mono C#               2.6.4
- OpenOffice.org        3.2.0.10
- Compiz                0.8.6
- Abiword               2.8.4 
- Gnumeric              1.10.2

For installation instructions, see the file 'INSTALL.TXT'

For instructions to upgrade from GSB 2.30.0 and previous versions to GSB 2.30.0
for Slackware 13.1, please see the 'UPGRADE.TXT'.  You would still be well
advised to backup your machine first if it contains any important data.

For details of important changes between GSB 2.26.3 and GSB 2.30.0 for
Slackware 13.1, see 'CHANGES_AND_HINTS.TXT'.

These are some of the important files and directories found on the GSB 
FTP site:

 <ftp://ftp.slackware.org.uk/gsb/gsb-2.30_slackware-13.1/>

.
|-- CHECKSUMS.md5       MD5 format file checksums
|-- CHECKSUMS.md5.asc   MD5 format file checksums, signed with gpg
|-- COPYING             The GNU Public License, version 2.
|-- COPYING3            The GNU Public License, version 3.
|-- COPYRIGHT.TXT       A list copyrights used by the GNOME SlackBuild
|                       project.
|-- CREDITS             A brief list of those who help with the 
|                       GSB project.
|-- ChangeLog.txt       Log of system changes from GSB 2.24.3 
|                       to GSB 2.30.0.
|-- FILELIST.TXT        List of files on the GSB FTP site.
|-- INSTALL.TXT         Instructions on how to install GSB.
|-- FAQ.TXT             A list of questions commonly asked about GNOME or the 
|                       GSB project. 
|
|-- SLACKWARE_REPLACED_PACKAGES.TXT
|                       Packages in GSB that will replace the standard 
|                       Slackware packages.
|-- README.TXT          This file. :-)
|-- UPGRADE.TXT         Instructions on how to upgrade from GSB 2.28.3.
|-- VERSIONS            Target versions for GSB 2.30.0.
|
|-- extra/              This directory contains extra packages 
|   |                   for GSB like MPlayer and pidgin which though
|   |                   they come with Slackware 13.1 users may prefer
|   |                   prefer to use our verion.
|   |			
|   `-- source/         Source code for the extra packages.
|
|-- gsb/                This directory contains all the 
|   |                   software you will need for GSB 2.30.0.
|   |-- a	        The A (base) package series.
|   |-- ac  	        The AC (accessibility) series.
|   |-- ad              The AD (administration) series.
|   |-- ap              The AP (applications) series.
|   |-- c	        The C (compiz) series.
|   |-- d	        The D (development) series.
|   |-- l	        The L (libraries) series.
|   |-- m	        The M (mono C#) series.
|   |-- n	        The N (networking) series.
|   |-- go              The GO (gnome office) series.
|   |-- ooo             The OOO (openoffice.org) series.
|   `-- t	        The T (themes) series.
|
|-- pasture/            These are packages that have been removed
|   |                   from GNOME SlackBuild, but are useful enough to
|   |                   keep around.  Might not be secure.
|   |
|   |                   Packages currently found here include:
|   |
|   `-- source/         Source code for the pasture packages.
|
|-- source              This directory contains source code for the 
|   |                   packages that are offered by the GSB project.  
|   |                   It doesn't contains any	source tarballs (as 
|   |                   being too huge), but all the offical 
|   |                   SlackBuilds used to build GSB, as well as 
|   |                   slack-desc, slack-requireds, and any patches we 
|   |                   use. For more information about building GSB, 
|   |                   please see the 'BUILDING.TXT'
|   |
|   |-- README.TXT      A basic HOWTO to use our source SlackBuilds.
|   |-- a/              Source code for desktop packages.
|   |-- ac/             Source code for accessibility packages.
|   |-- ad/             Source code for administration packages.
|   |-- ap/             Source code for applications packages.
|   |-- c/              Source code for compiz packages.
|   |-- d/              Source code for development packages.
|   |-- l/              Source code for libraries packages.
|   |-- m/              Source code for mono packages.
|   |-- n/              Source code for networking packages.
|   |-- go/             Source code for office packages.
|   |-- ooo/            Source code for Openoffice packages.
|   `-- t/              Source code for themes packages.
|
`-- testing/            This directory contained packages being tested
                        for possible use in future versions of GSB.
                        As the additions will not be part of GSB the 
                        directory is shipped empty.  The new features will 
                        continue development in the next gsb-current, 
                        possibly to be merged into the main tree for the
                        next GSB cycle.

For more information about GNOME SlackBuild, please visit our website:

	http://gnomeslackbuild.org

Enjoy!

The GNOME SlackBuild Team
