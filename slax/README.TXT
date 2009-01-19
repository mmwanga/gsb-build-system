
Welcome to GNOME SlackBuild 2.24.2 for Slax!

For a quick guide to getting started, please see our HOWTO.TXT.

GNOME SlackBuild v2.24.2 is a complete GNOME Desktop Environment for 
Slax Linux-Live 6.0.9., encompassing all the needed packages for a full, 
clean installation of GNOME for Slax. It aims to provide a fully 
functional desktop, including a wide range of multimedia, graphics, and 
development tools, as well as a complete networking and office suite.  

Here are some versions of major components of GNOME SlackBuild 2.24.0
  - Full GNOME Desktop     2.24.2
  - Evolution              2.24.2
  - NetworkManager         0.7.0
  - PulseAudio		   0.9.13
  
For installation instructions and on how to use the GSB Slax Modules, 
see the file 'README.TXT'

These are some of the important files and directories found on the GSB 
FTP site:

 <ftp://ftp.slackware.org.uk/gsb/gsb-2.24/slax/>

.
|-- README.TXT		        Instructions on how to use GSB Slax Modules.
|
|-- MODULES.TXT                 This file.
|
|-- REQUIRED_MODULE.TXT         Contains a list of official Slackware packages which
|                               are found in the gsb.required module.
|
|-- CHECKSUMS.md5		MD5 format file checksums
|
|-- FILE_LIST                   List of all the files available in the 
|                               slax/ directory.
|
`-- modules			Contains all the GSB Moduels for Slax.
   |
   |-- 000-gsb.required-2.24.2-i486-1gsb.lzm
   |                           
   |                            The required module contains official Slackware
   |                            packages that are external dependencies to the GSB
   |                            project, but which are not available in a vanilla
   |                            Slax install.  For a list of which packages are 
   |                            contained in it, see the REQUIRED_MODULE.TXT file.
   | 
   |-- 001-gsb.base-2.24.2-i486-1gsb.lzm
   |
   |                            This is the main GSB Slax Module. It
   |                            contains only the runtime libraries and 
   |                            binaries required to use GSB in Slax. 
   |                            It doesn't contain any development 
   |                            related files (like headers, etc) or any 
   |                            documentation (such as man pages)
   |
   |-- 001-gsb.base_devel-2.24.2-i486-1gsb.lzm
   |
   |                            This is the module which contains the 
   |                            header and developement related files  
   |                            which go along with the main gsb.lzm 
   |                            module.
   |
   `-- 001-gsb.base_devel-2.24.2-i486-1gsb.lzm

                                This module contains all the documentation and
                                help files for the applications which are found 
                                in the gsb.lzm module.



For more information about GNOME SlackBuild, please visit our website:

	http://gnomeslackbuild.org

Enjoy!

The GNOME SlackBuild Team
