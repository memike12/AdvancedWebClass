#!/usr/bin/perl
use strict; 
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );

print( "Content-type: text/xml; charset=UTF-8\n\n");

#connect to the database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m164488;host=cardhu.cs.usna.edu:3306;user=m164488;password=m164488");

#get the searched word
my $word = param("q");

#narrows down the result
my $query = "SELECT fname, FROM m164488.crewList LIKE '%$word%'";

#returns the result
while( my $line = $query) {
	print "$line";
	}

#disconnect the file
$databaseHandle->disconnect();
$statementHandle->finish();