#!/usr/bin/env perl
#
# Usage: perl extract_changes.pl CHANGELOG.md v0.1.0.2
# Extraction script to get changes matching a given version
# from the changelog.
# Only used by the continuous release workflow.

use strict;
use warnings;
use v5.10;

# Prepare changelog file
my $file = shift @ARGV or die "no changelog file name provided!\n";
open my $fh, '<', $file   or die "changelog file not readable!\n";

# Prepare version string
my $version = shift @ARGV or die "no version string provided!\n";
$version    =~ s/^v//;

# Extract changes inbetween our version and the next version
while (<$fh>) {
  print if /^## $version / ... /^## / and not /^##/;
}
