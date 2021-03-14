#!C:/Perl/bin/perl -w


require "cgi-lib.pl";
use utf8;
use URI::Escape;

MAIN:
{
	&ReadParse(*input);
	$purchase=uri_unescape($input{'purchase'});
	open(FILE, ">purchase.txt");
	print FILE $purchase;
	close(FILE);
}