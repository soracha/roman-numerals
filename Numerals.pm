#!/usr/bin/perl

package Numerals;

sub new {
	my $class = shift;
	my $self = {};

	bless $self ,$class;
	return $self;
}

sub convert {
	my ($self,$number) = @_;

	split_digit($number);

	return "";
}

sub split_digit {
	return "";
}

sub calculate {
	return "";
}

1;