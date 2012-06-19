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

# is($obj->calculate(4),    9,    "9    => 9");
# is($obj->calculate(9),    9,    "9    => 9");
# is($obj->calculate(99),   99,   "99   => 99");
# is($obj->calculate(999),  999,  "999  => 999");
# is($obj->calculate(9999), 9999, "9999 => 9999");

# is($obj->convert(1),    "I", "1    => I");
# is($obj->convert(5),    "V", "5    => V");
# is($obj->convert(10),   "X", "10   => X");
# is($obj->convert(50),   "L", "50   => L");
# is($obj->convert(100),  "C", "100  => C");
# is($obj->convert(500),  "D", "500  => D");
# is($obj->convert(1000), "M", "1000 => M");

# is($obj->convert(2),    "II", "2    => II");
# is($obj->convert(20),   "XX", "20   => XX");
# is($obj->convert(200),  "CC", "200  => CC");
# is($obj->convert(2000), "MM", "2000 => MM");