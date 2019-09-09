#!/usr/bin/perl

use strict;
use warnings;

require AIPlayer;
require HumanPlayer;
use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

srand(10);

my $round = 1;

my $Arathorn = HumanPlayer->new('Arathorn');
my $Lapras = AIPlayer->new('Lapras');

print BLUE BOLD "*****BATTLE START*****\n";

#display initial info
print '#', $Arathorn->{'name'}, " hp: ", $Arathorn->{'hp'}, " dp: ", $Arathorn->{'dp'}, "\n";
print '#', $Lapras->{'name'}, " hp: ", $Lapras->{'hp'}, " dp: ", $Lapras->{'dp'}, "\n";


while(!$Arathorn->isDead() && !$Lapras->isDead()){
	print BLUE BOLD "*****Round $round*****\n";
	print MAGENTA $Arathorn->{"name"},"'s turn.\n";
	$Arathorn->attack($Lapras);
	
	if($Lapras->isDead()){
		last;
	}

	print MAGENTA $Lapras->{'name'}, "'s turn.\n";
	$Lapras->attack($Arathorn);

	print BRIGHT_BLACK "*****After Round ", $round,"*****\n";
	print '#', $Arathorn->{'name'}, " hp: ", $Arathorn->{'hp'}, " dp: ", $Arathorn->{'dp'}, "\n";
	print '#', $Lapras->{'name'}, " hp: ", $Lapras->{'hp'}, " dp: ", $Lapras->{'dp'}, "\n";

	$round++;
}

if($Arathorn->isDead()){
	print RED BOLD '*****', $Lapras->{"name"}, " wins!*****\n";
	print "#", $Lapras->{'name'}, "\n";
}else{
	print RED BOLD '*****', $Arathorn->{"name"}, " wins!*****\n";
	print "#", $Arathorn->{'name'}, "\n";
}
