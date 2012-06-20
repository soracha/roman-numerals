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

is($obj->convert(3), "III", "3  => III");
is($obj->convert(6), "VI",  "6  => VI");
is($obj->convert(9), "IX",  "9  => IX");

is($obj->convert(11), "XI",  "11  => XI");
is($obj->convert(14), "XIV", "14  => XIV");
is($obj->convert(15), "XV",  "15  => XV");
is($obj->convert(19), "XIX", "19  => XIX");

is($obj->convert(51), "LI",  "51  => LI");
is($obj->convert(55), "LV",  "55  => LV");
is($obj->convert(56), "LVI", "56  => LIV");
is($obj->convert(59), "LIX", "59  => LIX");

is($obj->convert(91), "XCI",  "91  => XCI");
is($obj->convert(94), "XCIV", "94  => XCIV");
is($obj->convert(95), "XCV",  "95  => XCV");
is($obj->convert(99), "XCIX", "99  => XCIX");

is($obj->convert(111), "CXI",  "111  => CXI");
is($obj->convert(115), "CXV",  "115  => CXV");
is($obj->convert(116), "CXVI", "116  => CXVI");
is($obj->convert(119), "CXIX", "119  => CXIX");

is($obj->convert(251), "CCLI",  "251  => CCLI");
is($obj->convert(254), "CCLIV", "254  => CCLIV");
is($obj->convert(255), "CCLV",  "255  => CCLV");
is($obj->convert(259), "CCLIX", "259  => CCLIX");

is($obj->convert(591), "DXCI",  "591  => DCMI");
is($obj->convert(594), "DXCIV", "594  => DCMIV");
is($obj->convert(595), "DXCV",  "595  => DCMV");
is($obj->convert(599), "DXCIX", "599  => DCMIX");

is($obj->convert(791), "DCCXCI",  "791  => DCCXCI");
is($obj->convert(795), "DCCXCV",  "795  => DCCXCV");
is($obj->convert(796), "DCCXCVI", "796  => DCCXCVI");
is($obj->convert(799), "DCCXCIX", "799  => DCCXCIX");

is($obj->convert(2591), "MMDXCI",  "2591  => MMDXCI");
is($obj->convert(2595), "MMDXCV",  "2595  => MMDXCV");
is($obj->convert(2596), "MMDXCVI", "2596  => MMDXCVI");
is($obj->convert(2599), "MMDXCIX", "2599  => MMDXCIX");

is($obj->convert(31),   "XXXI",     "31   => XXXI");
is($obj->convert(369),  "CCCLXIX",  "369  => CCCLXIX");
is($obj->convert(369),  "CCCLXIX",  "679  => DCLXXIX");
is($obj->convert(448),  "CDXLVIII", "448  => CDXLVIII");
is($obj->convert(1999), "MCMXCIX",  "1999 => MCMXCIX");

