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
package Player;

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

use Scalar::Util qw(looks_like_number);

use strict;
use warnings;


our $harm = 1000;

sub new{
	my $class = shift;
	my $self = {
		name => shift,
		hp => 2000,
		dp => 500,
	};
	bless $self,$class;
	return $self;
}

# sub tellPlayerName{
# 	my $self = shift;
# 	print "a new player is created ! his name is : ",$self->{'name'},"\n";
# }


sub attackWithSword{
	my $self = shift;
	my $enermy = shift;
	local $harm = 800;
	$enermy->be_attacked();
	print $self->{'name'}," attacks ",$enermy->{'name'}," with sword.\n";
}

sub useBlackMagic{
	my $self = shift;
	my $enermy = shift;
	local $harm = 600;
	$enermy->be_attacked();
	print $self->{'name'}," uses black magic to ",$enermy->{'name'},".\n";

	my $rand = rand();
	if($rand < 0.4){
		print BRIGHT_RED "Black Magic!\n";
		print $self->{'name'}," successfully invokes another sword attack this round with power 1000 hp.\n";
		$harm = 1000;
		$enermy->be_attacked();
	}
	else{
		print BRIGHT_RED "What a pity!\n";
		print $self->{'name'}," is not lucky enough to invokes another sword attack.\n"
	}
	# random setting
}

sub isDead{
	my $self = shift;
	if($self->{'hp'}>0){return 0;}
	else{return 1;}
}

sub displayInfo{
	my $self = shift;
	print"#",$self->{'name'}," hp: ",$self->{'hp'}," dp: ",$self->{'dp'},"\n";
}

sub be_attacked{
	my $self = shift;
	my $actual_harm = 0;
	$actual_harm = $harm - $self->{'dp'};
	$self->{'hp'} -= $actual_harm;
	print "the remain hp of the enermy is : ",$self->{'hp'},"\n";
}

sub AUTOLOAD{
	print "  **********  this method haven't been implemented yet  **********  \n";
}

sub DESTORY{
	print "  @@@@@@@@@@  this class have been destoryed  @@@@@@@@@@  \n";
}

return 1;