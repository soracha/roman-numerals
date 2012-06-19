#!/usr/bin/perl

use diagnostics;
use List::Compare;
use Test::More qw(no_plan);

use_ok('Numerals');

my $obj    = new Numerals();
my @got    = ();
my @expect = ();

@expect = (9);
@got    = $obj->split_digit(9);

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
	)->is_LequivalentR,
	"split 9"
);

@expect = (90, 9);
@got    = $obj->split_digit(99);

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
	)->is_LequivalentR,
	"split 99"
);

@expect = (900, 90, 9);
@got    = $obj->split_digit(999);

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
	)->is_LequivalentR,
	"split 999"
);

@expect = (9000, 900, 90, 9);
@got    = $obj->split_digit(9999);

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
	)->is_LequivalentR,
	"split 9999"
);

is($obj->calculate(4),    "IV", "4   => IV");
is($obj->calculate(9),    "IX", "9   => IX");
is($obj->calculate(90),   "XC", "90  => XC");
is($obj->calculate(900),  "CM", "900 => CM");

is($obj->calculate(3),    "III",  "3    => III");
is($obj->calculate(6),    "VI",   "6    => VI");
is($obj->calculate(8),    "VIII", "8    => VIII");
is($obj->calculate(2000), "MM",   "2000 => MM");

