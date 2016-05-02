#!/usr/bin/perl
use strict; use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

#this Prints out an XML page
print( "Content-type: text/xml; charset=UTF-8\n\n");

#Gets access to my database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m164488;host=cardhu.cs.usna.edu:3306;user=m164488;password=m164488");

#Get the info to save
my $fname = param("fname");
my $lname = param("lname");
my $boat = param("boat");
my $pos = param("position");
my $hs = param("homestate");

#This saves the data
my $query = "INSERT INTO m164488.crewList (fname, lname, boat, position, homestate) VALUES (?,?,?,?,?)";

my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute($fname, $lname, $boat, $pos, $hs); # put results into the DB

$databaseHandle->disconnect();
$statementHandle->finish();