# /⇤ CSCI3180 Principles of Programming Languages ⇤ --- Declaration ---
# ⇤ I declare that the assignment here submitted is original except for source ⇤ material explicitly acknowledged. I also acknowledge that I am aware of
# ⇤ University policy and regulations on honesty in academic work, and of the
# ⇤ disciplinary guidelines and procedures applicable to breaches of such policy ⇤ and regulations, as contained in the website
# ⇤ http://www.cuhk.edu.hk/policy/academichonesty/
# ⇤ Assignment 3
# ⇤ Name : Mao Yu Xuan
# ⇤ Student ID : 1155062018
# ⇤ Email Addr : yxmao5@cse.cuhk.edu.hk ⇤/

package Player;

use Participant;
use Dealer;
use strict;
use warnings;

our @ISA = qw(Participant);

my $dealer;

sub setDealer{
	my ($self) = shift;
	$dealer = shift;
	$self->whoIsDealer($dealer);
}

sub whoIsDealer{
	my ($self, $dealer_obj) = @_;
	print "the dealer is : ";
	my $dealer_name = $dealer_obj->getName();
	print "$dealer_name\n";
}

sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;