
Welcome to GNOME SlackBuild 2.24.2 for Slax!

For a quick guide to getting started, please see our HOWTO.TXT.

GNOME SlackBuild v2.22.2 is a complete GNOME Desktop Environment for 
Slackware Linux v12.1, encompassing all the needed packages for a full, 
clean installation of GNOME for Slackware. It aims to provide a fully 
functional desktop, including a wide range of multimedia, graphics, and 
development tools, as well as a complete networking and office suite.  

Here are some versions of major components of GNOME SlackBuild 2.24.0
  - Full GNOME Desktop     2.24.2
  - Evolution              2.24.2
  - NetworkManager         0.7rc2
  - PulseAudio		   0.9.13
  
For installation instructions and on how to use the GSB Slax Modules, 
see the file 'README.TXT'

These are some of the important files and directories found on the GSB 
FTP site:

 <ftp://ftp.slackware.org.uk/gsb/gsb-2.24/slax/>

.
|-- README.TXT		        Instructions on how to use GSB Slax Modules.
|-- MODULES.TXT                 This file.
|-- CHECKSUMS.md5		MD5 format file checksums
|-- FILE_LIST                   List of all the files available in the 
|                               slax/ directory.
|
`-- modules			Contains all the GSB Moduels for Slax.
   |
   |-- python-2.5.2-i486-1.lzm  Required Slax python module.
   | 
   |-- 001-gsb.lzm              This is the main GSB Slax Module. It
   |                            contains only the runtime libraries and 
   |                            binaries required to use GSB in Slax. 
   |                            It doesn't contain any development 
   |                            related files (like headers, etc) or any 
   |                            documentation (such as man pages)
   |
   |-- 002-gsb-devel.lzm        This is the module which contains the 
   |                            header and developement related files  
   |                            which go along with the main gsb.lzm 
   |                            module.
   |
   `-- 003-gsb-docs.lzm         This module contains all the 
                                documentation for applications
                                which are found in the gsb.lzm module.

For more information about GNOME SlackBuild, please visit our website:

	http://gnomeslackbuild.org

Enjoy!

The GNOME SlackBuild Team
