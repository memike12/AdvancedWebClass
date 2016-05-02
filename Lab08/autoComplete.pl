#!/usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use DBI; use DBD::mysql;


print "Content-Type: text/plain; charset=UTF-8\n\n";

#Gets access to my database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m164488;host=cardhu.cs.usna.edu:3306;user=m164488;password=m164488");

#This prints out the first names from database to an XML page 
my $query = "SELECT fname FROM m164488.crewList Like '%search%' ";

my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute(); # put results in a table

open(IN,"search.txt") || die "Cannot open search.txt ($!)\n";
while( my $line = <IN> ) {
print "$line";
}
close IN;
