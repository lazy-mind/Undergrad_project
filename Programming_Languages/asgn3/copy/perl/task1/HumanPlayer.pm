# /⇤ CSCI3180 Principles of Programming Languages ⇤ --- Declaration ---
# ⇤ I declare that the assignment here submitted is original except for source ⇤ material explicitly acknowledged. I also acknowledge that I am aware of
# ⇤ University policy and regulations on honesty in academic work, and of the
# ⇤ disciplinary guidelines and procedures applicable to breaches of such policy ⇤ and regulations, as contained in the website
# ⇤ http://www.cuhk.edu.hk/policy/academichonesty/
# ⇤ Assignment 3
# ⇤ Name : Mao Yu Xuan
# ⇤ Student ID : 1155062018
# ⇤ Email Addr : yxmao5@cse.cuhk.edu.hk ⇤/

package HumanPlayer;

use Player;
use strict;
use warnings;

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

use Scalar::Util qw(looks_like_number);

our @ISA = qw(Player);

sub hitOrStand{
	# choose hit or stand
	my ($self) = shift;
	
	print BRIGHT_BLACK "'h' to hit, 's' to stand\n";

	my $input = <STDIN>;
	chomp $input;
	while($input ne 'h' && $input ne 's'){
		print BRIGHT_RED "Invalid input, please input again!\n";
		print BRIGHT_BLACK "'h' to hit, 's' to stand\n";
		$input = <STDIN>;
		chomp $input;
	}
		
	while($input eq 'h'){
		# print "previous card:\n";
		# $a_player->displayHand();
		my ($choice) = 'h';
		return ('h');
		
		print BRIGHT_BLACK "'h' to hit, 's' to stand\n";
		$input = <STDIN>;
		chomp $input;
		while($input ne 'h' && $input ne 's'){
			print BRIGHT_RED "Invalid input, please input again!\n";
			print BRIGHT_BLACK "'h' to hit, 's' to stand\n";
			$input = <STDIN>;
			chomp $input;}
	}

	if($input eq 's'){
		my ($choice) = 's';
		return ('s');
	}
}



sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;