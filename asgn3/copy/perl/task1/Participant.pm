# /⇤ CSCI3180 Principles of Programming Languages ⇤ --- Declaration ---
# ⇤ I declare that the assignment here submitted is original except for source ⇤ material explicitly acknowledged. I also acknowledge that I am aware of
# ⇤ University policy and regulations on honesty in academic work, and of the
# ⇤ disciplinary guidelines and procedures applicable to breaches of such policy ⇤ and regulations, as contained in the website
# ⇤ http://www.cuhk.edu.hk/policy/academichonesty/
# ⇤ Assignment 3
# ⇤ Name : Mao Yu Xuan
# ⇤ Student ID : 1155062018
# ⇤ Email Addr : yxmao5@cse.cuhk.edu.hk ⇤/

use strict;
use warnings;
use Deck;

package Participant;

my @cards;

sub new{
	# Instantiate a Participant object with its name, and return this object.
	# print "&&&&&&&& @_ &&&&&&&&&&\n";
	my $class = shift;
	my $self = {
		name => shift,
	};
	bless $self,$class;
	return $self;
}

sub hit{
	my $self = shift;
	my $dealer = shift;
	my $a_card = $dealer->GiveACard($self);
	print $self->{'name'}," recieve a card"," $a_card\n";
	$self->getCard($a_card);
	print "Cards in hand: ";
	$self->displayHand;
	my ($hardValue, $numOfAce) = $self->getHardHandValue();
	if($numOfAce == 0){
		print "Total value: ",$hardValue," with ",$numOfAce," Ace.\n";
	}
	else{
		print "Total value: ",$hardValue,"(hard hand) with ",$numOfAce," Ace.\n";
	}
}

sub stand{
	my $self = shift;
	print $self->{'name'}," chooses to stand\n";
	print "Cards in hand: ";
	$self->displayHand;
	my ($hardValue, $numOfAce) = $self->getHardHandValue();
	if($numOfAce == 0){
		print "Total value: ",$hardValue," with ",$numOfAce," Ace.\n";
	}
	else{
		print "Total value: ",$hardValue,"(hard hand) with ",$numOfAce," Ace.\n";
	}
}

sub displayHand{
	#print all cards in the player's hand
	my $self = shift;
	# print "Cards in hand: ";
	foreach my $a_card (@{$self->{'cards'}}){
		print " ";
		print $a_card;
	}
	print "\n";
}

sub getHardHandValue{
	#array of 2 elements: (hardValue, numOfAce)
	my $self = shift;
	my $numOfAce = 0;
	my $hardValue = 0;
	foreach my $a_card (@{$self->{'cards'}}){
		if($a_card eq "A"){$numOfAce+=1;
		}
		$hardValue += $self->getCardValue($a_card);
	}
	return ($hardValue,$numOfAce);
}

sub getSoftHandValue{
	#array of 2 elements: (softValue, numOfAce)
	my $self = shift;
	my $numOfAce = 0;
	my $hardValue = 0;
	my $softValue = 0;
	my $numOfAceCount = 0;
	foreach my $a_card (@{$self->{'cards'}}){
		if($a_card eq "A"){$numOfAce+=1;
		}
		$hardValue += $self->getCardValue($a_card);
	}
	$softValue = $hardValue;
	while($numOfAce > 0){
		if($softValue>11){last;}
		else{
			$softValue+=10;
			$numOfAce-=1;
			$numOfAceCount+=1;
		}	
	}
	return ($softValue,$numOfAceCount);
}

sub getCardValue{
	my $self = shift;
	my $a_card = shift;
	if($a_card eq "J"){return 10;}
	elsif($a_card eq "10"){return 10;}
	elsif($a_card eq "Q"){return 10;}
	elsif($a_card eq "K"){return 10;}
	elsif($a_card eq "A"){return 1;}
	else{
		return (ord($a_card)-48);
	}
}

sub max_point{
	my $self = shift;
	my ($hardValue, $numOfAce) = $self->getHardHandValue();
	my ($softValue, $numOfAceCount) = $self->getSoftHandValue();
	if($hardValue>$softValue){
		return $hardValue;
	}
	else{
		return $softValue;
	}
}

sub dropAllCards{
	my ($self) =shift;
	my $item_num =0;
	foreach my $a_card (@{$self->{'cards'}}){
		$item_num+=1;
	}
	while($item_num>0){
		pop @{$self->{'cards'}};
		$item_num-=1;
	}
}

sub is_bust{
	my $self = shift;
	my ($hardValue, $numOfAce) = $self->getHardHandValue();
	if($hardValue >= 21){return 1;}
	else{return 0;}
}

sub getCard{
	my $self = shift;
	my $a_card = shift;
	push @{$self->{'cards'}}, $a_card;
}

sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;
