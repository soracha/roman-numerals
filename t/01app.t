#!/usr/bin/perl

use diagnostics;
use Numerals;
use Test::More qw(no_plan);

use_ok('Numerals');

my $obj = new Numerals();
is($obj->convert(1),    "I", "Converted OK");
is($obj->convert(5),    "V", "Converted OK");
is($obj->convert(10),   "X", "Converted OK");
is($obj->convert(50),   "L", "Converted OK");
is($obj->convert(100),  "C", "Converted OK");
is($obj->convert(500),  "D", "Converted OK");
is($obj->convert(1000), "M", "Converted OK");