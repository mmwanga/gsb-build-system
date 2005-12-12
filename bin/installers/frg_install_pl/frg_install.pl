#!/usr/bin/perl

use warnings;
use strict;

my $frg_version   = '2.12.1';
my $gnome_version = '2.12.1';


################################################################################
#
# Config Variables

# empty command line arg variables.
my $install_type = "";
my $rcd          = "";
my $packages     = "";

# End variable declartions
#
################################################################################

################################################################################
#
# main()

# Parse command line args
foreach (@ARGV) {

  if ( m/^--rcd=(.+)$/ ){
    $rcd = $1;
    # check variable values

  }
  elsif ( m/^--packages=(.+)$/ ){
    $packages = $1;
    # package check values

  }
  elsif ( m/^--install=(.+)$/ ){
    $install_type = $1;
    # package check values

  }
  else {
    die "ERROR: {$_} is a bad cmdline arg\n";
  }
}


intro_message();


# end main()
#
################################################################################

################################################################################
#
# functions()

sub usage {

  $ARGV[0];

}

sub intro_message{

  print STDERR <<EOF;

********************************************************************************

  Installing Freerock GNOME $frg_version

  Featuring GNOME $gnome_version

EOF
}

# End functions()
#
################################################################################
#!/usr/bin/perl

use warnings;
use strict;

my $frg_version   = '2.12.1';
my $gnome_version = '2.12.1';


################################################################################
#
# Config Variables

# empty command line arg variables.
my $install_type = "";
my $rcd          = "";
my $packages     = "";

# End variable declartions
#
################################################################################

################################################################################
#
# main()

# Parse command line args
foreach (@ARGV) {

  if ( m/^--rcd=(.+)$/ ){
    $rcd = $1;
    # check variable values

  }
  elsif ( m/^--packages=(.+)$/ ){
    $packages = $1;
    # package check values

  }
  elsif ( m/^--install=(.+)$/ ){
    $install_type = $1;
    # package check values

  }
  else {
    die "ERROR: {$_} is a bad cmdline arg\n";
  }
}


intro_message();


# end main()
#
################################################################################

################################################################################
#
# functions()

sub usage {

  $ARGV[0];

}

sub intro_message{

  print STDERR <<EOF;

********************************************************************************

  Installing Freerock GNOME $frg_version

  Featuring GNOME $gnome_version

EOF
}

# End functions()
#
################################################################################
