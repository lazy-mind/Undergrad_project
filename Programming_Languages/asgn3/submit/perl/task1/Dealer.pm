# /⇤ CSCI3180 Principles of Programming Languages ⇤ --- Declaration ---
# ⇤ I declare that the assignment here submitted is original except for source ⇤ material explicitly acknowledged. I also acknowledge that I am aware of
# ⇤ University policy and regulations on honesty in academic work, and of the
# ⇤ disciplinary guidelines and procedures applicable to breaches of such policy ⇤ and regulations, as contained in the website
# ⇤ http://www.cuhk.edu.hk/policy/academichonesty/
# ⇤ Assignment 3
# ⇤ Name : Mao Yu Xuan
# ⇤ Student ID : 1155062018
# ⇤ Email Addr : yxmao5@cse.cuhk.edu.hk ⇤/

package Dealer;

use strict;
use warnings;

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

use Scalar::Util qw(looks_like_number);

use Participant;
use Deck;

# inherits from the participant class
our @ISA = qw(Participant);

my @players;
my $deck;

sub new{
	#this will overrid the participant constructor, taking 2 arugments: name & player
	my $class = shift;
	my $self = {
		name => shift,
		players => shift,
	};
	$deck = Deck->new();
	$deck->shuffle();
	bless $self,$class;
	#deck->shuffle();
	return $self;
}

sub start{
	# start a new game
	my ($self) = @_;
	
	#distribute card to each participant
	$self->GiveCards();

	#each player finish its session one by one
	foreach my $a_player (@{$self->{'players'}}){
		$self->playerSession($a_player);
	}

	#dealer finish its own session
	$self->DealerSession();

	#judge who win the game
	$self->TellResult();
}

sub reset{
	# reset before start the game
	my ($self) = shift;
	foreach my $a_player (@{$self->{'players'}}){
		$a_player->dropAllCards();
	}
	$self->dropAllCards();
	$deck = Deck->new();
	$deck->shuffle();

}

sub GiveACard{
	my ($self) = shift;
	my ($a_player) = shift;
	return $deck->fetchOneCardFromTop();
}

sub GiveCards{
	my ($self) = @_;
	print "Deal two cards to all players\n";
	print "Cards in all players' hand.\n";

	#give card to players
	foreach my $a_player (@{$self->{'players'}}){
		print "Player ",($a_player->{'name'}),"\n";
		my $a_card = $deck->fetchOneCardFromTop();
		$a_player->getCard($a_card);
		$a_card = $deck->fetchOneCardFromTop();
		$a_player->getCard($a_card);
		$a_player->displayHand();
		my ($hardValue, $numOfAce) = $a_player->getHardHandValue();
		if($numOfAce == 0){
			print "Total value: ",$hardValue," with ",$numOfAce," Ace.\n";
		}
		else{
			print "Total value: ",$hardValue,"(hard hand) with ",$numOfAce," Ace.\n";
		}
	}

	#give card to dealer
	print "Dealer ",($self->{'name'}),"\n";
	my $a_card = $deck->fetchOneCardFromTop();
	$self->getCard($a_card);
	$a_card = $deck->fetchOneCardFromTop();
	$self->getCard($a_card);
	$self->displayHand();
	my ($hardValue, $numOfAce) = $self->getHardHandValue();
	if($numOfAce == 0){
		print "Total value: ",$hardValue," with ",$numOfAce," Ace.\n";
	}
	else{
		print "Total value: ",$hardValue,"(hard hand) with ",$numOfAce," Ace.\n";
	}
	print "\n";
}

sub playerSession{
	my ($self) = shift;
	my ($a_player) = shift;

	print BRIGHT_BLUE "*****Player ",($a_player->{'name'}),"'s turn.*****\n";
	my ($playerIsBust) = 0;
	while( $playerIsBust == 0){

		my ($softValue, $numOfAceCount) = $a_player->getSoftHandValue();
		if($softValue == 21){last;}

		my ($choice) = $a_player->hitOrStand();

		if($choice eq  'h'){
			$a_player->hit($self);
		}
		else{
			$a_player->stand();
			last;
		}

		$playerIsBust = $a_player->is_bust();

	}
	if ($playerIsBust==1){
		print BRIGHT_RED "Player ",($a_player->{'name'})," is busting\n";
		$a_player->displayHand();
		my ($hardValue, $numOfAce) = $a_player->getHardHandValue();
		if($numOfAce == 0){
			print "Total value: ",$hardValue," with ",$numOfAce," Ace.\n";
		}
		else{
			print "Total value: ",$hardValue,"(hard hand) with ",$numOfAce," Ace.\n";
		}
	}
	print "\n";
}

sub DealerSession{
	my ($self) = shift;
	print BRIGHT_BLUE "*****Dealer ",($self->{'name'}),"'s turn.*****\n";
	my ($hardValue, $numOfAce) = $self->getHardHandValue();

	while( $hardValue < 17 ){
		$self->hit($self);
		($hardValue, $numOfAce) = $self->getHardHandValue();
		print $hardValue,"\n";
	}

	my $dealerIsBust = $self->is_bust();
	if ($dealerIsBust==1){
		print BRIGHT_RED "Dealer ",($self->{'name'})," is busting\n";
		$self->displayHand();
		my ($hardValue, $numOfAce) = $self->getHardHandValue();
		if($numOfAce == 0){
			print "Total value: ",$hardValue," with ",$numOfAce," Ace.\n";
		}
		else{
			print "Total value: ",$hardValue,"(hard hand) with ",$numOfAce," Ace.\n";
		}

	}
}

sub TellResult{
	my ($self) = shift;
	# tell each player's score
	foreach my $a_player (@{$self->{'players'}}){
		print "#",($a_player->{'name'});
		$a_player->displayHand();
	}
	print "#",($self->{'name'});
	$self->displayHand();
	print "Winner between dealer and each player:\n";
	print "#";

	# tell who wins
	my $firstone = 0;
	my $dealerIsBust = $self->is_bust();
	if ($dealerIsBust==1){
		foreach my $a_player (@{$self->{'players'}}){
			$firstone+=1;
			if($firstone==1){
				if($a_player->is_bust() == 0){print $a_player->{'name'};}
				else{print $self->{'name'};}
			}
			else{
				if($a_player->is_bust() == 0){print " ",$a_player->{'name'};}
				else{print " ",$self->{'name'};}
			}
		}
		print "\n";
	}
	else{
		foreach my $a_player (@{$self->{'players'}}){
			$firstone+=1;
			if($a_player->max_point() > $self->max_point()){
				if($a_player->is_bust() == 0){
					if($firstone==1){print $a_player->{'name'};}
					else{print " ",$a_player->{'name'};}
				}
				else{
					if($firstone==1){print $self->{'name'};}
					else{print " ",$self->{'name'};}
				}
			}
			else{
				if($firstone==1){print $self->{'name'};}
				else{print " ",$self->{'name'};}
			}
		}
		print "\n";
	}
}

sub calculate_prob{
	my ($self) = shift;
	my ($point) = shift;
	my ($total) = ($point) * 4;
	foreach my $a_player (@{$self->{'players'}}){
		foreach my $a_card (@{$a_player->{'cards'}}){
			my ($card_value) = $a_player->getCardValue($a_card);
			if ($card_value <= $point){
				$total -= 1;
			} 
		}
	}

	foreach my $a_card (@{$self->{'cards'}}){
		my ($card_value) = $self->getCardValue($a_card);
		if ($card_value <= $point){
			$total -= 1;
		} 
	}

	my ($prob) = 0.0;
	$prob = $total/52.0;
	return $prob;
}

sub getPlayers{
	my ($self) = @_;
	print "into here\n";
	my @check_player = $self->{@players};
	print "@check_player\n";
	return $self->{@players};
}

sub getName{
	my ($self) = @_;
	return $self->{name};
}

sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;
