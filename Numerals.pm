#!/usr/bin/perl

package Numerals;

# TODO: limit input not over 3000
sub new {
	my $class = shift;
	my $self  = {};

	bless $self, $class;
	return $self;
}

sub convert {
	my ($self, $number) = @_;
	my $result		    = "";	
	my @digits          = $self->split_digit($number);

	foreach $digit (@digits) {
		$result .= $self->calculate($digit);
	}

	return $result;
}

sub split_digit {
	my ($self, $number) = @_;
	my @nums            = split(//, "$number");
	my $multiply        = $#nums;

	for my $i (0..$multiply) {
		$nums[$i] = $nums[$i] * (10 ** $multiply);
		$multiply--;
	}

	return @nums;
}

sub calculate {
	my ($self, $input) = @_;

	if ($input >= 1000) { 
		return "M" x ($input/1000);
	}
	elsif ($input >= 100) {
		if ($input == 900) 	  	{ return "CM"; }
		elsif ($input == 500)	{ return "D"; }
		elsif ($input == 400) 	{ return "CD"; }
		elsif ($input > 500) 	{ return "D" . ( "C" x (($input - 500)/100)); }
		return "C" x ($input/100);
	}

	elsif ($input >= 10) {
		if($input == 90) 	{ return "XC"; }
		elsif($input == 50) { return "L"; }
		elsif($input == 40) { return "XL"; }
		elsif($input > 50) 	{ return "L" . ("X" x (($input - 50)/10)); }
		return "X" x ($input/10);
	}

	elsif($input == 9) 	{ return "IX"; }
	elsif($input == 5) 	{ return "V"; }
	elsif($input == 4) 	{ return "IV"; }
	elsif($input > 5) 	{ return "V" . ("I" x ($input - 5)); }

	return "I" x ($input);
}

1;