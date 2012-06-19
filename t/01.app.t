#!/usr/bin/perl

#use diagnostics;
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

is($obj->convert(1),    "I", "1    => I");
is($obj->convert(5),    "V", "5    => V");
is($obj->convert(10),   "X", "10   => X");
is($obj->convert(50),   "L", "50   => L");
is($obj->convert(100),  "C", "100  => C");
is($obj->convert(500),  "D", "500  => D");
is($obj->convert(1000), "M", "1000 => M");

is($obj->convert(2),    "II", "2    => II");
is($obj->convert(20),   "XX", "20   => XX");
is($obj->convert(200),  "CC", "200  => CC");
is($obj->convert(2000), "MM", "2000 => MM");

is($obj->convert(31), "XXXI", "31  => XXXI");
is($obj->convert(369), "CCCLXIX", "369  => CCCLXIX");
is($obj->convert(369), "CCCLXIX", "679  => DCLXXIX");
is($obj->convert(448), "CDXLVIII", "448  => CDXLVIII");
is($obj->convert(1999), "MCMXCIX", "1999  => MCMXCIX");

