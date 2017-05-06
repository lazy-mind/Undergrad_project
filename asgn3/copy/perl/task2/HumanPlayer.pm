# /⇤ CSCI3180 Principles of Programming Languages ⇤ --- Declaration ---
# ⇤ I declare that the assignment here submitted is original except for source ⇤ material explicitly acknowledged. I also acknowledge that I am aware of
# ⇤ University policy and regulations on honesty in academic work, and of the
# ⇤ disciplinary guidelines and procedures applicable to breaches of such policy ⇤ and regulations, as contained in the website
# ⇤ http://www.cuhk.edu.hk/policy/academichonesty/
# ⇤ Assignment 3
# ⇤ Name : Mao Yu Xuan
# ⇤ Student ID : 1155062018
# ⇤ Email Addr : yxmao5@cse.cuhk.edu.hk ⇤/

#!/usr/bin/perl
package HumanPlayer;

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

use Scalar::Util qw(looks_like_number);

use strict;
use warnings;

use Player;

our @ISA = qw(Player);

sub attack{
	my $self = shift;
	my $enermy = shift;
	$self->printAttackMethod();
	$self->chooseAttackMethod($enermy);
}

sub printAttackMethod{
	my $self = shift;
	print BRIGHT_BLACK "'s' to attack with sword (power: 800 hp)\n";
	print BRIGHT_BLACK "'b' to use black magic (power: 600 hp), extra effect: 40% chance to invoke another sword attack with power 1000 hp\n";
}

sub chooseAttackMethod{
	my $self = shift;
	my $enermy = shift;
	my $input = <STDIN>;
	chomp $input;
	while($input ne 's' && $input ne 'b'){
		print BRIGHT_RED "Invalid input, please input again!\n";
		print BRIGHT_BLACK "'s' to attack with sword (power: 800 hp)\n";
		print BRIGHT_BLACK "'b' to use black magic (power: 600 hp), extra effect: 40% chance to invoke another sword attack with power 1000 hp\n";
		$input = <STDIN>;
		chomp $input;
	}

	if($input eq 's'){
		$self->attackWithSword($enermy);
	}
	if($input eq 'b'){
		$self->useBlackMagic($enermy);
	}
}

sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;