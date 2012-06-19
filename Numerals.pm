#!/usr/bin/perl

package Numerals;

sub new {
	my $class = shift;
	my $self  = {};

	bless $self, $class;
	return $self;
}

sub convert {
	my ($self, $number) = @_;
	my $result		    = "";	
	my @digits          = &split_digit($number);

	foreach $digit (@digits) {
		$result .= &calculate($digit);
	}

	return "";
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
	return "";
}

1;