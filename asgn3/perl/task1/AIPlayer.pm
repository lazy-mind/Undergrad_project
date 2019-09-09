# /⇤ CSCI3180 Principles of Programming Languages ⇤ --- Declaration ---
# ⇤ I declare that the assignment here submitted is original except for source ⇤ material explicitly acknowledged. I also acknowledge that I am aware of
# ⇤ University policy and regulations on honesty in academic work, and of the
# ⇤ disciplinary guidelines and procedures applicable to breaches of such policy ⇤ and regulations, as contained in the website
# ⇤ http://www.cuhk.edu.hk/policy/academichonesty/
# ⇤ Assignment 3
# ⇤ Name : Mao Yu Xuan
# ⇤ Student ID : 1155062018
# ⇤ Email Addr : yxmao5@cse.cuhk.edu.hk ⇤/

package AIPlayer;

use Player;
use strict;
use warnings;

our @ISA = qw(Player);

sub hitOrStand{
	# choose hit or stand, based on the AI's stratage
	my ($self) = shift;
	my ($hardValue, $numOfAce) = $self->getHardHandValue();
	my ($danger_point) = 21 - ($hardValue);
	if ($danger_point>=5){return 'h';}
	elsif ($danger_point<=4){return 's';}

	# my ($dealer_obj) = $self->{'dealer'};
	# # $self->whoIsDealer($dealer_obj);
	# my ($danger_prob) = $dealer_obj->calculate_prob($danger_point);
	# if($danger_prob > 0.5)
	# 	{return 'h';}
	# else 
	# 	{return 's';}
}

sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;