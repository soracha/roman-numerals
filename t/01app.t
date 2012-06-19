#!/usr/bin/perl

use diagnostics;
use Numerals;
use Test::More qw(no_plan);

use_ok('Numerals');

my $obj = new Numerals();

is($obj->split_digit(9),    9,    "9    => 9");
is($obj->split_digit(99),   99,   "99   => 99");
is($obj->split_digit(999),  999,  "999  => 999");
is($obj->split_digit(9999), 9999, "9999 => 9999");

is($obj->convert(1),    "I", "1    => I");
is($obj->convert(5),    "V", "5    => V");
is($obj->convert(10),   "X", "10   => X");
is($obj->convert(50),   "L", "50   => L");
is($obj->convert(100),  "C", "100  => C");
is($obj->convert(500),  "D", "500  => D");
is($obj->convert(1000), "M", "1000 => M");

# is($obj->convert(2),    "II", "2    => II");
# is($obj->convert(20),   "XX", "20   => XX");
# is($obj->convert(200),  "CC", "200  => CC");
# is($obj->convert(2000), "MM", "2000 => MM");