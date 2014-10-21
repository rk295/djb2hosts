#!/usr/bin/perl -w
# 
# This takes a input file in the tinydns zone format
# and outputs a /etc/hosts file format file
#
# Currently supports A and CNAME records, ignoring 
# DNS, MX and all other lines
#
# Tiny dns format documented here
# 
# http://cr.yp.to/djbdns/tinydns-data.html
#

use strict;
use Data::Dumper;

my %output = ();

while(<>){
	
	chomp;

	next if (/^\s*$/);
	next if (/^#/);

	my $op          = substr($_,0,1);
	my ($data, $ip) = split(':',substr($_,1));

	if ( $op eq "." ){

		print STDERR "found a NS/SOA line, ignoring\n";
		next;

    }elsif ( $op eq "=" || $op eq "+" || $op eq "@" ){

        print STDERR "found an A, CNAME or an MX record - $data\n";
        my @parts = split('\.', $data);
        my $line = $data . " " . $parts[0] . "." . $parts[1] . " " . $parts[0] . " ";
        $output{$ip} .= $line;
        next;

	}else{

		print "found something I didnt expect:\n";
		print "$_\n";
		next;

	}

}

foreach (keys %output) {
	print sprintf("%-20s %s\n",$_, $output{$_});
}
