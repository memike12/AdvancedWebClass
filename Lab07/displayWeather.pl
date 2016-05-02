#!/usr/bin/perl

use strict;
use warnings;
print "Content-type: text/xml\n\n";

my $ua = LWP::UserAgent->new();
my $method = "POST";
my $url = "http://api.flickr.com/services/soap/";

my $cdata = join('', <DATA>);

my $tags = param("tags");
my $content = "
<s:Envelope
	xmlns:s='http://www.w3.org/2003/05/soap-envelope'
	xmlns:xsi='http://www.w3.org/1999/XMLSchema-instance'
	xmlns:xsd='http://www.w3.org/1999/XMLSchema'>
	<s:Body>
		<x:FlickrRequest xmlns:x='urn:flickr'>
			<method>flickr.photos.search</method>
			<name>value</name>
			<tags>$tags</tags>
			<privacy_filter>1</privacy_filter>
			<per_page>5</per_page>
			<api_key>83ec7bab1628defd47d893288348fee5</api_key>
		</x:FlickrRequest>
	</s:Body>
</s:Envelope>
";

while ($cdata =~ s/<!\[CDATA\[(.*?)\]\]>/$1/ms)
{
    print "cdata = $1\n";
}

__DATA__
<?xml version="1.0" encoding="UTF-8" ?> 
<![CDATA[This is the first cdata]]>
<![CDATA[This is the second cdata]]>