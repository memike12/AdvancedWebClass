#!/usr/bin/perl
use strict; use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

#this Prints out an XML page
print( "Content-type: text/xml; charset=UTF-8\n\n");

#Gets access to my database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m164488;host=cardhu.cs.usna.edu:3306;user=m164488;password=m164488");

#This prints out the entire database to an XML page
my $query = "SELECT fname, lname FROM m164488.crewList";

my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute(); # put results in a table

print "<nameList>\n";
while (my @row = $statementHandle->fetchrow_array) {
	print "	<crew>\n";
	print " 		<fname>$row[0]</fname>\n" ;
	print " 		<lname>$row[1]</lname>\n" ;
	print "	</crew>\n";
}
print "</nameList>\n";
$databaseHandle->disconnect();
$statementHandle->finish();