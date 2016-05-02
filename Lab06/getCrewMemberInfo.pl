#!/usr/bin/perl
use strict; use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

#this Prints out an XML page
print( "Content-type: text/xml; charset=UTF-8\n\n");

#Gets access to my database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m164488;host=cardhu.cs.usna.edu:3306;user=m164488;password=m164488");
my $c_id = param("fname");

#This prints out the entire database to an XML page
my $query = "SELECT * FROM m164488.crewList WHERE fname = ?";

my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute($c_id); # put results in a table

print "<crewList>\n";
while (my @row = $statementHandle->fetchrow_array) {
	print "	<crew>\n";
	print " 		<fname>$row[1]</fname>\n" ;
	print " 		<lname>$row[2]</lname>\n" ;
	print " 		<boat>$row[3]</boat>\n" ;
	print " 		<position>$row[4]</position>\n" ;
	print " 		<homestate>$row[5]</homestate>\n" ;
	print "	</crew>\n";
}
print "</crewList>\n";
$databaseHandle->disconnect();
$statementHandle->finish();