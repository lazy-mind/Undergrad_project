#!/usr/bin/perl

# This will print "Hello World"

=bigin comment
	with "=" we can add blocks of comment
	with "=cut" we can end a block of comment
=cut



print "Hello, world\n";

$document = <<"Demo";

In this demo,
we show how to use <<"HERE" style to store a block of content
the <<"HERE" must have no space
and the whole paragraph will end with HERE
Demo
print ("$document\n");

$identifier = <<"Identifiers";

In perl, identifiers should start with 
\$ for scalar  ---> number, string, reference
@ for array   ---> index start with 0
% for hashes  ---> key-value pairs
followed by letters , underscores, digit
Identifiers
print ("$identifier\n");

#scalar variable:
$age = 20;
$name = "Michael";

#array:
@age = (10,20,30);
@names = ("John", "Paul");

#hashes
%data = ('John',45,'Lisa',30);
${'Lisa'} = 45;

#v-string
$smile = v9786;
$foo = v102.111.121;
print "smile = $smile\n";
print "foo   = $foo\n";

print "File name ". __FILE__ . "\n";
print "Line Number " . __LINE__ ."\n";
print "Package " . __PACKAGE__ ."\n";
# they can not be interpolated
print "__FILE__ __LINE__ __PACKAGE__\n";

@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

print "$days[0]\n";
print "$days[1]\n";
print "$days[2]\n";
print "$days[6]\n";
print "$days[-1]\n";
print "$days[-7]\n";

@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);

print "@var_10\n";   # Prints number from 1 to 10
print "@var_20\n";   # Prints number from 10 to 20
print "@var_abc\n";  # Prints number from a to z

@array = (1,2,3);
$array[50] = 4;

$size = @array;
$max_index = $#array;

print "Size:  $size\n";
print "Max Index: $max_index\n";


# create a simple array
@coins = ("Quarter","Dime","Nickel");
print "1. \@coins  = @coins\n";

# add one element at the end of the array
push(@coins, "Penny");
print "2. \@coins  = @coins\n";

# add one element at the beginning of the array
unshift(@coins, "Dollar");
print "3. \@coins  = @coins\n";

# remove one element from the last of the array.
pop(@coins);
print "4. \@coins  = @coins\n";

# remove one element from the beginning of the array.
shift(@coins);
print "5. \@coins  = @coins\n";

@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

@weekdays = @days[3..5];

print "@weekdays\n";

@nums = (1..20);
print "Before - @nums\n";

splice(@nums, 5, 5, 21..25); 
print "After - @nums\n";

# define Strings
$var_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
$var_names = "Larry,David,Roger,Ken,Michael,Tom";

# transform above strings into arrays.
@string = split('-', $var_string);
@names  = split(',', $var_names);

print "$string[3]\n";  # This will print Roses
print "$names[4]\n";   # This will print Michael


# define Strings
$var_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
$var_names = "Larry,David,Roger,Ken,Michael,Tom";

# transform above strings into arrays.
@string = split('-', $var_string);
@names  = split(',', $var_names);

$string1 = join( '-', @string );
$string2 = join( ',', @names );

print "$string1\n";
print "$string2\n";



# define an array
@foods = qw(pizza steak chicken burgers);
print "Before: @foods\n";

# sort this array
@foods = sort(@foods);
print "After: @foods\n";



# define an array
@foods = qw(pizza steak chicken burgers);
print "Foods: @foods\n";

# Let's reset first index of all the arrays.
$[ = 1;

print "Food at \@foods[1]: $foods[1]\n";
print "Food at \@foods[2]: $foods[2]\n";



@odd = (1,3,5);
@even = (2, 4, 6);

@numbers = (@odd, @even);

print "numbers = @numbers\n";


$var = (5,4,3,2,1)[4];

print "value of var = $var\n"