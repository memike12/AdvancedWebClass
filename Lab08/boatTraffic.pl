#!/usr/bin/perl
use strict; use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;


my $result;
my $URL = "http://data.aishub.net/ws.php?username=TRIAL_A45F&format=1&output=xml&compress=0&latmin=38.32&latmax=39&lonmin=-76.72&lonmax=-76.04";
# Get the XML document and send it back to the client (unchanged!)
my $contents = get($URL);
print $contents;
