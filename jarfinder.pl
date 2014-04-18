#!/usr/bin/perl

use Cwd;
use strict;
use warnings;

my $pwd = cwd();
my $token = $ARGV[0];

print "looking for $token\n";

opendir (DIR, $pwd) or die $!;

while(my $file = readdir(DIR)) {
    if($file =~ /\.jar$/) {
	print "examining $file ...\n";
	my $result = `jar -tvf $file | grep $token`;
	if($result ne '') { 
	    print "$file: $result\n";
	}
    }

}
